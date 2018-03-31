<?php

include_once '../global.php';

$name         = '';
$faith        = '';
$faith_type   = 0;
$rank         = null;
$hometown     = null;

$name       = $_POST['name'];
$faith      = $_POST['faith'];
$faith_type = $_POST['faith_type'];
$rank       = $_POST['rank'];
$hometown   = $_POST['hometown'];

$chaplain = new Chaplain();


$chaplain->name       = $name;
$chaplain->faith      = $faith;
$chaplain->faith_type = $faith_type;
$chaplain->rank       = $rank;
$chaplain->hometown   = $hometown;
$chaplain->creator_id = 1; // hard coded user ID for now

$chaplainID = $chaplain->insert();
if ($chaplainID != 0) {
  $json = array(
	'status'     => 'success',
	'name'       => $chaplain->name,
	'faith'      => $chaplain->faith,
	'faith_type' => $chaplain->faith_type,
	'rank'       => $chaplain->rank,
	'hometown'   => $chaplain->hometown
  );
} else {
  $json = array('error' => 'Could not save chaplain.');
}

header('Content-Type: application/json'); // let client know it's Ajax
echo json_encode($json); // print the JSON

?>
