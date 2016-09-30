<?php

$category_id=$_GET['category_id'];
$status=$_GET['status'];
$user_id=",".$_GET['facebook_id'].",";

//$category_id=1;
//$status=1;
//$user_id=",1,";

require_once ('./conn.php');

$response=array();
$getCategory=$db->query("SELECT event_id,name,date,amount,photo_url,total_likes,attendees FROM events WHERE category_id='$category_id' AND status='$status'");
if($getCategory->rowCount()>0){
    $response['events']=array();
 while($rows=$getCategory->fetch(PDO::FETCH_ASSOC)){
     $event_id=$rows['event_id'];
     $name=$rows['name'];
     $date=$rows['date'];
     $amount=$rows['amount'];
     $photo_url=$rows['photo_url'];
     $attendees=$rows['attendees'];
     $total_likes=$rows['total_likes'];
     $isAttending=0;
     $pos=strpos($attendees, $user_id);
     if($pos!==false){
        $isAttending=1; 
     }
    $myArray=array();
    $myArray['event_id']=$event_id;
    $myArray['name']=$name;
    $myArray['date']=$date;
    $myArray['amount']=$amount;
    $myArray['photo_url']=$photo_url;
    $myArray['total_likes']=$total_likes;
    $myArray['isAtending']=$isAttending;
    
    array_push($response['events'], $myArray);
     
 } 
 $response['success']=1;   
}
else{
    $response['success']=0;
    $response['message']="No event found";
}
echo json_encode($response);
