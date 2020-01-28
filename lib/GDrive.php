<?php


//session_start();
//$url_array = explode('?', 'http://'.$_SERVER ['HTTP_HOST'].$_SERVER['REQUEST_URI']);
//$url = $url_array[0];


require_once 'google-api-php-client/src/Google_Client.php';
require_once 'google-api-php-client/src/contrib/Google_DriveService.php';

Class GDrive
{

    
    
        function uploadToGdrive($file_name, $file_path, $mime_type,$redirect_url)
        {
          
            $client = new Google_Client();
            // Application QuicklStart
            //$client->setClientId('1007797349671-kgldanq79l1mh7qr2gtgm7qto3uv6h4j.apps.googleusercontent.com');
           // $client->setClientSecret('f78XpEP4d7MfQFnhDIFV5Vbh');

            // Application STDLATS
            //$client->setClientId('728431758938-5fj0jk1cskruk4l3mk3d4oon42df5ij7.apps.googleusercontent.com');
            //$client->setClientSecret('MLn2YP6usDHTAWxTYE5u3NRR');
            $client->setClientId('728431758938-1jp6fld6pfrc21mbohchhkfsr8a437vp.apps.googleusercontent.com');
            $client->setClientSecret('gIMKGnXQBfcxWVwu9ZH57fo4');
            
            $client->setRedirectUri($redirect_url);
            $client->setScopes(array('https://www.googleapis.com/auth/drive'));
        
            //$parent = new Google_ParentsServiceResource(); //previously Google_ParentReference
            //$parent->setId('1ugsNN5hawKX0x9geBEPLj3S59cHkqD6U');
        
          if (isset($_GET['code'])) 
          {
                $_SESSION['accessToken'] = $client->authenticate($_GET['code']);
                header('location:'.$redirect_url);
                exit;
          } 
          elseif (!isset($_SESSION['accessToken'])) 
          {
               $client->authenticate();
          }
        
                $client->setAccessToken($_SESSION['accessToken']);
                $service = new Google_DriveService($client);
                $finfo = finfo_open(FILEINFO_MIME_TYPE);
                $file = new Google_DriveFile();
                
                //$file_path = 'files/'.$file_name;
                
                $mime_type = finfo_file($finfo, $file_path);
                
                $file->setTitle($file_name);
                $file->setDescription('This is a '.$mime_type.' document');
                $file->setMimeType($mime_type);
                //$file->setParents(array($parent));
                $service->files->insert(
                    $file,
                    array(
                        'data' => file_get_contents($file_path),
                        'mimeType' => $mime_type
                    )
                );
            
                finfo_close($finfo);
                
        }

}
