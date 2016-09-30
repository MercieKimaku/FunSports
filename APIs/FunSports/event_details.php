<?php
//$event_id=$_GET['event_id'];
$event_id=1;
require_once ("./conn.php");
$response=array();

        $getEventDetails=$db->query("SELECT name,date,amount,photo_url,status,total_likes FROM events WHERE event_id='$event_id'");
if($getEventDetails->rowCount()>0){
    $response['event_details']=array();
    while($rows=$getEventDetails->fetch(PDO::FETCH_ASSOC)){
        $name=$rows['name'];
        $date=$rows['date'];
        $amount=$rows['amount'];
        $photo_url=$rows['photo_url'];
        $status=$rows['status'];
        $total_likes=$rows['total_likes'];
        
        $myArray=array();
        $myArray['name']=$name;
        $myArray['date']=$date;
        $myArray['amount']=$amount;
        $myArray['photo_url']=$photo_url;
        $myArray['status']=$status;
        $myArray['total_likes']=$total_likes;
        
        array_push($response['event_details'], $myArray);
    }
$response['success']=1;   
}
else{
    $response['success']=0;
    $response['message']="No details found for this event";
}
echo json_encode($response);
