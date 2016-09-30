<?php
$category_id=$_POST['category_id'];
$event_name=$_POST['event_name'];
$event_date=$_POST['event_date'];
$amount=$_POST['amount'];
$facebook_id=$_POST['facebook_id'];
$photo_url="url_to_images";

require_once('./conn.php');
        
$checkExistence=$db->query("SELECT event_id FROM events WHERE name='$event_name' AND date='$event_date' AND category_id='$category_id'");
if($checkExistence->rowCount()==0){
//    Add as a new user
    $facebook_id=",".$facebook_id.",";
    $db->query("INSERT INTO events (name,date,amount,category_id,photo_url,total_likes,attendees,likers) "
   . "VALUES('$event_name','$event_date','$amount','$category_id','$photo_url','1','$facebook_id','$facebook_id')");
$response="Event added successfully.";
    
}

else{
 $response="Failed to add event, Similar event already exist.";   
}

echo $response;