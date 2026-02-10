<?php
include('../ajaxconfig.php');
if (isset($_POST['area_id'])) {
    $area = $_POST['area_id'];
}

$records = array();

$result = $connect->query("SELECT agm.group_name FROM area_group_mapping_area agmsa 
    LEFT JOIN area_group_mapping agm ON agm.map_id = agmsa.group_map_id WHERE agm.status = 0 and agmsa.area_id = $area");
$row = $result->fetch();
$records['group_name'] = $row['group_name'];

$result = $connect->query("SELECT alm.line_name FROM area_line_mapping_area almsa 
    LEFT JOIN area_line_mapping alm ON alm.map_id = almsa.line_map_id WHERE alm.status = 0 and almsa.area_id = $area");
$row = $result->fetch();
$records['line_name'] = $row['line_name'];

echo json_encode($records);

// Close the database connection
$connect = null;