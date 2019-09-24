<?php
if (!isset($_GET['mode'])) exit('{"error": "unset mode: please send a mode"}');

$mode    = intval($_GET["mode"]);
$players = (isset($_GET['players'])) ? intval($_GET['players']) : 0;
$amount  = (isset($_GET['amount']))  ? intval($_GET['amount'])  : 100;
$dMin    = (isset($_GET['dMin']))    ? intval($_GET['dMin'])    : 0;
$dMax    = (isset($_GET['dMax']))    ? intval($_GET['dMax'])    : 4;

if($amount < 1) $amount = 1;
else if($amount > 1000) $amount = 1000;

if($dMin < 0) $dMin = 0;
if($dMax < 0) $dMax = 0;
if($players < 1) $players = 1;

include("connect.php");

$sql = "SELECT id, phrase, upvotes, downvotes FROM `phrases` WHERE mode=".$mode." AND players<=".$players." AND dificulty>=".$dMin." AND dificulty<=".$dMax." ORDER BY rand() LIMIT ".$amount.";";
$result = $conn->query($sql);

$rows = array();
while($r = mysqli_fetch_assoc($result)) $rows[] = $r;
echo json_encode($rows);

$conn->close();
?>