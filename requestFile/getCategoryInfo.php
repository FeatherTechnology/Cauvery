<?php
include('../ajaxconfig.php');

if (isset($_POST['loan_category'])) {
    $loan_category = $_POST['loan_category'];
}

$detailrecords = array();

$result = $connect->query("SELECT loan_category_id FROM loan_category WHERE loan_category_name = '" . strip_tags($loan_category) . "' ");
while ($row = $result->fetch()) {
    $loan_category_id = $row['loan_category_id'];
}

$i = 0;
$qry = $connect->query("SELECT loan_category_ref_name From loan_category_ref WHERE loan_category_id = '" . $loan_category_id . "' ");
while ($row = $qry->fetch()) {
    $detailrecords[$i]['loan_category_ref_name'] = $row['loan_category_ref_name'];
    $i++;
}

echo json_encode($detailrecords);

// Close the database connection
$connect = null;