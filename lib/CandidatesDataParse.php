<?php

class CandidatesDataParse
{
    
    function parseData( $resumeUrl )
    {
        //$url = "http://dev.staidlogic.com:5000/user/http%3A%2F%2Ftest.staidlogic.com%2Fopencats%2Fattachments%2Fsite_1%2F0xxx%2Fd61c38660e996020a99c12b3d20d5a57%2FNiharika_J_Vizag.docx";
        //echo $resumeUrl;
        //exit;
        $url = "http://dev.staidlogic.com:5000/user/".urlencode($resumeUrl);
        echo "<br>".$url."<br>";
        $ch = curl_init();
        
        //curl_setopt($ch,CURLOPT_URL,$url);
        //curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        //curl_setopt($ch,CURLOPT_CONNECTTIMEOUT, 4);
        
        
        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_CONNECTTIMEOUT, 4);
        curl_setopt($ch,CURLOPT_VERBOSE, TRUE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);  
        curl_setopt($ch,CURLOPT_USERAGENT ,  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
        
        
        
        $json = curl_exec($ch);
        if(!$json) {
            echo curl_error($ch);
        }
        curl_close($ch);
        
        $arr = json_decode($json);
        
        //print_r(json_decode($json));
        
        return $arr;
        /*
        print_r($arr);
        echo "<br><br><br><br>-------------------------------------------------------<br>";
        print_r($json);
        echo "<br><br><br><br>-------------------------------------------------------<br>";
        echo "Name:".$arr[0][0]->name."<br>";
        echo "email:".$arr[0][0]->email."<br>";
        echo "mobile_number:".$arr[0][0]->mobile_number."<br>";
        
        $arrSkill = $arr[0][0]->skills;
        $arrEducation  = $arr[0][0]->education;
        */
    }
    
    
}

?>