<?php
/**
 * CATS
 * SuppliersContacts Library
 *
 * Copyright (C) 2005 - 2007 Cognizo Technologies, Inc.
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
 * @version    $Id: SuppliersContacts.php 3690 2007-11-26 18:07:17Z brian $
 */

include_once('./lib/Pager.php');
include_once('./lib/EmailTemplates.php');
include_once('./lib/ExtraFields.php');
include_once('./lib/Calendar.php');

/**
 *	SuppliersContacts Library
 *	@package    CATS
 *	@subpackage Library
 */
class SuppliersContacts
{
    private $_db;
    private $_siteID;

    public $extraFields;


    public function __construct($siteID)
    {
        $this->_siteID = $siteID;
        $this->_db = DatabaseConnection::getInstance();
        $this->extraFields = new ExtraFields($siteID, DATA_ITEM_CONTACT);
    }


    /**
     * Adds a suppliercontact to the database and returns its suppliercontact ID.
     *
     * @param integer supplier ID
     * @param string first name
     * @param string last name
     * @param string title
     * @param string department
     * @param string e-mail address 1
     * @param string e-mail address 2
     * @param string work phone number
     * @param string cell phone number
     * @param string other phone number
     * @param string address line
     * @param string city
     * @param string state
     * @param string zip code
     * @param boolean is hot
     * @param string suppliercontact notes
     * @param integer entered-by user
     * @param integer owner user
     * @return new suppliercontact ID, or -1 on failure.
     */
    public function add($supplierID, $firstName, $lastName, $title, $department,
        $reportsTo, $email1, $email2, $phoneWork, $phoneCell, $phoneOther, $address,
        $city, $state, $zip, $isHot, $notes, $enteredBy, $owner)
    {
        /* Get the department ID of the selected department. */
        $departmentID = $this->getDepartmentIDByName(
            $department, $supplierID, $this->_db
        );

        $sql = sprintf(
            "INSERT INTO suppliercontact (
                supplier_id,
                first_name,
                last_name,
                title,
                supplier_department_id,
                reports_to,
                email1,
                email2,
                phone_work,
                phone_cell,
                phone_other,
                address,
                city,
                state,
                zip,
                is_hot,
                left_supplier,
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
                %s,
                0,
                %s,
                %s,
                %s,
                %s,
                NOW(),
                NOW()
            )",
            $this->_db->makeQueryInteger($supplierID),
            $this->_db->makeQueryString($firstName),
            $this->_db->makeQueryString($lastName),
            $this->_db->makeQueryString($title),
            $this->_db->makeQueryInteger($departmentID),
            $this->_db->makeQueryInteger($reportsTo),
            $this->_db->makeQueryString($email1),
            $this->_db->makeQueryString($email2),
            $this->_db->makeQueryString($phoneWork),
            $this->_db->makeQueryString($phoneCell),
            $this->_db->makeQueryString($phoneOther),
            $this->_db->makeQueryString($address),
            $this->_db->makeQueryString($city),
            $this->_db->makeQueryString($state),
            $this->_db->makeQueryString($zip),
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

        $suppliercontactID = $this->_db->getLastInsertID();

        $history = new History($this->_siteID);
        $history->storeHistoryNew(DATA_ITEM_CONTACT, $suppliercontactID);

        return $suppliercontactID;
    }

