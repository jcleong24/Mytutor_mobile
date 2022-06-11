<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");
$sbname = addslashes($_POST['subject_name']);
$sbdesc = addslashes($_POST['subject_description']);
$sbprice = $_POST['subject_price'];
$tutorId = $_POST['tutor_id'];
$sbsessions = $_POST['subject_sessions'];
$sbrating = $_POST['subject_rating'];
$base64image = $_POST['image'];

$sqlinsert = "INSERT INTO `tbl_subjects`(`subject_name`, `subject_description`, `subject_price`, `tutor_id`, 
`subject_sessions`, `subject_rating`) VALUES ('$sbname','$sbdesc','$sbprice','$tutorId','$sbsessions','$sbrating')";
if ($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success', 'data' => null);
    $filename = mysqli_insert_id($conn);
    $decoded_string = base64_decode($base64image);
    $path = '../../assets/courses/' . $filename . '.png';
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