<?php
session_start();
$url_array = explode('?', 'http://'.$_SERVER ['HTTP_HOST'].$_SERVER['REQUEST_URI']);
$url = $url_array[0];

$url ="http://localhost:8082/stdlats/index.php?m=candidates&a=show&candidateID=166";


$file_path = "../attachments/site_1/0xxx/604e6ba10ce7eab0523530630d9e4bb3/MyResume.txt";
/*
if (file_exists($file_path)) {
    echo "The file $file_path exists";
} else {
    echo "The file $file_path does not exist";
}

*/

require_once 'google-api-php-client/src/Google_Client.php';
require_once 'google-api-php-client/src/contrib/Google_DriveService.php';

$client = new Google_Client();
$client->setClientId('1007797349671-kgldanq79l1mh7qr2gtgm7qto3uv6h4j.apps.googleusercontent.com');
$client->setClientSecret('f78XpEP4d7MfQFnhDIFV5Vbh');
$client->setRedirectUri($url);
$client->setScopes(array('https://www.googleapis.com/auth/drive'));

//$parent = new Google_ParentsServiceResource(); //previously Google_ParentReference
//$parent->setId('1ugsNN5hawKX0x9geBEPLj3S59cHkqD6U');


if (isset($_GET['code'])) {
    $_SESSION['accessToken'] = $client->authenticate($_GET['code']);
    //header('location:'.$url);
    echo "ERROR OCCURED";
    exit;
} elseif (!isset($_SESSION['accessToken'])) {
    $client->authenticate();
}





/*
$files= array();
$dir = dir('files');
while ($file = $dir->read()) {
    if ($file != '.' && $file != '..') {
        $files[] = $file;
    }
}
$dir->close();
*/


    $client->setAccessToken($_SESSION['accessToken']);
    $service = new Google_DriveService($client);
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $file = new Google_DriveFile();
    $mime_type = finfo_file($finfo, $file_path);
    $file->setTitle('GDriveTEstLocal');
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
    header('location:'.$url);exit;

//include 'index.phtml';