    /**
     * Updates a suppliercontact.
     *
     * @param integer suppliercontact ID
     * @param integer supplier ID
     * @param string first name
     * @param string last name
     * @param string title
     * @param string department
     * @param string e-mail address 1
     * @param string e-mail address 2
     * @param string work phone number
     * @param string cell phone number
     * @param string other phone number
     * @param string address line
     * @param string city
     * @param string state
     * @param string zip code
     * @param boolean is hot
     * @param boolean left supplier
     * @param string suppliercontact notes
     * @param integer owner user
     * @param array argument array
     * @param string e-mail notification message
     * @param string e-mail notification address
     * @return boolean True if successful; false otherwise.
     */
    public function update($suppliercontactID, $supplierID, $firstName, $lastName,
        $title, $department, $reportsTo, $email1, $email2, $phoneWork, $phoneCell,
        $phoneOther, $address, $city, $state, $zip, $isHot,
        $leftSupplier, $notes, $owner, $email, $emailAddress)
    {
        /* Get the department ID of the selected department. */
        $departmentID = $this->getDepartmentIDByName(
            $department, $supplierID, $this->_db
        );

        $sql = sprintf(
            "UPDATE
                suppliercontact
            SET
                suppliercontact.supplier_id     = %s,
                suppliercontact.first_name    = %s,
                suppliercontact.last_name     = %s,
                suppliercontact.title         = %s,
                suppliercontact.supplier_department_id = %s,
                suppliercontact.reports_to    = %s,
                suppliercontact.email1        = %s,
                suppliercontact.email2        = %s,
                suppliercontact.phone_work    = %s,
                suppliercontact.phone_cell    = %s,
                suppliercontact.phone_other   = %s,
                suppliercontact.address       = %s,
                suppliercontact.city          = %s,
                suppliercontact.state         = %s,
                suppliercontact.zip           = %s,
                suppliercontact.is_hot        = %s,
                suppliercontact.left_supplier  = %s,
                suppliercontact.notes         = %s,
                suppliercontact.owner         = %s,
                suppliercontact.date_modified = NOW()
            WHERE
                suppliercontact.suppliercontact_id = %s
            AND
                suppliercontact.site_id = %s",
            $this->_db->makeQueryInteger($supplierID),
            $this->_db->makeQueryString($firstName),
            $this->_db->makeQueryString($lastName),
            $this->_db->makeQueryString($title),
            $this->_db->makeQueryInteger($departmentID),
            $this->_db->makeQueryInteger($reportsTo),
            $this->_db->makeQueryString($email1),
            $this->_db->makeQueryString($email2),
            $this->_db->makeQueryString($phoneWork),
            $this->_db->makeQueryString($phoneCell),
            $this->_db->makeQueryString($phoneOther),
            $this->_db->makeQueryString($address),
            $this->_db->makeQueryString($city),
            $this->_db->makeQueryString($state),
            $this->_db->makeQueryString($zip),
            ($isHot ? '1' : '0'),
            ($leftSupplier ? '1' : '0'),
            $this->_db->makeQueryString($notes),
            $this->_db->makeQueryInteger($owner),
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID
        );

        $preHistory = $this->get($suppliercontactID);
        $queryResult = $this->_db->query($sql);
        $postHistory = $this->get($suppliercontactID);

        if (!$queryResult)
        {
            return false;
        }

        $history = new History($this->_siteID);
        $history->storeHistoryChanges(
            DATA_ITEM_CONTACT, $suppliercontactID, $preHistory, $postHistory
        );

        if (!empty($emailAddress))
        {
            /* Send e-mail notification. */
            //FIXME: Make subject configurable.
            $mailer = new Mailer($this->_siteID);
            $mailerStatus = $mailer->sendToOne(
                array($emailAddress, ''),
                'CATS Notification: Contact Ownership Change',
                $email,
                true
            );
        }

        return true;
    }


    /**
     * Updates all supplierscontacts for a supplier (called when changing supplier details).
     *
     * @param integer supplier ID
     * @param string address line
     * @param string city
     * @param string state
     * @param string zip code
     * @return boolean True if successful; false otherwise.
     */
    public function updateBySupplier($supplierID, $address, $city,
        $state, $zip)
    {
        $sql = sprintf(
            "UPDATE
                suppliercontact
            SET
                address      = %s,
                city          = %s,
                state         = %s,
                zip           = %s,
                date_modified = NOW()
            WHERE
                left_supplier != 1
            AND
                supplier_id = %s
            AND
                site_id = %s",
            $this->_db->makeQueryString($address),
            $this->_db->makeQueryString($city),
            $this->_db->makeQueryString($state),
            $this->_db->makeQueryString($zip),
            $this->_db->makeQueryInteger($supplierID),
            $this->_siteID
        );

        $queryResult = $this->_db->query($sql);
        if (!$queryResult)
        {
            return false;
        }

        return true;
    }

