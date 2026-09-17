<?php
include '../ajaxconfig.php';
include '../moneyFormatIndia.php';

$req_id = isset($_POST['req_id']) ? (int)$_POST['req_id'] : 0;

if ($req_id <= 0) {
    echo '<div class="alert alert-danger">Invalid Request ID</div>';
    exit;
}


/*
|--------------------------------------------------------------------------
| Helper Functions
|--------------------------------------------------------------------------
*/

function validCollectionDate($date)
{
    return !empty($date)
        && $date !== '0000-00-00'
        && $date !== '0000-00-00 00:00:00';
}


/*
 * CURRENT CODE PRIORITY:
 * trans_date if valid
 * otherwise coll_date
 */
function collectionEffectiveDate($row)
{
    if (validCollectionDate($row['trans_date'])) {
        return substr($row['trans_date'], 0, 10);
    }

    if (validCollectionDate($row['coll_date'])) {
        return substr($row['coll_date'], 0, 10);
    }

    return null;
}


/*
|--------------------------------------------------------------------------
| IMPORTANT
|--------------------------------------------------------------------------
| These conditions are kept according to the CURRENT AJAX PAGE.
|
| Monthly:
| due_amt_track OR princ_amt_track OR int_amt_track
| OR pre_close_waiver OR principal_waiver OR interest_waiver
|
| Weekly:
| due_amt_track OR pre_close_waiver OR princ_amt_track
|
| Daily:
| due_amt_track OR pre_close_waiver
|--------------------------------------------------------------------------
*/

function collectionHasTrack($row, $scheme)
{
    // MONTHLY
    if ($scheme == '1') {
        return (
            $row['due_amt_track'] !== '' ||
            $row['princ_amt_track'] !== '' ||
            $row['int_amt_track'] !== '' ||
            $row['pre_close_waiver'] !== '' ||
            $row['principal_waiver'] !== '' ||
            $row['interest_waiver'] !== ''
        );
    }

    // WEEKLY
    if ($scheme == '2') {
        return (
            $row['due_amt_track'] !== '' ||
            $row['pre_close_waiver'] !== '' ||
            $row['princ_amt_track'] !== ''
        );
    }

    // DAILY
    if ($scheme == '3') {
        return (
            $row['due_amt_track'] !== '' ||
            $row['pre_close_waiver'] !== ''
        );
    }

    return false;
}


/*
|--------------------------------------------------------------------------
| Future collection conditions
|--------------------------------------------------------------------------
| These are intentionally separate because CURRENT PAGE uses
| different conditions for Monthly / Weekly / Daily.
|--------------------------------------------------------------------------
*/

function futureCollectionHasTrack($row, $scheme)
{
    // CURRENT MONTHLY FUTURE CONDITION:
    // due_amt_track OR pre_close_waiver
    // OR principal_waiver OR interest_waiver

    if ($scheme == '1') {
        return (
            $row['due_amt_track'] !== '' ||
            $row['pre_close_waiver'] !== '' ||
            $row['principal_waiver'] !== '' ||
            $row['interest_waiver'] !== ''
        );
    }

    // CURRENT WEEKLY FUTURE CONDITION:
    // due_amt_track OR pre_close_waiver

    if ($scheme == '2') {
        return (
            $row['due_amt_track'] !== '' ||
            $row['pre_close_waiver'] !== ''
        );
    }

    // CURRENT DAILY FUTURE CONDITION:
    // due_amt_track OR pre_close_waiver

    if ($scheme == '3') {
        return (
            $row['due_amt_track'] !== '' ||
            $row['pre_close_waiver'] !== ''
        );
    }

    return false;
}


/*
|--------------------------------------------------------------------------
| Keys
|--------------------------------------------------------------------------
*/

function getMonthKey($date)
{
    return date('Y-m', strtotime($date));
}


/*
 * This is used only for grouping.
 * We also keep YEAR separately to stay close to the
 * original MySQL WEEK() + YEAR() logic.
 */
function getWeekKey($date)
{
    return date('Y-W', strtotime($date));
}


function getDayKey($date)
{
    return date('Y-m-d', strtotime($date));
}


/*
|--------------------------------------------------------------------------
| Display helpers
|--------------------------------------------------------------------------
*/

function formatRole($role)
{
    if ($role == '1') {
        return 'Director';
    }

    if ($role == '2') {
        return 'Agent';
    }

    if ($role == '3') {
        return 'Staff';
    }

    return '';
}


function formatCollectionLocation($location)
{
    if ($location == '1') {
        return 'By Self';
    }

    if ($location == '2') {
        return 'On Spot';
    }

    if ($location == '3') {
        return 'Bank Transfer';
    }

    return '';
}


/*
|--------------------------------------------------------------------------
| LOAN DETAILS
|--------------------------------------------------------------------------
|
| Same information as CURRENT PAGE:
|
| 1. acknowlegement_loan_calculation
| 2. in_issue
|
|--------------------------------------------------------------------------
*/

$loanQuery = "
    SELECT
        alc.due_start_from,
        alc.maturity_month,
        alc.due_method_calc,
        alc.due_method_scheme,
        alc.int_rate,
        alc.calc_method,
        alc.due_amt_cal,
        alc.int_amt_cal,
        alc.tot_amt_cal,
        alc.principal_amt_cal,
        ii.updated_date
    FROM acknowlegement_loan_calculation alc
    LEFT JOIN in_issue ii
        ON ii.req_id = alc.req_id
        AND ii.cus_status >= 14
    WHERE alc.req_id = $req_id
    LIMIT 1
";

$loanStart = $connect->query($loanQuery);

if (!$loanStart) {
    echo '<div class="alert alert-danger">
            Unable to load loan details.
          </div>';
    exit;
}

