<?php
/**
 * CATS
 * Suppliers Library
 *
 * Copyright (C) 2005 - 2007 Cognizo Technologies, Inc.
 *
 *
 * The contents of this file are subject to the CATS Public License
 * Version 1.1a (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.catsone.com/.
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is "CATS Standard Edition".
 *
 * The Initial Developer of the Original Code is Cognizo Technologies, Inc.
 * Portions created by the Initial Developer are Copyright (C) 2005 - 2007
 * (or from the year in which this file was created to the year 2007) by
 * Cognizo Technologies, Inc. All Rights Reserved.
 *
 *
 * @package    CATS
 * @subpackage Library
 * @copyright Copyright (C) 2005 - 2007 Cognizo Technologies, Inc.
 * @version    $Id: Suppliers.php 3690 2007-11-26 18:07:17Z brian $
 */

include_once('./lib/Pager.php');
include_once('./lib/ListEditor.php');
include_once('./lib/EmailTemplates.php');
include_once('./lib/Attachments.php');
include_once('./lib/JobOrders.php');
include_once('./lib/SuppliersContacts.php');


/**
 *  Suppliers Library
 *  @package    CATS
 *  @subpackage Library
 */
class Suppliers
{
    private $_db;
    private $_siteID;

    public $extraFields;


    public function __construct($siteID)
    {
        $this->_siteID = $siteID;
        $this->_db = DatabaseConnection::getInstance();
        $this->extraFields = new ExtraFields($siteID, DATA_ITEM_SUPPLIER);
    }


    /**
     * Adds a supplier to the database and returns its supplier ID.
     *
     * @param string Name
     * @param string Address line
     * @param string City
     * @param string State
     * @param string Zip code
     * @param string Phone 1
     * @param string Phone 2
     * @param string Url
     * @param string Key technologies
     * @param boolean Is supplier hot
     * @param string Supplier notes
     * @param integer Entered-by user
     * @param integer Owner user
     * @return new Supplier ID, or -1 on failure.
     */
    public function add($name, $address, $city, $state, $zip, $phone1,
                        $phone2, $faxNumber, $url, $keyTechnologies, $isHot,
                        $notes, $enteredBy, $owner)
    {
        $sql = sprintf(
            "INSERT INTO supplier (
                name,
                address,
                city,
                state,
                zip,
                phone1,
                phone2,
                fax_number,
                url,
                key_technologies,
                is_hot,
                notes,
                entered_by,
                owner,
                site_id,
                date_created,
                date_modified
            )
            VALUES (
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                NOW(),
                NOW()
            )",
            $this->_db->makeQueryString($name),
            $this->_db->makeQueryString($address),
            $this->_db->makeQueryString($city),
            $this->_db->makeQueryString($state),
            $this->_db->makeQueryString($zip),
            $this->_db->makeQueryString($phone1),
            $this->_db->makeQueryString($phone2),
            $this->_db->makeQueryString($faxNumber),
            $this->_db->makeQueryString($url),
            $this->_db->makeQueryString($keyTechnologies),
            ($isHot ? '1' : '0'),
            $this->_db->makeQueryString($notes),
            $this->_db->makeQueryInteger($enteredBy),
            $this->_db->makeQueryInteger($owner),
            $this->_siteID
        );

        $queryResult = $this->_db->query($sql);
        if (!$queryResult)
        {
            return -1;
        }

        $supplierID = $this->_db->getLastInsertID();

        $history = new History($this->_siteID);
        $history->storeHistoryNew(DATA_ITEM_SUPPLIER, $supplierID);

