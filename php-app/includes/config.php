<?php
// Database configuration
$serverName = "database";
$dBUsername = "shashi"; // Replace with your database username
$dBPassword = "shashi123"; // Replace with your database password
$dBName = "electric_shop"; // Replace with your database name

// Create connection
$conn = new mysqli($serverName, $dBUsername, $dBPassword, $dBName);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
