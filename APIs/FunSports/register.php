<?php

$facebook_id=$_GET['facebook_id'];
$facebook_name=$_GET['facebook_name'];
$response="";
require_once ('./conn.php');
$checkExistence=$db->query("SELECT facebook_id FROM user_information WHERE facebook_id='$facebook_id'");
if($checkExistence->rowCount()==0){
//    Add as a new user
    $db->query("INSERT INTO user_information (facebook_id,facebook_name) VALUES('$facebook_id','$facebook_name')");
$response="User registered successfully.";   
}
else{
$response="User already exist";
}

echo $response;