$loanFrom = $loanStart->fetch(PDO::FETCH_ASSOC);

if (!$loanFrom) {
    echo '<div class="alert alert-danger">
            Loan details not found.
          </div>';
    exit;
}


/*
|--------------------------------------------------------------------------
| Loan variables
|--------------------------------------------------------------------------
*/

$due_start_from = $loanFrom['due_start_from'];
$maturity_month = $loanFrom['maturity_month'];
$int_rate = $loanFrom['int_rate'];
$calc_method = $loanFrom['calc_method'];

$start_date_obj = DateTime::createFromFormat(
    'Y-m-d',
    $due_start_from
);

$end_date_obj = DateTime::createFromFormat(
    'Y-m-d',
    $maturity_month
);

$maturity_month_obj = new DateTime($maturity_month);

if (!$start_date_obj || !$end_date_obj) {
    echo '<div class="alert alert-danger">
            Invalid loan date.
          </div>';
    exit;
}


/*
|--------------------------------------------------------------------------
| Determine loan type
|--------------------------------------------------------------------------
*/

if (
    $loanFrom['tot_amt_cal'] === '' ||
    $loanFrom['tot_amt_cal'] === null
) {
    $loan_amt = (int)$loanFrom['principal_amt_cal'];
    $loan_type = 'Interest';
} else {
    $loan_amt = (int)$loanFrom['tot_amt_cal'];
    $loan_type = 'emi';
}


$due_amt_1 = (int)$loanFrom['due_amt_cal'];

if ($loan_type == 'Interest') {
    $princ_amt_1 = (int)$loanFrom['principal_amt_cal'];
    $due_amt_1 = (int)$loanFrom['int_amt_cal'];
}

$issue_date = $loanFrom['updated_date'];


/*
|--------------------------------------------------------------------------
| Determine interval
|--------------------------------------------------------------------------
*/

$interval = null;

if (
    $loanFrom['due_method_calc'] == 'Monthly' ||
    $loanFrom['due_method_scheme'] == '1'
) {
    $interval = new DateInterval('P1M');
} elseif (
    $loanFrom['due_method_scheme'] == '2'
) {
    $interval = new DateInterval('P1W');
} elseif (
    $loanFrom['due_method_scheme'] == '3'
) {
    $interval = new DateInterval('P1D');
}


/*
|--------------------------------------------------------------------------
| Build Due Month Array
|--------------------------------------------------------------------------
*/

$dueMonth = [];

$dueMonth[] = $due_start_from;

if ($interval !== null) {

    while ($start_date_obj < $end_date_obj) {

        $start_date_obj->add($interval);

        $newDueDate = $start_date_obj->format('Y-m-d');

        if (!in_array($newDueDate, $dueMonth, true)) {
            $dueMonth[] = $newDueDate;
        }
    }
}


/*
|--------------------------------------------------------------------------
| LOAD ALL COLLECTION DATA ONLY ONCE
|--------------------------------------------------------------------------
|
| This is the main performance optimization.
|
| CURRENT PAGE:
|   - before due query
|   - every due-period query
|   - future query
|
| UPDATED PAGE:
|   - ONE collection query
|   - process the rows in PHP
|
|--------------------------------------------------------------------------
*/

$collectionQuery = "
    SELECT
        c.coll_id,
        c.coll_code,
        c.due_amt,
        c.tot_amt,
        c.pending_amt,
        c.payable_amt,
        c.coll_date,
        c.trans_date,
        c.due_amt_track,
        c.princ_amt_track,
        c.int_amt_track,
        c.bal_amt,
        c.coll_charge_track,
        c.coll_location,
        c.pre_close_waiver,
        c.principal_waiver,
        c.interest_waiver,
        u.fullname,
        u.role
    FROM collection c
    LEFT JOIN user u
        ON c.insert_login_id = u.user_id
    WHERE c.req_id = $req_id
    ORDER BY c.coll_id ASC
";

$collectionRun = $connect->query($collectionQuery);

if (!$collectionRun) {
    echo '<div class="alert alert-danger">
            Unable to load collection details.
          </div>';
    exit;
}

$allCollections = [];

while ($collectionRow = $collectionRun->fetch(PDO::FETCH_ASSOC)) {
    $allCollections[] = $collectionRow;
}


/*
|--------------------------------------------------------------------------
| Group collections
|--------------------------------------------------------------------------
*/

$collectionsByMonth = [];
$collectionsByWeek = [];
$collectionsByDay = [];

foreach ($allCollections as $row) {

    $effectiveDate = collectionEffectiveDate($row);

    if ($effectiveDate === null) {
        continue;
    }


    /*
     * MONTH
     */
    $monthKey = getMonthKey($effectiveDate);

    if (!isset($collectionsByMonth[$monthKey])) {
        $collectionsByMonth[$monthKey] = [];
    }

    $collectionsByMonth[$monthKey][] = $row;


    /*
     * WEEK
     */
    $weekKey = getWeekKey($effectiveDate);

    if (!isset($collectionsByWeek[$weekKey])) {
        $collectionsByWeek[$weekKey] = [];
    }

    $collectionsByWeek[$weekKey][] = $row;


    /*
     * DAY
     */
    $dayKey = getDayKey($effectiveDate);

    if (!isset($collectionsByDay[$dayKey])) {
        $collectionsByDay[$dayKey] = [];
    }

    $collectionsByDay[$dayKey][] = $row;
}


/*
|--------------------------------------------------------------------------
| BEFORE DUE START COLLECTIONS
|--------------------------------------------------------------------------
*/

$beforeDueCollections = [];