        return $supplierID;
    }

    /**
     * Updates a supplier.
     *
     * @param integer Supplier ID
     * @param string Name
     * @param string Address line
     * @param string City
     * @param string State
     * @param string Zip Code
     * @param string Phone 1
     * @param string Phone 2
     * @param string URL
     * @param string Key Technologies
     * @param boolean Is supplier hot
     * @param string Supplier notes
     * @param integer Owner user
     * @param integer Billing contact ID
     * @return boolean True if successful; false otherwise.
     */
    public function update($supplierID, $name, $address, $city, $state,
                           $zip, $phone1, $phone2, $faxNumber, $url,
                           $keyTechnologies, $isHot, $notes, $owner,
                           $billingContact, $email, $emailAddress)
    {                //echo $supplierID;        //  exit;
        $sql = sprintf(
            "UPDATE
                supplier
             SET
                name             = %s,
                address         = %s,
                city             = %s,
                state            = %s,
                zip              = %s,
                phone1           = %s,
                phone2           = %s,
                fax_number       = %s,
                url              = %s,
                key_technologies = %s,
                is_hot           = %s,
                notes            = %s,
                billing_contact  = %s,
                owner            = %s,
                date_modified    = NOW()
            WHERE
                supplier_id = %s
            AND
                site_id = %s",
            $this->_db->makeQueryString($name),
            $this->_db->makeQueryString($address),
            $this->_db->makeQueryString($city),
            $this->_db->makeQueryString($state),
            $this->_db->makeQueryString($zip),
            $this->_db->makeQueryString($phone1),
            $this->_db->makeQueryString($phone2),
            $this->_db->makeQueryString($faxNumber),
            $this->_db->makeQueryString($url),
            $this->_db->makeQueryString($keyTechnologies),
            ($isHot ? '1' : '0'),
            $this->_db->makeQueryString($notes),
            $this->_db->makeQueryInteger($billingContact),
            $this->_db->makeQueryInteger($owner),
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID
        );

        $preHistory = $this->get($supplierID);                //echo  $sql;        //exit;
        $queryResult = $this->_db->query($sql);
        $postHistory = $this->get($supplierID);

        if (!$queryResult)
        {
            return false;
        }

        $history = new History($this->_siteID);
        $history->storeHistoryChanges(DATA_ITEM_SUPPLIER, $supplierID, $preHistory, $postHistory);

        if (!empty($emailAddress))
        {
            /* Send e-mail notification. */
            //FIXME: Make subject configurable.
            $mailer = new Mailer($this->_siteID);
            $mailerStatus = $mailer->sendToOne(
                array($emailAddress, ''),
                'CATS Notification: Supplier Ownership Change',
                $email,
                true
            );
        }

        return true;
    }

    /**
     * Removes a supplier and all associated records from the system.
     *
     * @param integer Supplier ID
     * @return void
     */
    public function delete($supplierID)
    {
        /* Delete the supplier. */
        $sql = sprintf(
            "DELETE FROM
                supplier
            WHERE
                supplier_id = %s
            AND
                site_id = %s",
            $supplierID,
            $this->_siteID
        );        //echo $sql;        //exit;        
        $this->_db->query($sql);

        $history = new History($this->_siteID);
        $history->storeHistoryDeleted(DATA_ITEM_SUPPLIER, $supplierID);

        /* Find associated supplierscontacts. */        /*
        $sql = sprintf(
            "SELECT
                contact_id AS contactID
            FROM
                contact
            WHERE
                supplier_id = %s
            AND
                site_id = %s",
            $supplierID,
            $this->_siteID
        );        */                $sql = sprintf(                        "SELECT                            suppliercontact_id AS contactID                        FROM                            suppliercontact                        WHERE                            supplier_id = %s                        AND                            site_id = %s",                        $supplierID,                        $this->_siteID                        );        
        $supplierscontactsRS = $this->_db->getAllAssoc($sql);

        /* Find associated job orders. */
        $sql = sprintf(
            "SELECT
                joborder_id AS jobOrderID
            FROM
                joborder
            WHERE
                supplier_id = %s
            AND
                site_id = %s",
            $supplierID,
            $this->_siteID
        );
        $jobOrdersRS = $this->_db->getAllAssoc($sql);

        /* Find associated attachments. */
        $attachments = new Attachments($this->_siteID);
        $attachmentsRS = $attachments->getAll(
            DATA_ITEM_SUPPLIER, $supplierID
        );

        /* Delete associated supplierscontacts. */
        $supplierscontacts = new SuppliersContacts($this->_siteID);
        foreach ($supplierscontactsRS as $rowIndex => $row)
        {
            $supplierscontacts->delete($row['contactID']);
        }

        /* Delete associated job orders. */
        $jobOrders = new JobOrders($this->_siteID);
        foreach ($jobOrdersRS as $rowIndex => $row)
        {
            $jobOrders->delete($row['jobOrderID']);
        }

        /* Delete associated attachments. */
        foreach ($attachmentsRS as $rowNumber => $row)
        {
            $attachments->delete($row['attachmentID']);
        }

        /* Delete from saved lists. */
        $sql = sprintf(
            "DELETE FROM
                saved_list_entry
            WHERE
                data_item_id = %s
            AND
                site_id = %s
            AND
                data_item_type = %s",
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID,
            DATA_ITEM_SUPPLIER
        );
        $this->_db->query($sql);

        /* Delete extra fields. */
        $this->extraFields->deleteValueByDataItemID($supplierID);
    }

    /**
     * Returns all relevent supplier information for a given supplier ID.
     *
     * @param integer Supplier ID
     * @return array Supplier data
     */
    public function get($supplierID)
    {
        $sql = sprintf(
            "SELECT
                supplier.supplier_id AS supplierID,
                supplier.owner AS owner,
                supplier.name AS name,
                supplier.is_hot AS isHot,
                supplier.address AS address,
                supplier.city AS city,
                supplier.state AS state,
                supplier.zip AS zip,
                supplier.phone1 AS phone1,
                supplier.phone2 AS phone2,
                supplier.fax_number AS faxNumber,
                supplier.url AS url,
                supplier.key_technologies AS keyTechnologies,
                supplier.notes AS notes,
                supplier.default_supplier AS defaultSupplier,
                billing_contact.contact_id AS billingContact,
                CONCAT(
                    billing_contact.first_name, ' ', billing_contact.last_name
                ) AS billingContactFullName,
                DATE_FORMAT(
                    supplier.date_created, '%%m-%%d-%%y (%%h:%%i %%p)'
                ) AS dateCreated,
                CONCAT(
                    entered_by_user.first_name, ' ', entered_by_user.last_name
                ) AS enteredByFullName,
                CONCAT(
                    owner_user.first_name, ' ', owner_user.last_name
                ) AS ownerFullName,
                owner_user.email AS owner_email
            FROM
                supplier
            LEFT JOIN user AS entered_by_user
                ON supplier.entered_by = entered_by_user.user_id
            LEFT JOIN user AS owner_user
                ON supplier.owner = owner_user.user_id
            LEFT JOIN contact AS billing_contact
                ON supplier.billing_contact = billing_contact.contact_id
            WHERE
                supplier.supplier_id = %s
            AND
                supplier.site_id = %s",
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID
        );

        return $this->_db->getAssoc($sql);
    }

    /**
     * Returns all supplier information relevent for the Edit Supplier page for
     * a given supplier ID.
     *
     * @param integer Supplier ID
     * @return array Supplier data
     */
    public function getForEditing($supplierID)
    {
        $sql = sprintf(
            "SELECT
                supplier.supplier_id AS supplierID,
                supplier.owner AS owner,
                supplier.name AS name,
                supplier.is_hot AS isHot,
                supplier.address AS address,
                supplier.city AS city,
                supplier.state AS state,
                supplier.zip AS zip,
                supplier.phone1 AS phone1,
                supplier.phone2 AS phone2,
                supplier.fax_number AS faxNumber,
                supplier.url AS url,
                supplier.key_technologies AS keyTechnologies,
                supplier.notes AS notes,
                supplier.default_supplier AS defaultSupplier,
                billing_contact.contact_id AS billingContact
            FROM
                supplier
            LEFT JOIN contact AS billing_contact
                ON supplier.billing_contact = billing_contact.contact_id
            WHERE
                supplier.supplier_id = %s
            AND
                supplier.site_id = %s",
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID
        );
        //echo $sql;
        return $this->_db->getAssoc($sql);
    }

    /**
     * Used by new site creation code to set a new supplier as the
     * default supplier for a site.  The default supplier can
     * not be deleted, and is referred to as "Internal Postings."
     *
     * @param integer Supplier ID
     * @return array Supplier data
     */
    public function setSupplierDefault($supplierID)
    {
        $sql = sprintf(
            "UPDATE
                supplier
             SET
                default_supplier = 1,
                date_modified  = NOW()
            WHERE
                supplier_id = %s",
            $this->_db->makeQueryInteger($supplierID)
        );

        $preHistory = $this->get($supplierID);
        $queryResult = $this->_db->query($sql);
        $postHistory = $this->get($supplierID);

        if (!$queryResult)
        {
            return false;
        }

        $history = new History($this->_siteID);
        $history->storeHistoryChanges(
            DATA_ITEM_SUPPLIER, $supplierID, $preHistory, $postHistory
        );

        return true;
    }

    /**
     * Returns all relevent supplier information for a given supplier ID.
     *
     * @param integer Supplier ID
     * @return array Supplier data
     */
    public function getDefaultSupplier()
    {
        $sql = sprintf(
            "SELECT
                supplier.supplier_id AS supplierID
            FROM
                supplier
            WHERE
                supplier.default_supplier = 1
            AND
                supplier.site_id = %s",
            $this->_siteID
        );
        $rs = $this->_db->getAssoc($sql);

        if (empty($rs))
        {
            return false;
        }

        return $rs['supplierID'];
    }


    /**
     * Returns all relevent supplier information for a given supplier ID.
     *
     * @param integer Supplier ID
     * @return array Supplier data
     */
    public function getSupplierName($supplierID)
    {
        $sql = sprintf(
            "SELECT
                supplier.name AS supplierName
            FROM
                supplier
             WHERE
                supplier.supplier_id = %s
            AND
                supplier.site_id = %s",
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID
        );
        $rs = $this->_db->getAssoc($sql);

        if (empty($rs))
        {
            return false;
        }

        return $rs['supplierName'];
    }
    /**
     * Returns a minimal record set of all suppliers (for use when creating
     * drop-down lists of suppliers, etc.).
     *
     * @return array Suppliers data
     */
    public function getSelectList()
    {
        $sql = sprintf(
            "SELECT
                supplier.supplier_id AS supplierID,
                supplier.name AS name
            FROM
                supplier
            WHERE
                supplier.site_id = %s
            ORDER BY
                supplier.name ASC",
            $this->_siteID
        );

        return $this->_db->getAllAssoc($sql);
     }

    /**
     * Returns an array of location data (city, state, zip) for the specified
     * supplier ID.
     *
     * @param integer Supplier ID
     * @return array Suppliers data
     */
    public function getLocationArray($supplierID)
    {
        $sql = sprintf(
            "SELECT
                supplier.address AS address,
                supplier.city AS city,
                supplier.state AS state,
                supplier.zip AS zip
            FROM
                supplier
            WHERE
                supplier.supplier_id = %s
            AND
                supplier.site_id = %s",
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID
        );

        return $this->_db->getAssoc($sql);
     }

    /**
     * Returns an array of supplierscontacts data (contactID, firstName, lastName)
     * for the specified supplier ID.
     *
     * @param integer Supplier ID
     * @return array Contacts data
     */                        public function getSupplierContactsArray($supplierID)
    {
        $sql = sprintf(
            "SELECT
                suppliercontact.suppliercontact_id AS suppliercontactID,
                suppliercontact.first_name AS firstName,
                suppliercontact.last_name AS lastName
            FROM
                suppliercontact
            WHERE
                suppliercontact.supplier_id = %s
            AND
                suppliercontact.site_id = %s
            ORDER BY
                suppliercontact.last_name ASC,
                suppliercontact.first_name ASC",
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID
        );

        return $this->_db->getAllAssoc($sql);
     }
     public function getSuppliersContactsArray($supplierID)          {                  $sql = sprintf(                          "SELECT                             suppliercontact.suppliercontact_id AS suppliercontactID,                             suppliercontact.first_name AS firstName,                             suppliercontact.last_name AS lastName                         FROM                             suppliercontact                         WHERE                             suppliercontact.supplier_id = %s                         AND                             suppliercontact.site_id = %s                         ORDER BY                             suppliercontact.last_name ASC,                             suppliercontact.first_name ASC",                          $this->_db->makeQueryInteger($supplierID),                          $this->_siteID                          );                                    return $this->_db->getAllAssoc($sql);              }
   /**
     * Returns an array of supplierscontacts data (contactID, firstName, lastName)
     * for the specified supplier ID.
     *
     * @param integer Supplier ID
     * @return array Contacts data
     */
    public function getSupplierContact($suppliercontactID)
    {
        $sql = sprintf(
            "SELECT
                suppliercontact.suppliercontact_id AS suppliercontactID,
                suppliercontact.first_name AS firstName,
                suppliercontact.last_name AS lastName
            FROM
                suppliercontact
            WHERE
                suppliercontact.suppliercontact_id = %s
            AND
                suppliercontact.site_id = %s
            ORDER BY
                suppliercontact.last_name ASC,
                suppliercontact.first_name ASC",
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID
        );

        return $this->_db->getAllAssoc($sql);
     }

    /**
     * Returns an array of job orders data (jobOrderID, title, supplierName)
     * for the specified supplier ID.
     *
     * @param integer Supplier ID
     * @return array Job Orders data
     */
    public function getJobOrdersArray($supplierID)
    {
        $sql = sprintf(
            "SELECT
                joborder.joborder_id AS jobOrderID,
                joborder.title AS title,
                supplier.name AS supplierName
            FROM
                joborder
            LEFT JOIN supplier
                ON joborder.supplier_id = supplier.supplier_id
            WHERE
                joborder.supplier_id = %s
            AND
                joborder.site_id = %s
            ORDER BY
                title ASC",
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID
        );

        return $this->_db->getAllAssoc($sql);
     }

    /**
     * Returns a response array of all departments for a supplier.
     * by getDifferencesFromList (ListEditor.php).
     *
     * @param integer Supplier ID
     * @return array Departments
     */
    public function getDepartments($supplierID)
    {
        $sql = sprintf(
            "SELECT
                supplier_department.supplier_department_id AS departmentID,
                supplier_department.name AS name
            FROM
                supplier_department
            WHERE
                supplier_department.site_id = %s
            AND
                supplier_department.supplier_id = %s
            ORDER BY
                supplier_department.name ASC",
            $this->_siteID,
            $this->_db->makeQueryInteger($supplierID)
        );

        return $this->_db->getAllAssoc($sql);
    }

    /**
     * Updates a suppliers departments with an array generated
     * by getDifferencesFromList (ListEditor.php).
     *
     * @param integer Supplier ID
     * @param array getDifferencesFromList
     * @return void
     */
    public function updateDepartments($supplierID, $updates)
    {
        $history = new History($this->_siteID);

        foreach ($updates as $update)
        {
            switch ($update[2])
            {
                case LIST_EDITOR_ADD:
                    $sql = sprintf(
                        "INSERT INTO supplier_department (
                            name,
                            supplier_id,
                            site_id,
                            date_created
                         )
                         VALUES (
                            %s,
                            %s,
                            %s,
                            NOW()
                         )",
                         $this->_db->makeQueryString($update[0]),
                         $this->_db->makeQueryInteger($supplierID),
                         $this->_siteID
                    );
                    $this->_db->query($sql);

                    $history->storeHistorySimple(
                        DATA_ITEM_SUPPLIER,
                        0,
                        '(USER) added ' . $update[0] . ' to departments.'
                    );

                    break;

                case LIST_EDITOR_REMOVE:
                    $sql = sprintf(
                        "DELETE FROM
                            supplier_department
                         WHERE
                            supplier_department_id = %s
                         AND
                            site_id = %s",
                         $this->_db->makeQueryInteger($update[1]),
                         $this->_siteID
                    );
                    $this->_db->query($sql);

                    $history->storeHistorySimple(
                        DATA_ITEM_SUPPLIER,
                        0,
                        '(USER) removed ' . $update[0] . ' from departments.'
                    );

                    break;

                case LIST_EDITOR_MODIFY:
                    $sql = sprintf(
                        "UPDATE
                            supplier_department
                         SET
                            name = %s
                         WHERE
                            supplier_department_id = %s
                         AND
                            site_id = %s",
                         $this->_db->makeQueryString($update[0]),
                         $this->_db->makeQueryInteger($update[1]),
                         $this->_siteID
                    );
                    $this->_db->query($sql);

                    $history->storeHistorySimple(
                        DATA_ITEM_SUPPLIER,
                        0,
                        '(USER) renamed a department to ' . $update[0] . '.'
                    );

                    break;

                default:
                    break;
            }
        }
    }
}


