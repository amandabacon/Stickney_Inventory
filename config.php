<?php
function getdb(){
$servername = "localhost";
$username = "amandabacon";
$password = "thispassword";
$db = "test";
 
try {
   
    $conn = mysqli_connect($servername, $username, $password, $db);
     //echo "Connected successfully"; 
    }
catch(exception $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }
    return $conn;
}
?>