$issued = date(
    'Y-m-d',
    strtotime($issue_date)
);

$dueStartDate = date(
    'Y-m-d',
    strtotime($due_start_from)
);


foreach ($allCollections as $row) {

    /*
     * IMPORTANT:
     * Use exact scheme condition from current page.
     */
    if (
        !collectionHasTrack(
            $row,
            $loanFrom['due_method_scheme']
        )
    ) {
        continue;
    }


    $collDate = validCollectionDate($row['coll_date'])
        ? substr($row['coll_date'], 0, 10)
        : null;

    $transDate = validCollectionDate($row['trans_date'])
        ? substr($row['trans_date'], 0, 10)
        : null;

    $includeBefore = false;


    /*
    |--------------------------------------------------------------------------
    | MONTHLY BEFORE DUE
    |--------------------------------------------------------------------------
    |
    | Current:
    |
    | coll_date before due_start
    | OR
    | trans_date before due_start
    |
    |--------------------------------------------------------------------------
    */

    if (
        $loanFrom['due_method_calc'] == 'Monthly' ||
        $loanFrom['due_method_scheme'] == '1'
    ) {

        if (
            ($collDate !== null && $collDate < $dueStartDate) ||
            ($transDate !== null && $transDate < $dueStartDate)
        ) {
            $includeBefore = true;
        }
    }


    /*
    |--------------------------------------------------------------------------
    | WEEKLY BEFORE DUE
    |--------------------------------------------------------------------------
    |
    | Keep weekly separate.
    |--------------------------------------------------------------------------
    */

    elseif (
        $loanFrom['due_method_scheme'] == '2'
    ) {

        if ($collDate !== null) {

            if (
                getWeekKey($collDate) >= getWeekKey($issued) &&
                getWeekKey($collDate) < getWeekKey($dueStartDate) &&
                date('Y', strtotime($collDate)) >=
                date('Y', strtotime($issued))
            ) {
                $includeBefore = true;
            }
        }


        if ($transDate !== null) {

            if (
                getWeekKey($transDate) >= getWeekKey($issued) &&
                getWeekKey($transDate) < getWeekKey($dueStartDate) &&
                date('Y', strtotime($transDate)) >=
                date('Y', strtotime($issued))
            ) {
                $includeBefore = true;
            }
        }
    }


    /*
    |--------------------------------------------------------------------------
    | DAILY BEFORE DUE
    |--------------------------------------------------------------------------
    */

    elseif (
        $loanFrom['due_method_scheme'] == '3'
    ) {

        if (
            $collDate !== null &&
            $collDate >= $issued &&
            $collDate < $dueStartDate
        ) {
            $includeBefore = true;
        }


        if (
            $transDate !== null &&
            $transDate >= $issued &&
            $transDate < $dueStartDate
        ) {
            $includeBefore = true;
        }
    }


    if ($includeBefore) {
        $beforeDueCollections[] = $row;
    }
}

?>


<table
    class="table custom-table table-responsive"
    id="dueChartListTable"
>

<thead>

<tr>

<th width="15">Due No</th>

<th width="8%">Due Month</th>

<th>Month</th>

<?php if ($loan_type == 'emi') { ?>

    <th>Due Amount</th>

<?php } ?>

<?php if ($loan_type == 'Interest') { ?>

    <th>Principal</th>
    <th>Interest</th>

<?php } ?>

<th>Pending</th>

<th>Payable</th>

<th>Collection Date</th>

<?php if ($loan_type == 'emi') { ?>

    <th>Collection Amount</th>

<?php } ?>

<?php if ($loan_type == 'Interest') { ?>

    <th>Principal Amount</th>
    <th>Interest Amount</th>

<?php } ?>

<th>Balance Amount</th>

<?php if ($loan_type == 'emi') { ?>

    <th>Pre Closure</th>

<?php } ?>

<?php if ($loan_type == 'Interest') { ?>

    <th>Principal Waiver</th>
    <th>Interest Waiver</th>

<?php } ?>

<th>Role</th>

<th width="8%">User ID</th>

<th>Collection Method</th>

<th>ACTION</th>

</tr>

</thead>


<tbody>


<!--
|--------------------------------------------------------------------------
| LOAN START ROW
|--------------------------------------------------------------------------
-->

<tr>

<td></td>

<td>

<?php

if (
    $loanFrom['due_method_calc'] == 'Monthly' ||
    $loanFrom['due_method_scheme'] == '1'
) {

    echo date(
        'm-Y',
        strtotime($issue_date)
    );

} else {

    echo date(
        'd-m-Y',
        strtotime($issue_date)
    );
}

?>

</td>


<td>

<?php

echo date(
    'M',
    strtotime($issue_date)
);

?>

</td>


<?php if ($loan_type == 'emi') { ?>

    <td></td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

    <td></td>
    <td></td>

<?php } ?>


<td></td>

<td></td>

<td></td>


<?php if ($loan_type == 'emi') { ?>

    <td></td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

    <td></td>
    <td></td>

<?php } ?>


<td>

<?php

echo moneyFormatIndia(
    $loan_amt
);

?>

</td>


<td></td>


<?php if ($loan_type == 'Interest') { ?>

    <td></td>

<?php } ?>


<td></td>

<td></td>

<td></td>

<td></td>

</tr>


<?php


/*
|--------------------------------------------------------------------------
| INITIAL VARIABLES
|--------------------------------------------------------------------------
*/

$totalPaid = 0;

$totalPreClose = 0;

$totalpaid = 0;

$totalPaidPrinc = 0;

$due_amt_track = 0;

$waiver = 0;

$principal_waiver = 0;

$interest_waiver = 0;

$last_bal_amt = 0;

$bal_amt = $loan_amt;


