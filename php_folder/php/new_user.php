<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$name = addslashes($_POST['name']);
$email = addslashes($_POST['email']);
$phone = addslashes($_POST['phone']);
$password = $_POST['password'];
$password2 = $_POST['password2'];
$address = addslashes($_POST['address']);
$base64image = $_POST['image'];

$sqlinsert = "INSERT INTO `tbl_user`(`user_name`, `user_email`, `user_password`, `user_password2`, `user_phone`, `user_address`) 
VALUES ('$name','$email','$password','$password2','$phone','$address')";
if ($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success', 'data' => null);
    $filename = mysqli_insert_id($conn);
    $decoded_string = base64_decode($base64image);
    $path = '../assets/users/' . $filename . '.jpg';
    $is_written = file_put_contents($path, $decoded_string);
    sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>