<?php
session_start();
include("db_connect.php"); // Make sure $RMAQconn is defined here
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$success = $error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Collect and sanitize input
    $full_name = trim($_POST['RMAQname'] ?? '');
    $date_of_birth = $_POST['RMAQdob'] ?? '';
    $gender = $_POST['RMAQgender'] ?? '';
    $contact_number = trim($_POST['RMAQcontact'] ?? '');
    $email = trim($_POST['RMAQemail'] ?? '');
    $username = trim($_POST['RMAQstunum'] ?? ''); // <-- changed here
    $password = $_POST['RMAQpassword'] ?? '';
    $role = $_POST['RMAQrole'] ?? 'Voter';

    // Basic validation
    if (
        empty($full_name) || empty($date_of_birth) || empty($gender) ||
        empty($contact_number) || empty($email) || empty($username) ||
        empty($password) || empty($role)
    ) {
        $error = "All fields are required.";
    } else {
        // Hash password
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        try {
            // Prepare and execute insert
            $stmt = $RMAQconn->prepare("INSERT INTO pma_register (full_name, date_of_birth, gender, contact_number, email, username, password, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssssss", $full_name, $date_of_birth, $gender, $contact_number, $email, $username, $hashed_password, $role);

            if ($stmt->execute()) {
                // Generate OTP
                $otp = rand(100000, 999999);
                $_SESSION['otp'] = $otp;
                $_SESSION['otp_user'] = $username;
                $_SESSION['otp_method'] = $_POST['otp_method'];
                $_SESSION['otp_email'] = $email;
                $_SESSION['otp_contact'] = $contact_number;

                // Send OTP via email only
                $mail = new PHPMailer(true);
                try {
                    //Server settings
                    $mail->isSMTP();
                    $mail->Host       = 'smtp.gmail.com';
                    $mail->SMTPAuth   = true;
                    $mail->Username   = 'francisoliver91903@gmail.com'; // your Gmail address
                    $mail->Password   = 'hyqvgwvxxkxgrxid';             // your App Password, no spaces
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                    $mail->Port       = 587;
                    $mail->setFrom('francisoliver91903@gmail.com', 'Voting System');
                    $mail->addAddress($email); // $email is the user's email from the form
                    $mail->isHTML(true);
                    $mail->Subject = 'Your OTP Code';
                    $mail->Body    = "Your OTP code is: <b>$otp</b>";

                    $mail->send();
                } catch (Exception $e) {
                    $error = "OTP email could not be sent. Mailer Error: {$mail->ErrorInfo}";
                    echo "<div class='alert alert-danger'>$error</div>";
                }

                // Redirect to OTP verification page
                header("Location: verify_otp.php");
                exit;
            }
            $stmt->close();
        } catch (mysqli_sql_exception $e) {
            if (str_contains($e->getMessage(), 'Duplicate')) {
                $error = "Email or Student Number already exists.";
            } else {
                $error = "Registration failed: " . $e->getMessage();
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Voting System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
        }
        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h3 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="form-container mx-auto w-75">
        <h3 class="text-center text-primary">Voter Registration</h3>
        <?php if ($success): ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php elseif ($error): ?>
            <div class="alert alert-danger"><?php echo $error; ?></div>
        <?php endif; ?>
        <form action="register.php" method="POST">
            <div class="row g-3">
                <div class="col-md-6">
                    <label for="RMAQname" class="form-label">Full Name</label>
                    <input type="text" name="RMAQname" class="form-control" id="RMAQname" required>
                </div>
                <div class="col-md-6">
                    <label for="RMAQdob" class="form-label">Date of Birth</label>
                    <input type="date" name="RMAQdob" class="form-control" id="RMAQdob" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Gender</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="RMAQgender" value="Male" id="genderMale" required>
                        <label class="form-check-label" for="genderMale">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="RMAQgender" value="Female" id="genderFemale" required>
                        <label class="form-check-label" for="genderFemale">Female</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="RMAQcontact" class="form-label">Contact Number</label>
                    <input type="text" name="RMAQcontact" class="form-control" id="RMAQcontact" required>
                </div>
                <div class="col-md-6">
                    <label for="RMAQemail" class="form-label">Email</label>
                    <input type="email" name="RMAQemail" class="form-control" id="RMAQemail" required>
                </div>
                <div class="col-md-6">
                    <label for="RMAQstunum" class="form-label">Student Number:</label>
                    <input type="text" name="RMAQstunum" class="form-control" id="RMAQstunum" required pattern="\d+"
                        oninput="validateStudentNumber(this)">
                    <div id="stunum-warning" class="text-danger" style="display:none;">Student Number must contain numbers only.</div>
                </div>
                <div class="col-md-6">
                    <label for="RMAQpassword" class="form-label">Password</label>
                    <input type="password" name="RMAQpassword" class="form-control" id="RMAQpassword" required>
                </div>
                <div class="col-md-6">
                    <label for="RMAQrole" class="form-label">Role</label>
                    <select name="RMAQrole" class="form-select" id="RMAQrole" required>
                        <option value="Admin">Admin</option>
                        <option value="Organizer">Organizer</option>
                        <option value="Voter" selected>Voter</option>
                    </select>
                </div>
            </div>
            <div class="mt-4">
                <button class="btn btn-success w-100" type="submit">Register</button>
            </div>
            <div class="text-center mt-3">
                <span>Already have an account? <a href="index.php" class="fw-bold text-primary">Log in here</a></span>
            </div>
        </form>
    </div>
</div>
<script>
function validateStudentNumber(input) {
    const warning = document.getElementById('stunum-warning');
    if (/^\d*$/.test(input.value)) {
        warning.style.display = 'none';
        input.setCustomValidity('');
    } else {
        warning.style.display = 'block';
        input.setCustomValidity('Student Number must contain numbers only.');
    }
}
</script>
</body>
</html>
