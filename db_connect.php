<?php
$RMAQhost = 'localhost';
$RMAQuser = 'root';
$RMAQpass = 'goldwood123';
$RMAQdb = 'votingdatabase';

$RMAQconn = new mysqli($RMAQhost, $RMAQuser, $RMAQpass, $RMAQdb);
if ($RMAQconn->connect_error) {
    die("Connection failed: " . $RMAQconn->connect_error);
}
?>