/*
|--------------------------------------------------------------------------
| BEFORE DUE PROCESSING
|--------------------------------------------------------------------------
*/

foreach ($beforeDueCollections as $row) {

    $role = $row['role'];

    $collectionAmnt =
        (int)$row['due_amt_track'];

    $due_amt_track +=
        (int)$row['due_amt_track'];

    $waiver +=
        (int)$row['pre_close_waiver'];

    $principal_waiver +=
        (int)$row['principal_waiver'];


    $PcollectionAmnt = 0;

    $IcollectionAmnt = 0;

    $InterestwaiverAmnt = 0;


    /*
     * INTEREST
     */

    if ($loan_type == 'Interest') {

        $PcollectionAmnt =
            (int)$row['princ_amt_track'];

        $IcollectionAmnt =
            (int)$row['int_amt_track'];

        $InterestwaiverAmnt =
            (int)$row['interest_waiver'];


        if ($last_bal_amt != 0) {

            $bal_amt =
                $last_bal_amt
                - $PcollectionAmnt
                - $principal_waiver;

        } else {

            $bal_amt =
                $loan_amt
                - $PcollectionAmnt
                - $principal_waiver;
        }

    }


    /*
     * EMI
     */

    else {

        $bal_amt =
            $loan_amt
            - $due_amt_track
            - $waiver;
    }

?>


<tr>

<td></td>

<td></td>

<td></td>


<?php if ($loan_type == 'emi') { ?>

    <td></td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

    <td></td>
    <td></td>

<?php } ?>


<td>

<?php

echo (int)$row['pending_amt'];

?>

</td>


<td>

<?php

echo (int)$row['payable_amt'];

?>

</td>


<td>

<?php

$displayDate =
    validCollectionDate($row['trans_date'])
        ? $row['trans_date']
        : $row['coll_date'];

echo date(
    'd-m-Y',
    strtotime($displayDate)
);

?>

</td>


<!-- EMI COLLECTION -->

<?php if ($loan_type == 'emi') { ?>

<td>

<?php

if ($row['due_amt_track'] > 0) {

    $totalPaid +=
        $row['due_amt_track'];

    echo $row['due_amt_track'];

} elseif ($row['pre_close_waiver'] > 0) {

    $totalPreClose +=
        $row['pre_close_waiver'];

    echo $row['pre_close_waiver'];
}

?>

</td>

<?php } ?>


<!-- INTEREST COLLECTION -->

<?php if ($loan_type == 'Interest') { ?>

<td>

<?php

if ($PcollectionAmnt > 0) {

    $totalPaidPrinc +=
        $PcollectionAmnt;

    echo moneyFormatIndia(
        $PcollectionAmnt
    );

} else {

    echo 0;
}

?>

</td>


<td>

<?php

if ($IcollectionAmnt > 0) {

    echo moneyFormatIndia(
        $IcollectionAmnt
    );

} else {

    echo 0;
}

?>

</td>

<?php } ?>


<td>

<?php

echo moneyFormatIndia(
    $bal_amt
);

?>

</td>


<?php if ($loan_type != 'Interest') { ?>

<td>

<?php

if ($row['pre_close_waiver'] > 0) {

    echo moneyFormatIndia(
        $row['pre_close_waiver']
    );

} else {

    echo '0';
}

?>

</td>

<?php } else { ?>


<td>

<?php

if ($row['principal_waiver'] > 0) {

    echo moneyFormatIndia(
        $row['principal_waiver']
    );

} else {

    echo '0';
}

?>

</td>


<td>

<?php

if ($InterestwaiverAmnt > 0) {

    echo moneyFormatIndia(
        $InterestwaiverAmnt
    );

} else {

    echo 0;
}

?>

</td>

<?php } ?>


<td>

<?php

echo formatRole($role);

?>

</td>


<td>

<?php

echo htmlspecialchars(
    $row['fullname'] ?? ''
);

?>

</td>


<td>

<?php

echo formatCollectionLocation(
    $row['coll_location']
);

?>

</td>


<td>

<a
    class="print_due_coll"
    id=""
    value="<?php echo htmlspecialchars($row['coll_code']); ?>"
>

<i
    class="fa fa-print"
    aria-hidden="true"
></i>

</a>

</td>

</tr>


<?php

    if ($loan_type == 'Interest') {

        $last_bal_amt =
            $bal_amt;
    }
}


/*
|--------------------------------------------------------------------------
| Same as current page
|--------------------------------------------------------------------------
*/

if (
    $loan_type == 'Interest' &&
    $last_bal_amt == 0
) {

    $last_bal_amt =
        $loan_amt;
}


$due_amt_track = 0;

$waiver = 0;

$int = 0;

$jj = 0;

$last_int_amt =
    $due_amt_1;


if ($loan_type == 'Interest') {

    $last_princ_amt =
        $last_bal_amt;
}


$curDateChecker = true;

$i = 1;


/*
|--------------------------------------------------------------------------
| DUE PERIOD PROCESSING
|--------------------------------------------------------------------------
*/