    /**
     * Removes a suppliercontact and all associated records from the system.
     *
     * @param integer suppliercontact ID
     * @return void
     */
    public function delete($suppliercontactID)
    {
        $sql = sprintf(
            "DELETE FROM
                suppliercontact
            WHERE
                suppliercontact_id = %s
            AND
                site_id = %s",
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID
        );
        $this->_db->query($sql);

        $sql = sprintf(
            "UPDATE
                suppliercontact
            SET
                reports_to = -1
            WHERE
                reports_to = %s
            AND
                site_id = %s",
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID
        );
        $this->_db->query($sql);

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
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID,
            DATA_ITEM_CONTACT
        );
        $this->_db->query($sql);

        /* Delete extra fields. */
        $this->extraFields->deleteValueByDataItemID($suppliercontactID);

        $history = new History($this->_siteID);
        $history->storeHistoryDeleted(DATA_ITEM_CONTACT, $suppliercontactID);
    }
    
    /**
     * Returns number of total activities (for supplierscontacts datagrid).
     *
     * @return integer count
     */
    public function getCount()
    {
        $sql = sprintf(
            "SELECT
                COUNT(*) AS totalSuppliersContacts
            FROM
                suppliercontact
            WHERE
                suppliercontact.site_id = %s",
            $this->_siteID
        );

        return $this->_db->getColumn($sql, 0, 0);
    }

    /**
     * Returns all relevent suppliercontact information for a given suppliercontact ID.
     *
     * @param integer suppliercontact ID
     * @return array suppliercontact dats
     */
    public function get($suppliercontactID)
    {
        $sql = sprintf(
            "SELECT
                suppliercontact.suppliercontact_id AS suppliercontactID,
                suppliercontact.supplier_id AS supplierID,
                suppliercontact.owner AS owner,
                suppliercontact.last_name AS lastName,
                suppliercontact.first_name AS firstName,
                suppliercontact.title AS title,
                suppliercontact.email1 AS email1,
                suppliercontact.email2 AS email2,
                suppliercontact.phone_work AS phoneWork,
                suppliercontact.phone_cell AS phoneCell,
                suppliercontact.phone_other AS phoneOther,
                suppliercontact.address AS address,
                suppliercontact.city AS city,
                suppliercontact.state AS state,
                suppliercontact.zip AS zip,
                suppliercontact.notes AS notes,
                suppliercontact.is_hot AS isHotContact,
                suppliercontact.left_supplier AS leftSupplier,
                suppliercontact.reports_to AS reportsTo,
                reportsToContact.first_name as reportsToFirstName,
                reportsToContact.last_name as reportsToLastName,
                reportsToContact.title as reportsToTitle,
                supplier_department.name AS department,
                DATE_FORMAT(
                    suppliercontact.date_created, '%%m-%%d-%%y (%%h:%%i %%p)'
                ) AS dateCreated,
                DATE_FORMAT(
                    suppliercontact.date_modified, '%%m-%%d-%%y (%%h:%%i %%p)'
                ) AS dateModified,
                supplier.name AS supplierName,
                supplier.is_hot AS isHotSupplier,
                CONCAT(
                    entered_by_user.first_name, ' ', entered_by_user.last_name
                ) AS enteredByFullName,
                CONCAT(
                    owner_user.first_name, ' ', owner_user.last_name
                ) AS ownerFullName,
                owner_user.email AS owner_email
            FROM
                suppliercontact
            LEFT JOIN supplier
                ON suppliercontact.supplier_id = supplier.supplier_id
            LEFT JOIN user AS entered_by_user
                ON suppliercontact.entered_by = entered_by_user.user_id
            LEFT JOIN user AS owner_user
                ON suppliercontact.owner = owner_user.user_id
            LEFT JOIN supplier_department
                ON suppliercontact.supplier_department_id = supplier_department.supplier_department_id
            LEFT JOIN suppliercontact as reportsToContact
                ON suppliercontact.reports_to  = reportsToContact.suppliercontact_id
            WHERE
                suppliercontact.suppliercontact_id = %s
            AND
                suppliercontact.site_id = %s
            AND
                supplier.site_id = %s",
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID,
            $this->_siteID
        );

        return $this->_db->getAssoc($sql);
    }

    /**
     * Returns all suppliercontact information relevent to the Edit Contact page for
     * a given suppliercontact ID.
     *
     * @param integer suppliercontact ID
     * @return array suppliercontact dats
     */
    public function getForEditing($suppliercontactID)
    {
        $sql = sprintf(
            "SELECT
                suppliercontact.suppliercontact_id AS suppliercontactID,
                suppliercontact.supplier_id AS supplierID,
                suppliercontact.owner AS owner,
                suppliercontact.last_name AS lastName,
                suppliercontact.first_name AS firstName,
                suppliercontact.title AS title,
                suppliercontact.email1 AS email1,
                suppliercontact.email2 AS email2,
                suppliercontact.phone_work AS phoneWork,
                suppliercontact.phone_cell AS phoneCell,
                suppliercontact.phone_other AS phoneOther,
                suppliercontact.address AS address,
                suppliercontact.city AS city,
                suppliercontact.state AS state,
                suppliercontact.zip AS zip,
                suppliercontact.notes AS notes,
                suppliercontact.is_hot AS isHotContact,
                suppliercontact.left_supplier AS leftSupplier,
                suppliercontact.supplier_department_id AS departmentID,
                suppliercontact.reports_to AS reportsTo,
                supplier.name AS supplierName,
                supplier_department.name AS department
            FROM
                suppliercontact
            LEFT JOIN supplier
                ON suppliercontact.supplier_id = supplier.supplier_id
            LEFT JOIN supplier_department
                ON suppliercontact.supplier_department_id = supplier_department.supplier_department_id
            WHERE
                suppliercontact.suppliercontact_id = %s
            AND
                suppliercontact.site_id = %s",
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID,
            $this->_siteID
        );

        return $this->_db->getAssoc($sql);
    }

    /**
     * Returns the entire supplierscontacts list.
     *
     * @return array supplierscontacts data
     */
    public function getAll($userID = -1, $supplierID = -1)
    {
        if ($userID >= 0)
        {
            $userCriterion = sprintf(
                'AND suppliercontact.owner = %s', $userID, $userID
            );
        }
        else
        {
            $userCriterion = '';
        }

        if ($supplierID >= 0)
        {
            $supplierCriterion = sprintf(
                'AND supplier.supplier_id = %s', $supplierID
            );
        }
        else
        {
            $supplierCriterion = '';
        }

        $sql = sprintf(
            "SELECT
                suppliercontact.suppliercontact_id AS suppliercontactID,
                suppliercontact.supplier_id AS supplierID,
                suppliercontact.last_name AS lastName,
                suppliercontact.first_name AS firstName,
                suppliercontact.title AS title,
                suppliercontact.phone_work AS phoneWork,
                suppliercontact.phone_cell AS phoneCell,
                suppliercontact.phone_other AS phoneOther,
                suppliercontact.email1 AS email1,
                suppliercontact.email2 AS email2,
                suppliercontact.is_hot AS isHot,
                suppliercontact.left_supplier AS leftSupplier,
                supplier_department.name AS department,
                DATE_FORMAT(
                    suppliercontact.date_created, '%%m-%%d-%%y'
                ) AS dateCreated,
                DATE_FORMAT(
                    suppliercontact.date_modified, '%%m-%%d-%%y (%%h:%%i %%p)'
                ) AS dateModified,
                owner_user.first_name AS ownerFirstName,
                owner_user.last_name AS ownerLastName,
                supplier.name AS supplierName
            FROM
                suppliercontact
            LEFT JOIN supplier
                ON suppliercontact.supplier_id = supplier.supplier_id
            LEFT JOIN user AS owner_user
                ON suppliercontact.owner = owner_user.user_id
            LEFT JOIN supplier_department
                ON suppliercontact.supplier_department_id = supplier_department.supplier_department_id
            WHERE
                suppliercontact.site_id = %s
            %s
            %s
            ORDER BY
                suppliercontact.last_name ASC,
                suppliercontact.first_name ASC",
            $this->_siteID,
            $userCriterion,
            $supplierCriterion
        );

        return $this->_db->getAllAssoc($sql);
    }
