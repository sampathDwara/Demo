<?php

$url = "http://dev.staidlogic.com:5000/user/http%3A%2F%2Ftest.staidlogic.com%2Fopencats%2Fattachments%2Fsite_1%2F0xxx%2Fd61c38660e996020a99c12b3d20d5a57%2FNiharika_J_Vizag.docx";
$ch = curl_init();
curl_setopt($ch,CURLOPT_URL,$url);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
curl_setopt($ch,CURLOPT_CONNECTTIMEOUT, 4);
$json = curl_exec($ch);   
if(!$json) {
    echo curl_error($ch);
}
curl_close($ch);

$arr = json_decode($json);
//print_r(json_decode($json));
print_r($arr);
echo "<br><br><br><br>-------------------------------------------------------<br>";
print_r($json);
echo "<br><br><br><br>-------------------------------------------------------<br>";
echo "Name:".$arr[0][0]->name."<br>";
echo "email:".$arr[0][0]->email."<br>";
echo "mobile_number:".$arr[0][0]->mobile_number."<br>";
$arrSkill = $arr[0][0]->skills;
$arrEducation  = $arr[0][0]->education;

//foreach($arrSkill->values as $values)
//{
//    echo $values->value . "\n";
//}

?>