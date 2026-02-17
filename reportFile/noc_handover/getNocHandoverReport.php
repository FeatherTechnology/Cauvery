<?php
session_start();
include '../../ajaxconfig.php';

if (isset($_SESSION["userid"])) {
    $userid = $_SESSION["userid"];
    $report_access = '2'; //if super Admin login use need to show overall.
}

$user_based = "";
$where = "";

/* ---------------- USER ACCESS ---------------- */
if ($userid != 1) {

    $userQry = $connect->query("
        SELECT group_id, line_id, due_followup_lines, report_access, noc_mapping_access 
        FROM USER 
        WHERE user_id = $userid
    ");
    $rowuser = $userQry->fetch();

    $report_access = $rowuser['report_access'];
    $accessType    = $rowuser['noc_mapping_access'];
    $area_ids  = [];

    if ($report_access == '1') {

        /* 🔹 GROUP BASED */
        if ($accessType == 1) {
            $group_ids = explode(',', $rowuser['group_id']);
            foreach ($group_ids as $group) {
                $groupQry = $connect->query("
                    SELECT area_id 
                    FROM area_group_mapping_area
                    WHERE group_map_id = $group
                ");
                if ($row = $groupQry->fetch()) {
                    $area_ids = array_merge($area_ids, explode(',', $row['area_id']));
                }
            }
        }

        /* 🔹 LINE BASED */
        elseif ($accessType == 2) {
            $line_ids = explode(',', $rowuser['line_id']);
            foreach ($line_ids as $line) {
                $lineQry = $connect->query("
                    SELECT area_id 
                    FROM area_line_mapping_area
                    WHERE line_map_id = $line
                ");
                if ($row = $lineQry->fetch()) {
                    $area_ids = array_merge($area_ids, explode(',', $row['area_id']));
                }
            }
        }

        /* 🔹 DUE FOLLOWUP BASED */
        elseif ($accessType == 3) {
            $due_ids = explode(',', $rowuser['due_followup_lines']);
            foreach ($due_ids as $due) {
                $dueQry = $connect->query("
                    SELECT area_id 
                    FROM area_duefollowup_mapping_area
                    WHERE duefollowup_map_id = $due
                ");
                if ($row = $dueQry->fetch()) {
                    $area_ids = array_merge($area_ids, explode(',', $row['area_id']));
                }
            }
        }

        $area_ids  = array_unique(array_filter($area_ids));
        $area_list = implode(',', $area_ids);

        $colName ="cp.area_confirm_area";
           

        if ($area_list != '') {
            $user_based = " AND $colName IN ($area_list) ";
        }
    }
}

/* ---------------- DATE FILTER ---------------- */
if (!empty($_POST['from_date']) && !empty($_POST['to_date'])) {
    $from_date = date('Y-m-d', strtotime($_POST['from_date']));
    $to_date   = date('Y-m-d', strtotime($_POST['to_date']));
    $where .= " 
        AND DATE(nc.noc_handover_date) 
        BETWEEN '$from_date' AND '$to_date'
    ";
}

$where .= $user_based;


$column = array(
    'nc.noc_id',
    'ii.loan_id',
    'ad.doc_id',
    'ii.cus_id',
    'cr.autogen_cus_id',
    'CONCAT(cp.first_name, " ", cp.last_name)',
    'al.area_name',
    'alm.line_name',
    'bc.branch_name',
    'nc.noc_handover_date',
    'nc.noc_id',
    'CONCAT(fam.first_name, " ", fam.last_name)',
    'fam.relationship'
);

$query = "SELECT 
        ii.loan_id,
        ad.doc_id,
        cp.cus_id,
        cr.autogen_cus_id,
        CONCAT(cp.first_name, ' ', cp.last_name) AS cus_name,
        CONCAT(fam.first_name, ' ', fam.last_name) AS famname,
        fam.relationship,
        al.area_name,
        alm.line_name,
        bc.branch_name,
        nc.update_login_id,
        nc.noc_handover_date,
        nc.noc_member,
        nc.mem_name
        FROM in_issue ii
        JOIN customer_register cr ON ii.cus_id = cr.cus_id
        LEFT JOIN acknowlegement_customer_profile cp ON ii.req_id = cp.req_id
        LEFT JOIN acknowlegement_documentation ad ON ii.req_id = ad.req_id
        LEFT JOIN noc nc ON nc.req_id = ii.req_id
        LEFT JOIN area_list_creation al ON cp.area_confirm_area = al.area_id
        JOIN area_line_mapping_area alma ON alma.area_id = al.area_id
        JOIN area_line_mapping alm ON alm.map_id = alma.line_map_id
        JOIN branch_creation bc ON alm.branch_id = bc.branch_id
        LEFT JOIN request_creation req ON ii.req_id = req.req_id
        LEFT JOIN verification_family_info fam ON nc.noc_member ='3' AND nc.mem_name = fam.id AND nc.cus_id = fam.cus_id
        WHERE ii.cus_status >= 24 
        $where";

if (isset($_POST['search'])) {
    if ($_POST['search'] != "") {

        $query .= " and (ii.loan_id LIKE '" . $_POST['search'] . "%' 
            OR ad.doc_id LIKE '%" . $_POST['search'] . "%'
            OR ii.cus_id LIKE '%" . $_POST['search'] . "%'
            OR cr.autogen_cus_id LIKE '%" . $_POST['search'] . "%'
            OR CONCAT(cp.first_name, ' ', cp.last_name) LIKE '%" . $_POST['search'] . "%' 
            OR CONCAT(fam.first_name, ' ', fam.last_name) LIKE '%" . $_POST['search'] . "%' 
            OR fam.relationship LIKE '%" . $_POST['search'] . "%' 
            OR al.area_name LIKE '%" . $_POST['search'] . "%' 
            OR alm.line_name LIKE '%" . $_POST['search'] . "%' 
            OR bc.branch_name LIKE '%" . $_POST['search'] . "%' 
            OR nc.noc_handover_date LIKE '%" . $_POST['search'] . "%') ";
    }
}

$query .= " GROUP BY ii.req_id";

if (isset($_POST['order'])) {
    $query .= " ORDER BY " . $column[$_POST['order']['0']['column']] . ' ' . $_POST['order']['0']['dir'];
} else {
    $query .= ' ';
}
$query1 = '';
if (!isset($_POST['download'])) {
    if ($_POST['length'] != -1) {
        $query1 = " LIMIT " . $_POST['start'] . ", " . $_POST['length'];
    }
}
$statement = $connect->prepare($query);

$statement->execute();

$number_filter_row = $statement->rowCount();

$statement = $connect->prepare($query . $query1);

$statement->execute();

$result = $statement->fetchAll();

$data = array();
$sno = 1;

foreach ($result as $row) {
    $user_id = $row['update_login_id'];
    $usernameqry = $connect->query("SELECT us.fullname FROM user us WHERE us.user_id = '$user_id' ");
    $row1 = $usernameqry->fetch();
    $user_name = $row1['fullname'];
    $sub_array   = array();
    $sub_array[] = $sno;
    $sub_array[] = $row['loan_id'];
    $sub_array[] = $row['doc_id'];
    $sub_array[] = $row['cus_id'];
    $sub_array[] = $row['autogen_cus_id'];
    $sub_array[] = $row['cus_name'];
    $sub_array[] = $row['area_name'];
    $sub_array[] = $row['line_name'];
    $sub_array[] = $row['branch_name'];
    $sub_array[] = date('d-m-Y', strtotime($row['noc_handover_date']));
    $sub_array[] = $user_name;
    if ($row['noc_member'] == '1') {
        $sub_array[] = $row['mem_name'];
        $sub_array[] = 'Customer';
    } elseif ($row['noc_member'] == '2') {
        $sub_array[] = $row['mem_name'];
        $sub_array[] = 'Guarantor';
    } else {
        $sub_array[] = $row['famname'];
        $sub_array[] = $row['relationship'];
    }


    $data[]      = $sub_array;
    $sno = $sno + 1;
}

$output = array(
     'draw' => isset($_POST['draw']) ? intval($_POST['draw']) : 0, // ✅ safe for both table & download,
    'recordsTotal' => count_all_data($connect),
    'recordsFiltered' => $number_filter_row,
    'data' => $data
);

echo json_encode($output);

function count_all_data($connect)
{
    $query = "SELECT noc_id from noc WHERE cus_status >= 24 ";
    $statement = $connect->prepare($query);
    $statement->execute();
    return $statement->rowCount();
}



