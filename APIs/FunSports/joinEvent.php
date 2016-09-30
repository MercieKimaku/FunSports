<?php
$event_id=$_GET['event_id'];
$user_id=$_GET['user_id'].",";
require_once ('./conn.php');
$response="";

$checkJoin=$db->query("SELECT total_likes,attendees,likers FROM events WHERE event_id='$event_id'");
if($checkJoin->rowCount()>0){
  while($rows=$checkJoin->fetch(PDO::FETCH_ASSOC)){
     $total_likes=$rows['total_likes'];
     $attendees=$rows['attendees'];
     $likers=$rows['likers'];
//     check if the user already joined the event.
     $pos = strpos($attendees, $user_id);
     if($pos===false){
         //not already joined
//         join now
         $attendees.=$user_id;
         $likers.=$user_id;
         $update=$db->query("UPDATE events SET attendees='$attendees',likers='$likers' WHERE event_id='$event_id'");
         $response="Joined event successfully.";
     }
     else{
         $response="You already joined the event";
     }
  }  
    
}
else{
    $response="Evnt does not exist";
}
echo $response;       
//        return status
        