foreach ($dueMonth as $cusDueMonth) {


    /*
    |--------------------------------------------------------------------------
    | Get collection rows for this period
    |--------------------------------------------------------------------------
    */

    if (
        $loanFrom['due_method_calc'] == 'Monthly' ||
        $loanFrom['due_method_scheme'] == '1'
    ) {

        $lookupKey =
            getMonthKey($cusDueMonth);

        $runRows =
            $collectionsByMonth[$lookupKey] ?? [];

    } elseif (
        $loanFrom['due_method_scheme'] == '2'
    ) {

        $lookupKey =
            getWeekKey($cusDueMonth);

        $runRows =
            $collectionsByWeek[$lookupKey] ?? [];

    } else {

        $lookupKey =
            getDayKey($cusDueMonth);

        $runRows =
            $collectionsByDay[$lookupKey] ?? [];
    }


    /*
    |--------------------------------------------------------------------------
    | APPLY EXACT CURRENT DUE-PERIOD CONDITIONS
    |--------------------------------------------------------------------------
    */

    $matchedRows = [];


    foreach ($runRows as $tempRow) {


        /*
        |--------------------------------------------------------------------------
        | MONTHLY
        |--------------------------------------------------------------------------
        |
        | Current:
        |
        | due_amt_track
        | OR princ_amt_track
        | OR int_amt_track
        | OR pre_close_waiver
        | OR principal_waiver
        | OR interest_waiver
        |
        |--------------------------------------------------------------------------
        */

        if (
            $loanFrom['due_method_calc'] == 'Monthly' ||
            $loanFrom['due_method_scheme'] == '1'
        ) {

            if (
                $tempRow['due_amt_track'] !== '' ||
                $tempRow['princ_amt_track'] !== '' ||
                $tempRow['int_amt_track'] !== '' ||
                $tempRow['pre_close_waiver'] !== '' ||
                $tempRow['principal_waiver'] !== '' ||
                $tempRow['interest_waiver'] !== ''
            ) {

                $matchedRows[] =
                    $tempRow;
            }

        }


        /*
        |--------------------------------------------------------------------------
        | WEEKLY
        |--------------------------------------------------------------------------
        |
        | Current due-period condition:
        |
        | due_amt_track OR pre_close_waiver
        |
        |--------------------------------------------------------------------------
        */

        elseif (
            $loanFrom['due_method_scheme'] == '2'
        ) {

            if (
                $tempRow['due_amt_track'] !== '' ||
                $tempRow['pre_close_waiver'] !== ''
            ) {

                $matchedRows[] =
                    $tempRow;
            }

        }


        /*
        |--------------------------------------------------------------------------
        | DAILY
        |--------------------------------------------------------------------------
        |
        | Current:
        |
        | due_amt_track OR pre_close_waiver
        |
        |--------------------------------------------------------------------------
        */

        elseif (
            $loanFrom['due_method_scheme'] == '3'
        ) {

            if (
                $tempRow['due_amt_track'] !== '' ||
                $tempRow['pre_close_waiver'] !== ''
            ) {

                $matchedRows[] =
                    $tempRow;
            }
        }
    }


    /*
    |--------------------------------------------------------------------------
    | PROCESS COLLECTIONS
    |--------------------------------------------------------------------------
    */

    $periodHeaderShown = false;


    if (count($matchedRows) > 0) {


        foreach ($matchedRows as $row) {

            $role =
                $row['role'];

            $due_amt_track =
                (int)$row['due_amt_track'];


            if (
                $loanFrom['due_method_calc'] == 'Monthly' ||
                $loanFrom['due_method_scheme'] == '1'
            ) {

                $princ_amt_track =
                    (int)$row['princ_amt_track'];

                $int_amt_track =
                    (int)$row['int_amt_track'];

            } else {

                $princ_amt_track = 0;

                $int_amt_track = 0;
            }


            $waiver =
                (int)$row['pre_close_waiver'];

            $principal_waiver =
                (int)$row['principal_waiver'];


            /*
            |--------------------------------------------------------------------------
            | BALANCE
            |--------------------------------------------------------------------------
            */

            if ($loan_type == 'emi') {

                $bal_amt =
                    (int)$row['bal_amt']
                    - $due_amt_track
                    - $waiver;

            } else {

                $bal_amt =
                    (int)$last_princ_amt
                    - $princ_amt_track
                    - $principal_waiver;
            }

?>


<tr>


<?php


/*
|--------------------------------------------------------------------------
| MONTHLY HEADER
|--------------------------------------------------------------------------
*/

if (
    $loanFrom['due_method_calc'] == 'Monthly' ||
    $loanFrom['due_method_scheme'] == '1'
) {


    if (!$periodHeaderShown) {

?>

<td>

<?php

echo $i;

?>

</td>


<td>

<?php

echo date(
    'm-Y',
    strtotime($cusDueMonth)
);

?>

</td>


<td>

<?php

echo date(
    'M',
    strtotime($cusDueMonth)
);

?>

</td>


<?php if ($loan_type == 'emi') { ?>

<td>

<?php

echo moneyFormatIndia(
    $row['due_amt']
);

?>

</td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

<td>

<?php

echo moneyFormatIndia(
    $last_princ_amt
);

?>

</td>


<td>

<?php

$interest_rate_calc =
    $loanFrom['int_rate'];

$current_principal =
    $last_princ_amt;

$interest_calculate =
    $loanFrom['calc_method'];


if ($interest_calculate == 'Monthly') {

    $int =
        $current_principal *
        ($interest_rate_calc / 100);

} elseif ($interest_calculate == 'Days') {

    $int =
        (
            $current_principal *
            ($interest_rate_calc / 100)
        ) / 30;

} else {

    $int = 0;
}


$curInterest =
    ceil($int / 5) * 5;


if ($curInterest < $int) {

    $curInterest += 5;
}


echo moneyFormatIndia(
    $curInterest
);

?>

</td>

<?php } ?>


<?php

$periodHeaderShown = true;

$i++;

} else {

?>

<td></td>
<td></td>
<td></td>

<?php if ($loan_type == 'emi') { ?>

<td></td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

<td></td>
<td></td>

<?php } ?>

<?php

}

}


/*
|--------------------------------------------------------------------------
| WEEKLY / DAILY HEADER
|--------------------------------------------------------------------------
*/

else {


    if (!$periodHeaderShown) {

?>

<td>

<?php

echo $i;

?>

</td>


<td>

<?php

echo date(
    'd-m-Y',
    strtotime($cusDueMonth)
);

?>

</td>


<td>

<?php

echo date(
    'M',
    strtotime($cusDueMonth)
);

?>

</td>


<?php if ($loan_type == 'emi') { ?>

<td>

<?php

echo $row['due_amt'];

?>

</td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

<td>

<?php

echo $last_princ_amt;

?>

</td>


<td>

<?php

echo $row['due_amt'];

$last_int_amt =
    $row['due_amt'];

?>

</td>

<?php } ?>


<?php

$periodHeaderShown = true;

$i++;

} else {

?>

<td></td>
<td></td>
<td></td>

<?php if ($loan_type == 'emi') { ?>

<td></td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

<td></td>
<td></td>

<?php } ?>


<?php

    }
}

?>


<td>

<?php

$pendingMinusCollection =
    (int)$row['pending_amt'];

if ($pendingMinusCollection != '') {

    echo $pendingMinusCollection;

} else {

    echo 0;
}

?>

</td>


<td>

<?php

$payableMinusCollection =
    (int)$row['payable_amt'];

if ($payableMinusCollection != '') {

    echo $payableMinusCollection;

} else {

    echo 0;
}

?>

</td>


<td>

<?php

$displayDate =
    collectionEffectiveDate($row);

if ($displayDate !== null) {

    echo date(
        'd-m-Y',
        strtotime($displayDate)
    );
}

?>

</td>


<!-- EMI COLLECTION -->

<?php if ($loan_type == 'emi') { ?>

<td>

<?php

if ($row['due_amt_track'] > 0) {

    $totalPaid +=
        $row['due_amt_track'];

    echo $row['due_amt_track'];

} elseif (
    $row['pre_close_waiver'] > 0
) {

    $totalPreClose +=
        $row['pre_close_waiver'];

    echo $row['pre_close_waiver'];
}

?>

</td>

<?php } ?>


<!-- INTEREST COLLECTION -->

<?php if ($loan_type == 'Interest') { ?>

<td>

<?php

if ($princ_amt_track > 0) {

    echo moneyFormatIndia(
        $princ_amt_track
    );

} else {

    echo 0;
}

?>

</td>


<td>

<?php

if ($int_amt_track > 0) {

    echo moneyFormatIndia(
        $int_amt_track
    );

} else {

    echo 0;
}

?>

</td>


<?php

/*
 * IMPORTANT:
 * Same as CURRENT PAGE.
 *
 * Do NOT increment $totalPaidPrinc here.
 * Current page does not do that inside the due-period section.
 */

$totalpaid =
    $totalPaidPrinc;

?>


<?php } else { ?>

<?php

$totalpaid =
    $totalPaid;

?>

<?php } ?>


<td>

<?php

echo moneyFormatIndia(
    $bal_amt
);


if ($loan_type == 'Interest') {

    $last_princ_amt =
        $bal_amt;
}

?>

</td>


<?php if ($loan_type == 'emi') { ?>

<td>

<?php

echo $row['pre_close_waiver'] > 0
    ? moneyFormatIndia(
        $row['pre_close_waiver']
    )
    : '0';

?>

</td>


<?php } else { ?>


<td>

<?php

echo $row['principal_waiver'] > 0
    ? moneyFormatIndia(
        $row['principal_waiver']
    )
    : '0';

?>

</td>


<td>

<?php

echo $row['interest_waiver'] > 0
    ? moneyFormatIndia(
        $row['interest_waiver']
    )
    : '0';

?>

</td>


<?php } ?>


<td>

<?php

echo formatRole($role);

?>

</td>


<td>

<?php

echo htmlspecialchars(
    $row['fullname'] ?? ''
);

?>

</td>


<td>

<?php

echo formatCollectionLocation(
    $row['coll_location']
);

?>

</td>


<td>

<a
    class="print_due_coll"
    id=""
    value="<?php echo htmlspecialchars($row['coll_code']); ?>"
>

<i
    class="fa fa-print"
    aria-hidden="true"
></i>

</a>

</td>


</tr>


<?php

        }
    }


    /*
    |--------------------------------------------------------------------------
    | NO COLLECTION FOR THIS DUE PERIOD
    |--------------------------------------------------------------------------
    */

    else {

?>


<tr>

<td>

<?php

echo $i;

?>

</td>


<td>

<?php

if (
    $loanFrom['due_method_calc'] == 'Monthly' ||
    $loanFrom['due_method_scheme'] == '1'
) {

    echo date(
        'm-Y',
        strtotime($cusDueMonth)
    );

} else {

    echo date(
        'd-m-Y',
        strtotime($cusDueMonth)
    );
}

?>

</td>


<td>

<?php

echo date(
    'M',
    strtotime($cusDueMonth)
);

?>

</td>


<?php if ($loan_type == 'emi') { ?>

<td>

<?php

echo $due_amt_1;

?>

</td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

<td>

<?php

echo moneyFormatIndia(
    $last_princ_amt
);

?>

</td>


<td>

<?php

$interest_rate_calc =
    $loanFrom['int_rate'];

$current_principal =
    $last_princ_amt;

$interest_calculate =
    $loanFrom['calc_method'];


if ($interest_calculate == 'Monthly') {

    $int =
        $current_principal *
        ($interest_rate_calc / 100);

} elseif ($interest_calculate == 'Days') {

    $int =
        (
            $current_principal *
            ($interest_rate_calc / 100)
        ) / 30;

} else {

    $int = 0;
}


$curInterest =
    ceil($int / 5) * 5;


if ($curInterest < $int) {

    $curInterest += 5;
}


echo moneyFormatIndia(
    $curInterest
);

?>

</td>

<?php } ?>


<?php


/*
|--------------------------------------------------------------------------
| MONTHLY PENDING / PAYABLE
|--------------------------------------------------------------------------
|
| EXACT CURRENT LOGIC
|
| NOTE:
| Do NOT use max(0, $pendingval)
|
|--------------------------------------------------------------------------
*/

if (
    $loanFrom['due_method_calc'] == 'Monthly' ||
    $loanFrom['due_method_scheme'] == '1'
) {


    if (
        date(
            'Y-m',
            strtotime($cusDueMonth)
        ) <= date('Y-m')
    ) {

?>


<td>

<?php

$a =
    $i - 1;


/*
 * SAME AS CURRENT CODE
 */
$pendingval =
    ($due_amt_1 * $a)
    - $totalpaid
    - $totalPreClose;


echo $pendingval;

?>

</td>


<td>

<?php

$payableval =
    ($i < 1)
        ? 0
        : $due_amt_1 + $pendingval;


/*
 * SAME AS CURRENT:
 * don't collect more than balance
 */

echo (
    $payableval > $bal_amt
        ? $bal_amt
        : $payableval
);

?>

</td>


<?php

    } elseif (
        date(
            'Y-m',
            strtotime($cusDueMonth)
        ) > date('Y-m')
        && $curDateChecker == true
    ) {

?>


<td></td>

<td></td>


<?php

$curDateChecker = false;

} else {

?>

<td></td>

<td></td>

<?php

}

}


/*
|--------------------------------------------------------------------------
| WEEKLY / DAILY PENDING / PAYABLE
|--------------------------------------------------------------------------
|
| Current page leaves these blank.
|--------------------------------------------------------------------------
*/

else {


    if (
        date(
            'Y-m-d',
            strtotime($cusDueMonth)
        ) <= date('Y-m-d')
    ) {

?>

<td></td>

<td></td>


<?php

    } elseif (
        date(
            'Y-m-d',
            strtotime($cusDueMonth)
        ) > date('Y-m-d')
        && $curDateChecker == true
    ) {

?>

<td></td>

<td></td>


<?php

$curDateChecker = false;

} else {

?>

<td></td>

<td></td>

<?php

}

}

?>


<td></td>


<?php if ($loan_type == 'emi') { ?>

<td></td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

<td></td>
<td></td>

<?php } ?>


<td>

<?php

echo moneyFormatIndia(
    $bal_amt
);

?>

</td>


<td></td>


<?php if ($loan_type == 'Interest') { ?>

<td></td>

<?php } ?>


<td></td>

<td></td>

<td></td>

</tr>


<?php

$i++;

    }
}


