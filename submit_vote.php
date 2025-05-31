<?php
session_start();
include("db_connect.php");

// Make sure the user is logged in and the form is submitted
if (!isset($_SESSION['RMAQuser_id']) || $_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: index.php");
    exit;
}

// Get the voter student number (username)
$uid = intval($_SESSION['RMAQuser_id']);
$res = $RMAQconn->query("SELECT username FROM pma_register WHERE id = $uid LIMIT 1");
if (!$res || !($row = $res->fetch_assoc())) {
    header("Location: index.php");
    exit;
}
$voter_id = $row['username'];

// Generate a unique reference code
$reference_code = strtoupper(uniqid('REF'));

// Get selected candidates (assuming checkboxes named "candidate_ids[]")
$candidate_ids = isset($_POST['candidate_ids']) ? $_POST['candidate_ids'] : [];

if (empty($candidate_ids)) {
    header("Location: vote.php?error=NoSelection");
    exit;
}

// Convert candidate IDs array to comma-separated string
$candidate_ids_str = implode(',', $candidate_ids);

// Insert a single row with all candidate IDs
$stmt = $RMAQconn->prepare("INSERT INTO vote_table (vote_id, voter_id, candidate_id, vote_timestamps) VALUES (?, ?, ?, NOW())");
$stmt->bind_param("sss", $reference_code, $voter_id, $candidate_ids_str);
$stmt->execute();
$stmt->close();

// Store the reference code in session for thank you page
$_SESSION['RMAQreference_code'] = $reference_code;

// Redirect to thank you page
header("Location: thankyou.php");
exit;
?>