<?php
$servername = "localhost:3306";
$username = "whuzgoin_anto";
$password = "@nth0nyB";
$dbname="whuzgoin_funmoments";

try {
    $db = new PDO("mysql:host=$servername;dbname=".$dbname, $username, $password);
    // set the PDO error mode to exception
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   // echo "Connected successfully"; 
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }