<?php
session_start();

$success = $error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $entered_otp = trim($_POST['otp'] ?? '');
    if ($entered_otp == ($_SESSION['otp'] ?? '')) {
        // OTP correct, clear OTP session and set login session
        require 'db_connect.php';
        $username = $_SESSION['otp_user'];
        // Fetch user ID and role from database
        $stmt = $RMAQconn->prepare("SELECT id, role FROM pma_register WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($user_id, $role);
        if ($stmt->fetch()) {
            $_SESSION['RMAQuser_id'] = $user_id;
            $_SESSION['RMAQrole'] = $role;
            $_SESSION['RMAQlogged_in'] = true;
        }
        $stmt->close();
        unset($_SESSION['otp']);
        unset($_SESSION['otp_user']);
        unset($_SESSION['otp_email']);
        unset($_SESSION['otp_contact']);
        unset($_SESSION['otp_method']);
        $success = "OTP verified! Redirecting...";
        echo "<script>
            setTimeout(function() {
                window.location.href = 'vote.php';
            }, 1500);
        </script>";
    } else {
        $error = "Invalid OTP. Please try again.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Verify OTP - Voting System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fffdee;
            font-family: 'Segoe UI', sans-serif;
        }
        .otp-container {
            background: #fff;
            padding: 32px 32px 24px 32px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.08);
            max-width: 400px;
            margin: 60px auto 0 auto;
        }
        .otp-title {
            color: #ffc107;
            font-weight: bold;
        }
        .form-control:focus {
            border-color: #ffc107;
            box-shadow: 0 0 0 0.2rem rgba(255,193,7,.25);
        }
        .btn-warning {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="otp-container text-center">
        <img src="images/banner.jpg" class="img-fluid mb-3" style="max-height: 60px;" alt="Banner">
        <h4 class="otp-title mb-3">OTP Verification</h4>
        <p class="mb-4">Enter the OTP sent to your <b><?= htmlspecialchars($_SESSION['otp_method'] ?? 'email') ?></b>:</p>
        <?php if ($success): ?>
            <div class="alert alert-success"><?= $success ?></div>
        <?php elseif ($error): ?>
            <div class="alert alert-danger"><?= $error ?></div>
        <?php endif; ?>
        <form method="POST" autocomplete="off">
            <div class="mb-3">
                <input type="text" name="otp" class="form-control text-center fw-bold" maxlength="6" pattern="\d{6}" required placeholder="Enter 6-digit OTP" style="font-size:1.5rem; letter-spacing: 6px;">
            </div>
            <button type="submit" class="btn btn-warning w-100">Verify</button>
        </form>
        <div class="mt-4 text-muted" style="font-size: 0.95em;">
            Didn't receive the code? Check your spam folder or <a href="register.php" class="text-warning fw-bold">register again</a>.
        </div>
    </div>
</body>
</html>