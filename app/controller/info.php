<?php
include_once '../global.php';

$submitArray = array();
//Submit entries
$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);


$q = "SELECT * FROM chaplains";

$result = $conn->query($q);



if ($result->num_rows > 0) {

    while($row = $result->fetch_assoc()) {

        array_push($submitArray, $row);

    }

}


echo json_encode($submitArray);

$conn->close();

?>
