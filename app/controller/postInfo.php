<?php

include_once '../global.php';

$name  = $_POST['name'];
$faith  = $_POST['faith'];
$rank  = $_POST['rank'];
$hometown = $_POST['hometown'];
$chaplain = new Chaplain();


$chaplain->name       = $name;
$chaplain->faith      = $faith;
$chaplain->faith_type = 0;
$chaplain->rank       = $rank;
$chaplain->hometown   = $hometown;
$chaplain->creator_id = 1; // hard coded user ID for now

$chaplainID = $chaplain->save();
if($chaplainID != 0) {
  $json = array(
    'status' => 'success',
    'name' => $chaplain->name,
    'faith' => $chaplain->faith,
    'rank' => $chaplain->rank,
    'hometown' => $chaplain->hometown
  );
} else {
  $json = array('error' => 'Could not save chaplain.');
}

header('Content-Type: application/json'); // let client know it's Ajax
echo json_encode($json); // print the JSON





// $conn->close();

?>
