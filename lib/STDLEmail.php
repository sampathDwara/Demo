<?php

include_once('./lib/Attachments.php');

include_once('./lib/Pipelines.php');

include_once('./lib/History.php');

include_once('./lib/SavedLists.php');

include_once('./lib/ExtraFields.php');

include_once('lib/DataGrid.php');


class STDLEmail

{
    
    private $_db;
    private $_siteID;
    
    public $extraFields;
    
    public function __construct($siteID)
    
    {
        
        $this->_siteID = $siteID;
        
        $this->_db = DatabaseConnection::getInstance();
        
        $this->extraFields = new ExtraFields($siteID, DATA_ITEM_CANDIDATE);
        
    }
    
    
    
    public function varifyEmail($email,$password)
    
    {
        
        if (strpos($email, '.net') !== false)
        {
            $srv = '{imap.secureserver.net:993/imap/ssl}';
        }
        else
        {
            $srv = '{a2plcpnl0341.prod.iad2.secureserver.net:993/imap/ssl}';
        }        
        
        $retValue = 0;

        //$conn = imap_open($srv, 'contact@staidlogic.in', 'contact3421');
        $conn = imap_open($srv, $email, $password);
        
        $boxes = imap_list($conn, $srv, '*');
        $boxCount = count($boxes);

        //if (strpos($boxes, 'AUTHENTICATIONFAILED') !== false) 
        if($boxCount > 0)
        {
            $retValue = count($boxes);
        }
        else 
        {
            $retValue = 0;
        }
        imap_close($conn);
        
        return $retValue;
        
    }
    
    
}

?>

