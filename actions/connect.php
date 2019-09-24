<?php
header("Content-Type: text/html;charset=utf-8");
$conn = new mysqli("localhost", "root", "","baco");
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);
$conn->set_charset("utf8")
?>