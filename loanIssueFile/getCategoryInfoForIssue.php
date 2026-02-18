<?php
session_start();
include('../ajaxconfig.php');

if (isset($_POST['req_id'])) {
    $req_id = $_POST['req_id'];
}

$detailrecords = array();


$result = $connect->query("SELECT * FROM acknowledgement_loan_cal_category where req_id = $req_id ");
$i = 0;
while ($row = $result->fetch()) {
    $detailrecords[$i] = $row['category'];
    $i++;
}

echo json_encode($detailrecords);

// Close the database connection
$connect = null;
