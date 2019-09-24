<?php
if (!isset($_GET['id']))   exit('{"error": "unset id: please send a id"}');
if (!isset($_GET['vote'])) exit('{"error": "unset vote: please send a vote"}');

session_start();
$id     = intval($_GET["id"]);
$vote   = intval($_GET["vote"]);
$unvote = false;
$i = 0;

if (!isset($_SESSION['upvotes'])) $_SESSION['upvotes'] = array();
if (!isset($_SESSION['downvotes'])) $_SESSION['downvotes'] = array();

if($vote >= 1) {
  if(in_array($id, $_SESSION['upvotes'])) exit('{"status": "Already upvoted"}');
  else $_SESSION['upvotes'][] = $id;
  if (($i = array_search($id, $_SESSION['downvotes'])) !== false) {
    unset($_SESSION['downvotes'][$i]);
    $unvote = true;
  }
}else {
  if(in_array($id, $_SESSION['downvotes'])) exit('{"status": "Already downvoted"}');
  else $_SESSION['downvotes'][] = $id;
  if (($i = array_search($id, $_SESSION['upvotes'])) !== false) {
    unset($_SESSION['upvotes'][$i]);
    $unvote = true;
  }
}

include("connect.php");

$sql = "";
if($vote >= 1) {
  $sql = "UPDATE `phrases` SET `upvotes` = upvotes + 1 WHERE `id` = ". $id .";";
  if($unvote) $sql .= " UPDATE `phrases` SET `downvotes` = downvotes - 1 WHERE `id` = ". $id .";";
}else {
  $sql = "UPDATE `phrases` SET `downvotes` = downvotes + 1 WHERE `id` = ". $id .";";
  if($unvote) $sql .= " UPDATE `phrases` SET `upvotes` = upvotes - 1 WHERE `id` = ". $id .";";
}
// echo 'hi{})))(/¡';
// $_SESSION['downvotes'] = array();
// $_SESSION['upvotes'] = array();

// var_dump( $_SESSION['upvotes']);
// var_dump( $_SESSION['downvotes']);

if ($conn->multi_query($sql) === TRUE) {
  echo '{"status": "OK", "unvoted": '. ($unvote ? 'true' : 'false') .'}';
} else {
  echo '{"error": "'.$conn->error.'"}';
}

$conn->close();

?>