/*
|--------------------------------------------------------------------------
| FUTURE COLLECTIONS
|--------------------------------------------------------------------------
*/

$currentDate =
    date('Y-m-d');

$startTime =
    '00:00:00';

$endTime =
    '23:59:59';


/*
|--------------------------------------------------------------------------
| Determine maturity last date and future start date
|--------------------------------------------------------------------------
*/

if (
    $loanFrom['due_method_calc'] == 'Monthly' ||
    $loanFrom['due_method_scheme'] == '1'
) {

    /*
     * CURRENT:
     * last day of maturity month
     */

    $maturity_month_last_date =
        (clone $maturity_month_obj)
        ->modify('last day of this month')
        ->format('Y-m-d');


    /*
     * CURRENT:
     * first day of next month
     */

    $futureStartDate =
        (clone $maturity_month_obj)
        ->modify('+1 month')
        ->format('Y-m-01');

} elseif (
    $loanFrom['due_method_scheme'] == '2'
) {

    /*
     * CURRENT:
     * last day of maturity week
     */

    $maturity_month_last_date =
        (clone $maturity_month_obj)
        ->modify('last day of this week')
        ->format('Y-m-d');


    /*
     * CURRENT:
     * one week after maturity
     */

    $futureStartDate =
        (clone $maturity_month_obj)
        ->modify('+1 week')
        ->format('Y-m-d');

} else {

    /*
     * DAILY
     */

    $maturity_month_last_date =
        (clone $maturity_month_obj)
        ->format('Y-m-d');


    $futureStartDate =
        (clone $maturity_month_obj)
        ->modify('+1 day')
        ->format('Y-m-d');
}