class SuppliersDataGrid extends DataGrid
{
    protected $_siteID;


    // FIXME: Fix ugly indenting - ~400 character lines = bad.
    public function __construct($instanceName, $siteID, $parameters, $misc)
    {
        $this->_db = DatabaseConnection::getInstance();
        $this->_siteID = $siteID;
        $this->_assignedCriterion = "";
        $this->_dataItemIDColumn = 'supplier.supplier_id';

        $this->_classColumns = array(
            'Attachments' => array(  'select'   => 'IF(attachment_id, 1, 0) AS attachmentPresent',
                                     'pagerRender' => '
                                                    if ($rsData[\'attachmentPresent\'] == 1)
                                                    {
                                                        $return = \'<img src="images/paperclip.gif" alt="" width="16" height="16" title="Attachment Present" />\';
                                                    }
                                                    else
                                                    {
                                                        $return = \'<img src="images/mru/blank.gif" alt="" width="16" height="16" />\';
                                                    }

                                                    return $return;
                                                   ',

                                     'pagerWidth'    => 10,
                                     'pagerOptional' => true,
                                     'pagerNoTitle' => true,
                                     'sizable'  => false,
                                     'exportable' => false,
                                     'filterable' => false),

            'Name' =>     array('select'         => 'supplier.name AS name',
                                      'pagerRender'    => 'if ($rsData[\'isHot\'] == 1) $className =  \'jobLinkHot\'; else $className = \'jobLinkCold\'; return \'<a href="'.CATSUtility::getIndexName().'?m=suppliers&amp;a=show&amp;supplierID=\'.$rsData[\'supplierID\'].\'" class="\'.$className.\'">\'.htmlspecialchars($rsData[\'name\']).\'</a>\';',
                                      'sortableColumn' => 'name',
                                      'pagerWidth'     => 60,
                                      'pagerOptional'  => false,
                                      'alphaNavigation'=> true,
                                      'filter'         => 'supplier.name'),

            'Jobs' =>       array('select'   => '(
                                                            SELECT
                                                                COUNT(*)
                                                            FROM
                                                                joborder
                                                            WHERE
                                                                supplier_id = supplier.supplier_id
                                                            AND
                                                                site_id = '.$this->_siteID.'
                                                        ) AS jobs',
                                     'pagerRender'      => 'if ($rsData[\'jobs\'] != 0) {return $rsData[\'jobs\'];} else {return \'\';}',
                                     'sortableColumn'     => 'jobs',
                                     'pagerWidth'    => 40,
                                     'filterHaving'  => 'jobs',
                                     'filterTypes'   => '===>=<'),

            'Phone' =>     array('select'   => 'supplier.phone1 AS phone',
                                     'sortableColumn'     => 'phone',
                                     'pagerWidth'    => 80,
                                     'filter'         => 'supplier.phone1'),

            'Phone 2' =>     array('select'   => 'supplier.phone2 AS phone2',
                                     'sortableColumn'     => 'phone2',
                                     'pagerWidth'    => 80,
                                     'filter'         => 'supplier.phone2'),


            'City' =>           array('select'   => 'supplier.city AS city',
                                     'sortableColumn'     => 'city',
                                     'pagerWidth'    => 80,
                                     'alphaNavigation' => true,
                                     'filter'         => 'supplier.city'),


            'State' =>          array('select'   => 'supplier.state AS state',
                                     'sortableColumn'     => 'state',
                                     'filterType' => 'dropDown',
                                     'pagerWidth'    => 50,
                                     'alphaNavigation' => true,
                                     'filter'         => 'supplier.state'),

            'Zip' =>            array('select'  => 'supplier.zip AS zip',
                                     'sortableColumn'    => 'zip',
                                     'pagerWidth'   => 50,
                                     'filter'         => 'supplier.zip'),


            'Web Site' =>      array('select'  => 'supplier.url AS webSite',
                                     'pagerRender'     => 'return \'<a href="\'.htmlspecialchars($rsData[\'webSite\']).\'" target="_blank">\'.htmlspecialchars($rsData[\'webSite\']).\'</a>\';',
                                     'sortableColumn'    => 'webSite',
                                     'pagerWidth'   => 80,
                                     'filter'         => 'supplier.url'),

            'Owner' =>         array('select'   => 'owner_user.first_name AS ownerFirstName,' .
                                                   'owner_user.last_name AS ownerLastName,' .
                                                   'CONCAT(owner_user.last_name, owner_user.first_name) AS ownerSort',
                                     'pagerRender'      => 'return StringUtility::makeInitialName($rsData[\'ownerFirstName\'], $rsData[\'ownerLastName\'], false, LAST_NAME_MAXLEN);',
                                     'exportRender'     => 'return $rsData[\'ownerFirstName\'] . " " .$rsData[\'ownerLastName\'];',
                                     'sortableColumn'     => 'ownerSort',
                                     'pagerWidth'    => 75,
                                     'alphaNavigation' => true,
                                     'filter'         => 'CONCAT(owner_user.first_name, owner_user.last_name)'),

            'Contact' =>       array('select'   => 'suppliercontact.first_name AS contactFirstName,' .
                                                   'suppliercontact.last_name AS contactLastName,' .
                                                   'CONCAT(suppliercontact.last_name, suppliercontact.first_name) AS contactSort,' .
                                                   'suppliercontact.contact_id AS contactID',
                                     'pagerRender'      => 'return \'<a href="'.CATSUtility::getIndexName().'?m=supplierscontacts&amp;a=show&amp;contactID=\'.$rsData[\'contactID\'].\'">\'.StringUtility::makeInitialName($rsData[\'contactFirstName\'], $rsData[\'contactLastName\'], false, LAST_NAME_MAXLEN).\'</a>\';',
                                     'exportRender'     => 'return $rsData[\'contactFirstName\'] . " " .$rsData[\'contactLastName\'];',
                                     'sortableColumn'     => 'contactSort',
                                     'pagerWidth'    => 75,
                                     'alphaNavigation' => true,
                                     'filter'         => 'CONCAT(suppliercontact.first_name, suppliercontact.last_name)'),


            'Created' =>       array('select'   => 'DATE_FORMAT(supplier.date_created, \'%m-%d-%y\') AS dateCreated',
                                     'pagerRender'      => 'return $rsData[\'dateCreated\'];',
                                     'sortableColumn'     => 'dateCreatedSort',
                                     'pagerWidth'    => 60,
                                     'filterHaving' => 'DATE_FORMAT(supplier.date_created, \'%m-%d-%y\')'),

            'Modified' =>      array('select'   => 'DATE_FORMAT(supplier.date_modified, \'%m-%d-%y\') AS dateModified',
                                     'pagerRender'      => 'return $rsData[\'dateModified\'];',
                                     'sortableColumn'     => 'dateModifiedSort',
                                     'pagerWidth'    => 60,
                                     'pagerOptional' => false,
                                     'filterHaving' => 'DATE_FORMAT(supplier.date_modified, \'%m-%d-%y\')'),

            'Misc Notes' =>     array('select'  => 'supplier.notes AS notes',
                                     'sortableColumn'    => 'notes',
                                     'pagerWidth'   => 300,
                                     'filter'         => 'supplier.notes'),

            'OwnerID' =>       array('select'    => '',
                                     'filter'    => 'supplier.owner',
                                     'pagerOptional' => false,
                                     'filterable' => false,
                                     'filterDescription' => 'Only My Suppliers'),

            'IsHot' =>         array('select'    => '',
                                     'filter'    => 'supplier.is_hot',
                                     'pagerOptional' => false,
                                     'filterable' => false,
                                     'filterDescription' => 'Only Hot Suppliers')
        );

        if (US_ZIPS_ENABLED)
        {
            $this->_classColumns['Near Zipcode'] =
                               array('select'  => 'supplier.zip AS zip',
                                     'filter' => 'supplier.zip',
                                     'pagerOptional' => false,
                                     'filterTypes'   => '=@');
        }

        /* Extra fields get added as columns here. */
        $suppliers = new Suppliers($this->_siteID);
        $extraFieldsRS = $suppliers->extraFields->getSettings();
        foreach ($extraFieldsRS as $index => $data)
        {
            $fieldName = $data['fieldName'];

            if (!isset($this->_classColumns[$fieldName]))
            {
                $columnDefinition = $suppliers->extraFields->getDataGridDefinition($index, $data, $this->_db);

                /* Return false for extra fields that should not be columns. */
                if ($columnDefinition !== false)
                {
                    $this->_classColumns[$fieldName] = $columnDefinition;
                }
            }
        }

        parent::__construct($instanceName, $parameters, $misc);
    }

    /**
     * Returns the sql statment for the pager.
     *
     * @return array Clients data
     */
    public function getSQL($selectSQL, $joinSQL, $whereSQL, $havingSQL, $orderSQL, $limitSQL, $distinct = '')
    {
        if ($this->getMiscArgument() != 0)
        {
            $savedListID = (int) $this->getMiscArgument();
            $joinSQL  .= ' INNER JOIN saved_list_entry
                                    ON saved_list_entry.data_item_type = '.DATA_ITEM_SUPPLIER.'
                                    AND saved_list_entry.data_item_id = supplier.supplier_id
                                    AND saved_list_entry.site_id = '.$this->_siteID.'
                                    AND saved_list_entry.saved_list_id = '.$savedListID;
        }
        else
        {
            $joinSQL  .= ' LEFT JOIN saved_list_entry
                                    ON saved_list_entry.data_item_type = '.DATA_ITEM_SUPPLIER.'
                                    AND saved_list_entry.data_item_id = supplier.supplier_id
                                    AND saved_list_entry.site_id = '.$this->_siteID;
        }

        $sql = sprintf(
            "SELECT SQL_CALC_FOUND_ROWS %s
                IF(attachment_id, 1, 0) AS attachmentPresent,
                supplier.is_hot AS isHot,
                supplier.supplier_id AS supplierID,
                supplier.supplier_id AS exportID,
                supplier.is_hot AS isHot,
                supplier.date_modified AS dateModifiedSort,
                supplier.date_created AS dateCreatedSort,
            %s
            FROM
                supplier
            LEFT JOIN user AS owner_user
                ON supplier.owner = owner_user.user_id
            LEFT JOIN joborder
                ON supplier.supplier_id = joborder.supplier_id
            LEFT JOIN contact
                ON supplier.billing_contact = contact.contact_id
            LEFT JOIN attachment
                ON supplier.supplier_id = attachment.data_item_id
                AND attachment.data_item_type = %s
            %s
            WHERE
                supplier.site_id = %s
            %s
            %s
            GROUP BY supplier.supplier_id
            %s
            %s
            %s",
            $distinct,
            $selectSQL,
            DATA_ITEM_SUPPLIER,
            $joinSQL,
            $this->_siteID,
            (strlen($whereSQL) > 0) ? ' AND ' . $whereSQL : '',
            $this->_assignedCriterion,
            (strlen($havingSQL) > 0) ? ' HAVING ' . $havingSQL : '',
            $orderSQL,
            $limitSQL
        );

        return $sql;
    }
}


?>
