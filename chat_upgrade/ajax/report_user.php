<?php
session_start();
include "../conn.php"; // Include your database connection file

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    echo "You must be logged in to report a user.";
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $reportedUserId = mysqli_real_escape_string($conn, $_POST['reportedUserId']);
    $reportReason = mysqli_real_escape_string($conn, $_POST['reportReason']);
    $additionalDetails = mysqli_real_escape_string($conn, $_POST['additionalDetails']);
    $reportingUserId = $_SESSION['user_id']; // The user who is reporting

    // Insert the report into the database
    $sql = "INSERT INTO user_reports (reported_user_id, reporting_user_id, report_reason, additional_details, report_date)
            VALUES ('$reportedUserId', '$reportingUserId', '$reportReason', '$additionalDetails', NOW())";
    
    if (mysqli_query($conn, $sql)) {
        echo "Your report has been submitted successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>