/*
|--------------------------------------------------------------------------
| FIND FUTURE COLLECTIONS
|--------------------------------------------------------------------------
*/

$futureCollections = [];


foreach ($allCollections as $row) {


    /*
     * IMPORTANT:
     * Future condition is DIFFERENT from due-period condition.
     */
    if (
        !futureCollectionHasTrack(
            $row,
            $loanFrom['due_method_scheme']
        )
    ) {
        continue;
    }


    $collDate =
        validCollectionDate($row['coll_date'])
            ? substr(
                $row['coll_date'],
                0,
                10
            )
            : null;


    $transDate =
        validCollectionDate($row['trans_date'])
            ? substr(
                $row['trans_date'],
                0,
                10
            )
            : null;


    /*
    |--------------------------------------------------------------------------
    | CURRENT CONDITION 1
    |--------------------------------------------------------------------------
    |
    | collection date OR transaction date
    | must be between future start and today
    |
    |--------------------------------------------------------------------------
    */

    $condition1 = false;


    if (
        $collDate !== null &&
        $collDate >= $futureStartDate &&
        $collDate <= $currentDate
    ) {

        $condition1 = true;
    }


    if (
        $transDate !== null &&
        $transDate >= $futureStartDate &&
        $transDate <= $currentDate
    ) {

        $condition1 = true;
    }


    if (!$condition1) {
        continue;
    }


    /*
    |--------------------------------------------------------------------------
    | CURRENT CONDITION 2
    |--------------------------------------------------------------------------
    |
    | trans_date > maturity last date
    | OR
    | coll_date > maturity last date
    |
    |--------------------------------------------------------------------------
    */

    $condition2 = false;


    if (
        $transDate !== null &&
        $transDate > $maturity_month_last_date
    ) {

        $condition2 = true;
    }


    if (
        $collDate !== null &&
        $collDate > $maturity_month_last_date
    ) {

        $condition2 = true;
    }


    if (!$condition2) {
        continue;
    }


    /*
    |--------------------------------------------------------------------------
    | CURRENT NOT CONDITION
    |--------------------------------------------------------------------------
    |
    | Do not include rows between:
    |
    | due_start_from
    |       ↓
    | maturity last date
    |
    |--------------------------------------------------------------------------
    */

    $insideStartToLast = false;


    if (
        $collDate !== null &&
        $collDate >= $due_start_from &&
        $collDate <= $maturity_month_last_date
    ) {

        $insideStartToLast = true;
    }


    if (
        $transDate !== null &&
        $transDate >= $due_start_from &&
        $transDate <= $maturity_month_last_date
    ) {

        $insideStartToLast = true;
    }


    if ($insideStartToLast) {
        continue;
    }


    $futureCollections[] =
        $row;
}


