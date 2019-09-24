<?php
if (!isset($_GET['mode']))      exit('{"error": "unset mode: please send a mode"}');
if (!isset($_GET['dificulty'])) exit('{"error": "unset dificulty: please send a dificulty"}');
if (!isset($_GET['phrase']))    exit('{"error": "unset phrase: please send a phrase"}');

$mode      = intval($_POST["mode"]);
$dificulty = intval($_POST["dificulty"]);
$phrase    = $_POST["phrase"];

if($dificulty < 0) $dificulty = 0;

$codeRegex = "/\$\{/";
$okRegex = "/\$\{\s*(p\[\s*\d+\s*\]|random\(\s*\d+\s*,\s*\d+\s*\))[\s;]*\}/";
if(preg_match_all($codeRegex,$phrase) > preg_match_all($okRegex,$phrase)){
    exit('{"error": "injected code: Only use p[int] and random(int, int) inside ${...}", "phrase": "'.$phrase.'"}');
}

$players = 0; //players stay to 0
while(preg_match("/\\$\{\s*p\[\s*". $players ."\s*\][\s;]*\}/", $phrase)) ++$players;
if ($players >= 10) {
    exit('{"error": "to many players: the maximum number of players is 9, you used '. $players .'", "phrase": "'.$phrase.'"}');
}

$playersRegex = "/\\$\{\s*p\[\s*[". $players ."-9]\s*\][\s;]*\}/";
if (preg_match($playersRegex,$phrase)) {
    exit('{"error": "unconsecutive players from '. $players .': if you use p[n] where n>=1, p[n-1] must also be used inside ${...}", "phrase": "'.$phrase.'"}');
}


include("connect.php");
$phrase = $conn->real_escape_string($phrase);

$sql = "INSERT INTO phrases (phrase, mode, players,dificulty)
VALUES ('".$phrase."', '".$mode."', '".$players."', '".$dificulty."');";

if ($conn->query($sql) === TRUE) {
    echo '{"id": '.$conn->insert_id.',"players": '.$players.',"mode": '.$mode.',"phrase": "'.$phrase.'","upvotes": 0,"downvotes": 0}';
} else {
    echo '{"error": "'.$conn->error.'"}';
}

$conn->close();
?>