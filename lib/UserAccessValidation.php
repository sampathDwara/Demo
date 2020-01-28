<?php
include_once('./lib/Pager.php');
include_once('./lib/ListEditor.php');
include_once('./lib/EmailTemplates.php');
include_once('./lib/Attachments.php');
include_once('./lib/JobOrders.php');
include_once('./lib/Contacts.php');


/**
 *  Companies Library
 *  @package    CATS
 *  @subpackage Library
 */
class UserAccessValidation
{
    private $_db;
    private $_siteID;

    public $extraFields;


    public function __construct($siteID)
    {
        $this->_siteID = $siteID;
        $this->_db = DatabaseConnection::getInstance();
        $this->extraFields = new ExtraFields($siteID, DATA_ITEM_COMPANY);
    }
    public function getModuleID($moduleName)    {        $sql = sprintf(            "SELECT                 `module_schema_id` AS 'module_schema_id'             FROM                 `module_schema`              WHERE                 `name` = %s",            $this->_db->makeQueryString($moduleName));                                $queryResult = $this->_db->getAllAssoc($sql);                if (!$queryResult)                {                        return 0;                    }        else         {            return $queryResult;        }            }
    public function getUserRole($userid)    {        $sql = sprintf(            "SELECT                 `user_role_id` AS `role_id`             FROM `user`              WHERE             `user_id` = %s",            $this->_db->makeQueryInteger($userid));                //echo $sql;                //$queryResult = $this->_db->query($sql);                $queryResult = $this->_db->getAllAssoc($sql);                        if (!$queryResult)                {            return 0;        }        else        {            return $queryResult;        }            }          public function varifyAccess($roleid,$moduleid)    {        $sql = sprintf(            "SELECT                 count(`role_module_id`) AS 'count'             FROM `user_role_module`              WHERE                 `user_role_id` =%s              AND                 `module_schema_id`= %s",            $this->_db->makeQueryInteger($roleid),            $this->_db->makeQueryInteger($moduleid)            );                        //echo $sql;                    $queryResult = $this->_db->getAllAssoc($sql);                        if (!$queryResult)                        {                                return 0;                            }            else            {                return $queryResult;            }    }    
}

?>