/*
|--------------------------------------------------------------------------
| DISPLAY FUTURE COLLECTIONS
|--------------------------------------------------------------------------
*/

foreach ($futureCollections as $row) {

    $role =
        $row['role'];


    $due_amt_track =
        (int)$row['due_amt_track'];


    $waiver =
        (int)$row['pre_close_waiver'];


    $PcollectionAmnt = 0;

    $IcollectionAmnt = 0;

    $principal_waiver = 0;


    /*
    |--------------------------------------------------------------------------
    | INTEREST FUTURE BALANCE
    |--------------------------------------------------------------------------
    */

    if ($loan_type == 'Interest') {

        $PcollectionAmnt =
            (int)$row['princ_amt_track'];

        $IcollectionAmnt =
            (int)$row['int_amt_track'];

        $principal_waiver =
            (int)$row['principal_waiver'];


        if ($last_bal_amt != 0) {

            $bal_amt =
                $last_bal_amt
                - $PcollectionAmnt
                - $principal_waiver;

        } else {

            $bal_amt =
                $loan_amt
                - $PcollectionAmnt
                - $principal_waiver;
        }

    } else {

        /*
         * EMI FUTURE BALANCE
         */

        $bal_amt =
            (int)$row['bal_amt']
            - $due_amt_track
            - $waiver;
    }

?>


<tr>

<td></td>

<td></td>

<td></td>


<?php if ($loan_type == 'emi') { ?>

<td></td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

<td></td>
<td></td>

<?php } ?>


<td>

<?php

echo (int)$row['pending_amt'];

?>

</td>


<td>

<?php

echo (int)$row['payable_amt'];

?>

</td>


<td>

<?php

$displayDate =
    collectionEffectiveDate($row);

if ($displayDate !== null) {

    echo date(
        'd-m-Y',
        strtotime($displayDate)
    );
}

?>

</td>


<!-- EMI -->

<?php if ($loan_type == 'emi') { ?>

<td>

<?php

if ($row['due_amt_track'] > 0) {

    echo moneyFormatIndia(
        $row['due_amt_track']
    );

} elseif (
    $row['pre_close_waiver'] > 0
) {

    echo moneyFormatIndia(
        $row['pre_close_waiver']
    );
}

?>

</td>

<?php } ?>


<!-- INTEREST -->

<?php if ($loan_type == 'Interest') { ?>

<td>

<?php

if ($PcollectionAmnt > 0) {

    $totalPaidPrinc +=
        $PcollectionAmnt;

    echo moneyFormatIndia(
        $PcollectionAmnt
    );

} else {

    echo 0;
}

?>

</td>


<td>

<?php

if ($IcollectionAmnt > 0) {

    echo moneyFormatIndia(
        $IcollectionAmnt
    );

} else {

    echo 0;
}

?>

</td>

<?php } ?>


<td>

<?php

echo $bal_amt;

?>

</td>


<?php if ($loan_type != 'Interest') { ?>

<td>

<?php

if ($row['pre_close_waiver'] > 0) {

    echo moneyFormatIndia(
        $row['pre_close_waiver']
    );

} else {

    echo '0';
}

?>

</td>

<?php } else { ?>


<td>

<?php

if ($row['principal_waiver'] > 0) {

    echo moneyFormatIndia(
        $row['principal_waiver']
    );

} else {

    echo '0';
}

?>

</td>

<?php } ?>


<?php if ($loan_type == 'Interest') { ?>

<td>

<?php

if ($row['interest_waiver'] > 0) {

    echo moneyFormatIndia(
        $row['interest_waiver']
    );

} else {

    echo '0';
}

?>

</td>

<?php } ?>


<td>

<?php

echo formatRole($role);

?>

</td>


<td>

<?php

echo htmlspecialchars(
    $row['fullname'] ?? ''
);

?>

</td>


<td>

<?php

echo formatCollectionLocation(
    $row['coll_location']
);

?>

</td>


<td>

<a
    class="print_due_coll"
    id=""
    value="<?php echo htmlspecialchars($row['coll_code']); ?>"
>

<i
    class="fa fa-print"
    aria-hidden="true"
></i>

</a>

</td>

</tr>


<?php

$i++;

}

?>

</tbody>

</table>