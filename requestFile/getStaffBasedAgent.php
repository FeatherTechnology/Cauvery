<?php
include('../ajaxconfig.php');
if (isset($_POST['user_id'])) {
    $user_id = $_POST['user_id'];
}

$detailrecords = array();

$result = $connect->query("SELECT agentforstaff FROM user where status = 0 and user_id = $user_id ");
$row = $result->fetch();

if ($row && !empty($row['agentforstaff'])) {

    $agentforstaff = $row['agentforstaff'];
    $agent_ids = explode(',', $agentforstaff);

    $i = 0;

    foreach ($agent_ids as $ag) {

        if ($ag != '') {

            $qry = $connect->query("SELECT ag_id, ag_name FROM agent_creation WHERE ag_id = '$ag'");
            $agentRow = $qry->fetch();

            if ($agentRow) {
                $detailrecords[$i]['ag_id']   = $agentRow['ag_id'];
                $detailrecords[$i]['ag_name'] = $agentRow['ag_name'];
                $i++;
            }
        }
    }
}

echo json_encode($detailrecords);

// Close the database connection
$connect = null;
