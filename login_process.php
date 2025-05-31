<?php
session_start();
include("db_connect.php");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $RMAQUsername = trim($_POST['RMAQstudent_number'] ?? '');
    $RMAQPassword = $_POST['RMAQpassword'] ?? '';

    if (empty($RMAQUsername) || empty($RMAQPassword)) {
        echo "<script>alert('Please enter both Student Number and Password.'); window.location='index.php';</script>";
        exit;
    }

    if (!$RMAQconn) {
        die("Database connection failed.");
    }

    $RMAQsql = "SELECT * FROM pma_register WHERE username = ?";
    $RMAQstmt = $RMAQconn->prepare($RMAQsql);

    if ($RMAQstmt) {
        $RMAQstmt->bind_param("s", $RMAQUsername);
        $RMAQstmt->execute();
        $RMAQresult = $RMAQstmt->get_result();

        if ($RMAQresult->num_rows === 1) {
            $RMAQuser = $RMAQresult->fetch_assoc();
            if (password_verify($RMAQPassword, $RMAQuser['password'])) {
                $_SESSION['RMAQuser_id'] = $RMAQuser['id'];
                $_SESSION['RMAQlogged_in'] = true;
                $_SESSION['RMAQrole'] = $RMAQuser['role'];
                header("Location: vote.php");
                exit;
            } else {
                echo "<script>alert('❌ Incorrect password.'); window.location='index.php';</script>";
            }
        } else {
            echo "<script>alert('❌ No user found with that Student Number.'); window.location='index.php';</script>";
        }

        $RMAQstmt->close();
    } else {
        echo "<script>alert('Error preparing query.'); window.location='index.php';</script>";
    }
} else {
    header("Location: index.php");
    exit;
}
?>