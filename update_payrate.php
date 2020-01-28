<?php ini_set('max_execution_time', 12000000);
ini_set('memory_limit', '-1');
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "atskst0821";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} $cattxtarr=array();



$sql = "SELECT * FROM extra_field where data_item_type=400 and field_name='Pay rate' order by field_name asc ";
$result = $conn->query($sql);

$imgnumber=1;
if ($result->num_rows > 0) {

    while($row = $result->fetch_assoc()) {
    	
    	$rates=str_replace("$","",$row['value']);
    	$rates=explode("-",$rates);
    	echo $row['data_item_id'];
    	print_r($rates);
		$minpayrate=trim($rates[0]);
		$minpayrate=trim($rates[0]);	echo "<br/>";   
		//$conn->query("UPDATE joborder set minpayRate='".$newfilename."' where ID='".$row['ID']."'");			 	
			 
			 
			 }
				
				
				
	


    
} else {
    echo "0 results";
}
$conn->close();