/**
     * Returns the entire supplierscontacts list.
     *
     * @return array supplierscontacts data
     */
    public function getAllContacts($supplierID = -1)
    {
        

        if ($supplierID >= 0)
        {
            $supplierCriterion = sprintf(
                'AND suppliercontact.supplier_id = %s', $supplierID
            );
        }
        else
        {
            $supplierCriterion = '';
        }

        $sql = sprintf(
            "SELECT
                suppliercontact.suppliercontact_id AS suppliercontactID,
                suppliercontact.supplier_id AS supplierID,
                suppliercontact.last_name AS lastName,
                suppliercontact.first_name AS firstName              
            
               
            FROM
                suppliercontact
           
            
            WHERE
                suppliercontact.site_id = %s
           
            %s
            ORDER BY
                suppliercontact.last_name ASC,
                suppliercontact.first_name ASC",
            $this->_siteID,
            
            $supplierCriterion
        );
//echo $sql;
        return $this->_db->getAllAssoc($sql);
    }
    /**
     * Returns all upcoming calendar events for given suppliercontact.
     * see Calendar::getUpcomingEvents.
     *
     * @return array calendar events
     */
    public function getUpcomingEvents($suppliercontactID)
    {
        $calendar = new Calendar($this->_siteID);
        return $calendar->getUpcomingEventsByDataItem(
            DATA_ITEM_CONTACT, $suppliercontactID
        );
    }

    /**
     * Updates a suppliercontact's modified timestamp.
     *
     * @param integer suppliercontact ID
     * @return boolean True if successful; false otherwise.
     */
    public function updateModified($suppliercontactID)
    {
        $sql = sprintf(
            "UPDATE
                suppliercontact
            SET
                date_modified = NOW()
            WHERE
                suppliercontact_id = %s
            AND
                site_id = %s",
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID
        );

        return (boolean) $this->_db->query($sql);
    }

    /**
     * Returns an array of job orders data (jobOrderID, title, supplierName)
     * for the specified suppliercontact ID.
     *
     * @param integer suppliercontact ID
     * @return array job orders data
     */
    public function getJobOrdersArray($suppliercontactID)
    {
        $sql = sprintf(
            "SELECT
                joborder.joborder_id AS jobOrderID,
                joborder.title AS title,
                supplier.name AS supplierName,
                IF(joborder.suppliercontact_id = %s, 1, 0) AS isAssigned
            FROM
                joborder
            LEFT JOIN supplier
                ON joborder.supplier_id = supplier.supplier_id
            LEFT JOIN suppliercontact
                ON supplier.supplier_id = suppliercontact.supplier_id
            WHERE
                suppliercontact.suppliercontact_id = %s
            AND
                joborder.site_id = %s
            ORDER BY
                isAssigned DESC,
                title ASC",
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_db->makeQueryInteger($suppliercontactID),
            $this->_siteID
        );

        return $this->_db->getAllAssoc($sql);
     }

    /**
     * Returns the entire supplierscontacts list.
     *
     * @return array supplierscontacts data
     */
    public function getColdCallList($userID = -1, $supplierID = -1)
    {
        if ($userID >= 0)
        {
            $userCriterion = sprintf(
                "AND suppliercontact.owner = %s", $userID, $userID
            );
        }
        else
        {
            $userCriterion = '';
        }

        if ($supplierID >= 0)
        {
            $supplierCriterion = sprintf(
                "AND suppliers.supplier_id = %s", $supplierID
            );
        }
        else
        {
            $supplierCriterion = '';
        }

        $sql = sprintf(
            "SELECT
                suppliercontact.suppliercontact_id AS suppliercontactID,
                suppliercontact.supplier_id AS supplierID,
                suppliercontact.last_name AS lastName,
                suppliercontact.first_name AS firstName,
                suppliercontact.title AS title,
                suppliercontact.phone_work AS phoneWork,
                supplier.name AS supplierName
            FROM
                suppliercontact
            LEFT JOIN supplier
                ON suppliercontact.supplier_id = supplier.supplier_id
            WHERE
                suppliercontact.phone_work != ''
            AND
                suppliercontact.phone_work IS NOT NULL
            AND
                suppliercontact.site_id = %s
            AND
                supplier.site_id = %s
            %s
            %s
            ORDER BY
                supplier.name ASC,
                suppliercontact.first_name ASC,
                suppliercontact.last_name ASC",
            $this->_siteID,
            $this->_siteID,
            $userCriterion,
            $supplierCriterion
        );

        return $this->_db->getAllAssoc($sql);
    }


    /**
     * Returns department ID for the given supplier by department name.
     * FIXME:  Shouldn't this be in companies?
     * FIXME:  Why are we passing a database handle in?
     *
     * @param string department name
     * @param integer supplier ID
     * @param handle database handle
     * @return integer department ID
     */
    public function getDepartmentIDByName($departmentName, $supplierID, $db)
    {
        /* (none) always has an ID of 0. */
        if ($departmentName === '(none)')
        {
            return 0;
        }

        $sql = sprintf(
            "SELECT
                supplier_department_id AS departmentID
             FROM
                supplier_department
             WHERE
                name = %s
             AND
                supplier_id = %s
             AND
                site_id = %s",
             $this->_db->makeQueryString($departmentName),
             $supplierID,
             $this->_siteID
        );
        $rs = $db->getAssoc($sql);

        if (empty($rs))
        {
            return 0;
        }

        return $rs['departmentID'];
    }
}


