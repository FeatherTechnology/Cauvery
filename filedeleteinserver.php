<?php

// <------ This file is required for the Mobile App. Please do not delete it from the folder. ------>

header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode([
        'status' => 'error',
        'message' => 'Method not allowed'
    ]);
    exit;
}

$filenames = $_POST['filename'] ?? '';
$filepath  = $_POST['filepath'] ?? '';

if (empty($filenames) || empty($filepath)) {
    http_response_code(400);
    echo json_encode([
        'status' => 'error',
        'message' => 'Filename or filepath missing'
    ]);
    exit;
}

$deleted = [];
$notFound = [];

foreach (explode(',', $filenames) as $filename) {

    $filename = trim($filename);

    if ($filename === '') {
        continue;
    }

    $file = __DIR__ . $filepath . basename($filename);

    if (is_file($file)) {

        if (unlink($file)) {
            $deleted[] = $filename;
        } else {
            $notFound[] = $filename;
        }

    } else {
        $notFound[] = $filename;
    }
}

echo json_encode([
    'status' => 'success',
    'deleted' => $deleted,
    'not_found' => $notFound
]);
?>