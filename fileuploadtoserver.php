<?php

// <------ This file is required for the Mobile App. Please do not delete it from the folder. ------>

header("Access-Control-Allow-Origin: *"); // Allow requests from anywhere (for testing)
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (isset($_POST['filepath']) && isset($_FILES['pic'])) {

        $uploadDir = __DIR__ . $_POST['filepath']; // Relative to this script

        // Make sure the directory exists
        if (!file_exists($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        $uploadedFiles = [];

        foreach ($_FILES['pic']['name'] as $key => $fileName) {

            if ($_FILES['pic']['error'][$key] !== UPLOAD_ERR_OK) {
                continue;
            }

            $fileTmpPath = $_FILES['pic']['tmp_name'][$key];
            $fileExtension = pathinfo($fileName, PATHINFO_EXTENSION);

            $newFileName = time() . '-' . rand(1000, 9999) . '.' . $fileExtension;
            $uploadFilePath = $uploadDir . $newFileName;

            // Check and delete the file if it already exists
            if (file_exists($uploadFilePath) && is_file($uploadFilePath)) {
                unlink($uploadFilePath);
            }

            if (move_uploaded_file($fileTmpPath, $uploadFilePath)) {
                $uploadedFiles[] = $newFileName;
            }
        }

        if (count($uploadedFiles) > 0) {
            echo json_encode([
                'status' => 'success',
                'message' => count($uploadedFiles) . ' file(s) uploaded successfully',
                'filename' => $uploadedFiles
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'Failed to upload files'
            ]);
        }

    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'No file uploaded or upload error occurred'
        ]);
    }

} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request method'
    ]);
}