class SuppliersContactsDataGrid extends DataGrid
{
    protected $_siteID;


    // FIXME: Fix ugly indenting - ~400 character lines = bad.
    public function __construct($instanceName, $siteID, $parameters, $misc = 0)
    {
        $this->_db = DatabaseConnection::getInstance();
        $this->_siteID = $siteID;
        $this->_assignedCriterion = "";
        $this->_dataItemIDColumn = 'suppliercontact.suppliercontact_id';

        $this->_classColumns = array(
            'First Name' =>     array('select'         => 'suppliercontact.first_name AS firstName',
                                      'pagerRender'    => 'if ($rsData[\'isHot\'] == 1) $className =  \'jobLinkHot\'; else $className = \'jobLinkCold\'; return \'<a href="'.CATSUtility::getIndexName().'?m=supplierscontacts&amp;a=show&amp;suppliercontactID=\'.$rsData[\'suppliercontactID\'].\'" class="\'.$className.\'">\'.htmlspecialchars($rsData[\'firstName\']).\'</a>\';',
                                      'sortableColumn' => 'firstName',
                                      'pagerWidth'     => 75,
                                      'pagerOptional'  => false,
                                      'alphaNavigation'=> true,
                                      'filter'         => 'suppliercontact.first_name'),

            'Last Name' =>      array('select'         => 'suppliercontact.last_name AS lastName',
                                     'sortableColumn'  => 'lastName',
                                     'pagerRender'     => 'if ($rsData[\'isHot\'] == 1) $className =  \'jobLinkHot\'; else $className = \'jobLinkCold\'; return \'<a href="'.CATSUtility::getIndexName().'?m=supplierscontacts&amp;a=show&amp;suppliercontactID=\'.$rsData[\'suppliercontactID\'].\'" class="\'.$className.\'">\'.htmlspecialchars($rsData[\'lastName\']).\'</a>\';',
                                     'pagerWidth'      => 85,
                                     'pagerOptional'   => false,
                                     'alphaNavigation' => true,
                                     'filter'         => 'suppliercontact.last_name'),

            'Supplier' =>     array('select'         => 'supplier.name AS name,'.
                                                       'supplier.supplier_id as supplierID',
                                      'pagerRender'    => 'if ($rsData[\'isHot\'] == 1) $className =  \'jobLinkHot\'; else $className = \'jobLinkCold\'; return \'<a href="'.CATSUtility::getIndexName().'?m=companies&amp;a=show&amp;supplierID=\'.$rsData[\'supplierID\'].\'" class="\'.$className.\'">\'.htmlspecialchars($rsData[\'name\']).\'</a>\';',
                                      'sortableColumn' => 'name',
                                      'pagerWidth'     => 60,
                                      'pagerOptional'  => true,
                                      'alphaNavigation'=> true,
                                      'filter'         => 'supplier.name'),

            'Title' =>        array('select'  => 'suppliercontact.title AS title',
                                     'sortableColumn'    => 'title',
                                     'pagerWidth'   => 140,
                                     'alphaNavigation' => true,
                                     'pagerOptional'  => true,
                                     'filter'         => 'suppliercontact.title'),

            'Department' =>  array('select'  => 'supplier_department.supplier_department_id AS supplierDepartmentID, supplier_department.name as department',
                                     'join'     => 'LEFT JOIN supplier_department on supplier_department.supplier_department_id = suppliercontact.supplier_department_id',
                                     'sortableColumn'    => 'department',
                                     'pagerWidth'   => 120,
                                     'alphaNavigation' => true,
                                     'pagerOptional'  => true,
                                     'filter'         => 'supplier_department.department'),

            'Work Phone' =>   array('select'  => 'suppliercontact.phone_work AS workPhone',
                                     'sortableColumn'    => 'workPhone',
                                     'pagerWidth'   => 140,
                                     'alphaNavigation' => false,
                                     'pagerOptional'  => true,
                                     'filter'         => 'suppliercontact.work_phone'),

            'Cell Phone' =>    array('select'  => 'suppliercontact.phone_cell AS cellPhone',
                                     'sortableColumn'    => 'cellPhone',
                                     'pagerWidth'   => 140,
                                     'alphaNavigation' => false,
                                     'pagerOptional'  => true,
                                     'filter'         => 'suppliercontact.phone_cell'),

            'Other Phone' =>   array('select'  => 'suppliercontact.phone_other AS otherPhone',
                                     'sortableColumn'    => 'otherPhone',
                                     'pagerWidth'   => 140,
                                     'alphaNavigation' => false,
                                     'pagerOptional'  => true,
                                     'filter'         => 'suppliercontact.phone_other'),

            'E-Mail' =>         array('select'   => 'suppliercontact.email1 AS email1',
                                     'sortableColumn'     => 'email1',
                                     'pagerWidth'    => 80,
                                     'filter'         => 'suppliercontact.email1'),

            '2nd E-Mail' =>     array('select'   => 'suppliercontact.email2 AS email2',
                                     'sortableColumn'     => 'email2',
                                     'pagerWidth'    => 80,
                                     'filter'         => 'suppliercontact.email2'),

            'Address' =>        array('select'   => 'suppliercontact.address AS address',
                                     'sortableColumn'     => 'address',
                                     'pagerWidth'    => 250,
                                     'alphaNavigation' => true,
                                     'filter'         => 'suppliercontact.address'),

            'City' =>           array('select'   => 'suppliercontact.city AS city',
                                     'sortableColumn'     => 'city',
                                     'pagerWidth'    => 80,
                                     'alphaNavigation' => true,
                                     'filter'         => 'suppliercontact.city'),


            'State' =>          array('select'   => 'suppliercontact.state AS state',
                                     'sortableColumn'     => 'state',
                                     'filterType' => 'dropDown',
                                     'pagerWidth'    => 50,
                                     'alphaNavigation' => true,
                                     'filter'         => 'suppliercontact.state'),

            'Zip' =>            array('select'  => 'suppliercontact.zip AS zip',
                                     'sortableColumn'    => 'zip',
                                     'pagerWidth'   => 50,
                                     'filter'         => 'suppliercontact.zip'),

            'Misc Notes' =>     array('select'  => 'suppliercontact.notes AS notes',
                                     'sortableColumn'    => 'notes',
                                     'pagerWidth'   => 300,
                                     'filter'         => 'suppliercontact.notes'),

            'Owner' =>         array('pagerRender'      => 'return StringUtility::makeInitialName($rsData[\'ownerFirstName\'], $rsData[\'ownerLastName\'], false, LAST_NAME_MAXLEN);',
                                     'exportRender'     => 'return $rsData[\'ownerFirstName\'] . " " .$rsData[\'ownerLastName\'];',
                                     'sortableColumn'     => 'ownerSort',
                                     'pagerWidth'    => 75,
                                     'alphaNavigation' => true,
                                     'pagerOptional'  => true,
                                     'filter'         => 'CONCAT(owner_user.first_name, owner_user.last_name)'),

            'Created' =>       array('select'   => 'DATE_FORMAT(suppliercontact.date_created, \'%m-%d-%y\') AS dateCreated',
                                     'pagerRender'      => 'return $rsData[\'dateCreated\'];',
                                     'sortableColumn'     => 'dateCreatedSort',
                                     'pagerWidth'    => 60,
                                     'filterHaving' => 'DATE_FORMAT(suppliercontact.date_created, \'%m-%d-%y\')'),

            'Modified' =>      array('select'   => 'DATE_FORMAT(suppliercontact.date_modified, \'%m-%d-%y\') AS dateModified',
                                     'pagerRender'      => 'return $rsData[\'dateModified\'];',
                                     'sortableColumn'     => 'dateModifiedSort',
                                     'pagerWidth'    => 60,
                                     'pagerOptional' => false,
                                     'filterHaving' => 'DATE_FORMAT(suppliercontact.date_modified, \'%m-%d-%y\')'),

            'OwnerID' =>       array('select'    => '',
                                     'filter'    => 'suppliercontact.owner',
                                     'pagerOptional' => false,
                                     'filterable' => false,
                                     'filterDescription' => 'Only My SuppliersContacts'),

            'IsHot' =>         array('select'    => '',
                                     'filter'    => 'suppliercontact.is_hot',
                                     'pagerOptional' => false,
                                     'filterable' => false,
                                     'filterDescription' => 'Only Hot SuppliersContacts')

        );

        if (US_ZIPS_ENABLED)
        {
            $this->_classColumns['Near Zipcode'] =
                               array('select'  => 'suppliercontact.zip AS zip',
                                     'filter' => 'suppliercontact.zip',
                                     'pagerOptional' => false,
                                     'filterTypes'   => '=@');
        }

        /* Extra fields get added as columns here. */
        $supplierscontacts = new SuppliersContacts($this->_siteID);
        $extraFieldsRS = $supplierscontacts->extraFields->getSettings();
        foreach ($extraFieldsRS as $index => $data)
        {
            $fieldName = $data['fieldName'];

            if (!isset($this->_classColumns[$fieldName]))
            {
                $columnDefinition = $supplierscontacts->extraFields->getDataGridDefinition($index, $data, $this->_db);

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
     * @return array clients data
     */
    public function getSQL($selectSQL, $joinSQL, $whereSQL, $havingSQL, $orderSQL, $limitSQL, $distinct = '')
    {
        if ($this->getMiscArgument() != 0)
        {
            $savedListID = (int) $this->getMiscArgument();
            $joinSQL  .= ' INNER JOIN saved_list_entry
                                    ON saved_list_entry.data_item_type = '.DATA_ITEM_CONTACT.'
                                    AND saved_list_entry.data_item_id = suppliercontact.suppliercontact_id
                                    AND saved_list_entry.site_id = '.$this->_siteID.'
                                    AND saved_list_entry.saved_list_id = '.$savedListID;
        }
        else
        {
            $joinSQL  .= ' LEFT JOIN saved_list_entry
                                    ON saved_list_entry.data_item_type = '.DATA_ITEM_CONTACT.'
                                    AND saved_list_entry.data_item_id = suppliercontact.suppliercontact_id
                                    AND saved_list_entry.site_id = '.$this->_siteID;
        }

        $sql = sprintf(
            "SELECT SQL_CALC_FOUND_ROWS %s
                suppliercontact.is_hot AS isHot,
                suppliercontact.suppliercontact_id AS suppliercontactID,
                suppliercontact.suppliercontact_id AS exportID,
                suppliercontact.date_modified AS dateModifiedSort,
                suppliercontact.date_created AS dateCreatedSort,
                owner_user.first_name AS ownerFirstName,
                owner_user.last_name AS ownerLastName,
                CONCAT(owner_user.last_name, owner_user.first_name) AS ownerSort,
            %s
            FROM
                suppliercontact
            LEFT JOIN supplier
                ON suppliercontact.supplier_id = supplier.supplier_id
            LEFT JOIN user AS owner_user
                ON suppliercontact.owner = owner_user.user_id
            %s
            WHERE
                suppliercontact.site_id = %s
            %s
            %s
            GROUP BY suppliercontact.suppliercontact_id
            %s
            %s
            %s",
            $distinct,
            $selectSQL,
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