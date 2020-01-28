<?php 


include_once('../lib/EncryptDecrypt.php');
/*
$DBServer = 'localhost';
$DBUser   = 'root';
$DBPass   = '';
$DBName   = 'stdl_ats';
*/

$DBServer = 'localhost';
$DBUser   = 'ats_test';
$DBPass   = 'Pass@123';
$DBName   = 'stdl_ats_test';


$conn = new mysqli($DBServer, $DBUser, $DBPass, $DBName);
if ($conn->connect_error) {
    trigger_error('Database connection failed: '  . $conn->connect_error, E_USER_ERROR);
    echo "connection failed";
} 



$mask = new EncryptDecrypt();

$SelectSql="SELECT `candidate_id`,CONCAT(`first_name`,' ',`last_name`) as name,`phone_home`,`phone_cell`,`phone_work`,`email1`,`email2` FROM `candidate` WHERE 1";

if($conn->query($SelectSql)== TRUE)
{

    $rs = $conn->query($SelectSql);
    
    foreach ($rs as $rowIndex => $row)
    {
        //echo $row['email1']."<br/>" ;
        
        if($row['phone_home'] != '')
        {
            $phone_home = $mask->encrypt($row['email1']);
        }
        else 
        {
            $phone_home = '';
        }
        
        if($row['phone_cell'] != '')
        {
            $phone_cell = $mask->encrypt($row['phone_cell']);
        }
        else
        {
            $phone_cell = '';
        }

        if($row['phone_work'] != '')
        {
            $phone_work = $mask->encrypt($row['phone_work']);
        }
        else
        {
            $phone_work = '';
        }

        if($row['email1'] != '')
        {
            $email1 = $mask->encrypt($row['email1']);
        }
        else
        {
            $email1 = '';
        }
        
        if($row['email2'] != '')
        {
            $email2 = $mask->encrypt($row['email2']);
        }
        else
        {
            $email2 = '';
        }
        
        $updateSql = "UPDATE `candidate` SET `phone_home`='".$phone_home."',`phone_cell`='".$phone_cell."',`phone_work`='".$phone_work."',`email1`='".$email1."',`email2`='".$email2."' WHERE `candidate_id`=".$row['candidate_id'];

        //echo $row['name'].": ".$updateSql.";<br/>";
        echo $updateSql.";<br/><br/>";
            
    }

}

//echo $mask->encrypt('prashant');




?>