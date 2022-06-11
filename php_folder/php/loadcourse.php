<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");

// $results_per_page = 10;
// $pageno = (int)$_POST['pageno'];
// $page_first_result = ($pageno - 1) * $results_per_page;

$sqlloadcourse = "SELECT * FROM tbl_subjects";
$result = $conn->query($sqlloadcourse);
// $number_of_result = $result -> num_rows;
// $number_of_page = ceil($number_of_result / $results_per_page);
// $sqlloadcourse = $sqlloadcourse . "LIMIT $page_first_result, $results_per_page";
// $result = $conn->query($sqlloadcourse);

if($result -> num_rows > 0) {
    $courses["courses"] =array();
    while($row = $result->fetch_assoc()) {   
        $courseList = array();
        $courseList["subject_id"] = $row["subject_id"];
        $courseList["subject_name"] = $row['subject_name'];
        $courseList["subject_description"] = $row['subject_description'];
        $courseList["subject_price"] = $row['subject_price'];
        $courseList["tutor_id"] = $row['tutor_id'];
        $courseList["subject_sessions"] = $row['subject_sessions'];
        $courseList["subject_rating"] = $row['subject_rating'];
        array_push($courses["courses"],$courseList);
    }
    // $response = array('status' => 'success', 'pageno' => "$pageno", 'numofpage' => "$number_of_page", 'data' =>$course);
    // sendJsonResponse($response);

    $response = array('status' => 'success', 'data' => $courses);
    sendJsonResponse($response);
}else{
    // $response = array('status' => 'failed', 'pageno'=>"$pageno",'numofpage'=>"$number_of_page",'data' => null);
    // sendJsonResponse($response);

    $response = array('status' => 'success', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray){
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}

?>