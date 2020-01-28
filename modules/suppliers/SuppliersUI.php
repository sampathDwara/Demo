<?php
/*
 * CATS
 * Suppliers Module
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
 * $Id: SuppliersUI.php 3460 2007-11-07 03:50:34Z brian $
 */

include_once('./lib/StringUtility.php');
include_once('./lib/DateUtility.php'); /* Depends on StringUtility. */
include_once('./lib/ResultSetUtility.php');
include_once('./lib/Suppliers.php');
include_once('./lib/SuppliersContacts.php');
include_once('./lib/JobOrders.php');
include_once('./lib/Attachments.php');
include_once('./lib/Export.php');
include_once('./lib/ListEditor.php');
include_once('./lib/FileUtility.php');
include_once('./lib/ExtraFields.php');
include_once('./lib/CommonErrors.php');

class SuppliersUI extends UserInterface
{
    /* Maximum number of characters of the job notes to show without the user
     * clicking "[More]"
     */
    const NOTES_MAXLEN = 500;


    public function __construct()
    {
        parent::__construct();

        $this->_authenticationRequired = true;
        $this->_moduleDirectory = 'suppliers';
        $this->_moduleName = 'suppliers';
        $this->_moduleTabText = 'Suppliers';
        $this->_subTabs = array(
            'Add Supplier'     => CATSUtility::getIndexName() . '?m=suppliers&amp;a=add*al='.ACCESS_LEVEL_EDIT.'*hrmode=0',
            'Search Suppliers' => CATSUtility::getIndexName() . '?m=suppliers&amp;a=search*hrmode=0',
            'Go To My Supplier' => CATSUtility::getIndexName() . '?m=suppliers&amp;a=internalPostings*hrmode=0'
        );
    }


    public function handleRequest()
    {
        $action = $this->getAction();

        if (!eval(Hooks::get('CLIENTS_HANDLE_REQUEST'))) return;

        switch ($action)
        {
            case 'show':
                $this->show();
                break;

            case 'internalPostings':
                $this->internalPostings();
                break;

            case 'add':
                if ($this->isPostBack())
                {
                    $this->onAdd();
                }
                else
                {
                    $this->add();
                }

                break;

            case 'edit':
                if ($this->isPostBack())
                {
                    $this->onEdit();
                }
                else
                {
                    $this->edit();
                }

                break;

            case 'delete':
                $this->onDelete();
                break;

            case 'search':
                include_once('./lib/Search.php');

                if ($this->isGetBack())
                {
                    $this->onSearch();
                }
                else
                {
                    $this->search();
                }

                break;

            /* Add an attachment */
            case 'createAttachment':
                include_once('./lib/DocumentToText.php');

                if ($this->isPostBack())
                {
                    $this->onCreateAttachment();
                }
                else
                {
                    $this->createAttachment();
                }

                break;

            /* Delete an attachment */
            case 'deleteAttachment':
                $this->onDeleteAttachment();
                break;

            /* Main suppliers page. */
            case 'listByView':
            default:
                $this->listByView();
                break;
        }
    }


    /*
     * Called by handleRequest() to process loading the list / main page.
     */
    private function listByView($errMessage = '')
    {
        /* First, if we are operating in HR mode we will never see the
           suppliers pager.  Immediantly forward to My Supplier. */

        if ($_SESSION['CATS']->isHrMode())
        {
            $this->internalPostings();
            die();
        }

        $dataGridProperties = DataGrid::getRecentParamaters("suppliers:SuppliersListByViewDataGrid");

        /* If this is the first time we visited the datagrid this session, the recent paramaters will
         * be empty.  Fill in some default values. */
        if ($dataGridProperties == array())
        {
            $dataGridProperties = array('rangeStart'    => 0,
                                        'maxResults'    => 15,
                                        'filterVisible' => false);
        }

        $dataGrid = DataGrid::get("suppliers:SuppliersListByViewDataGrid", $dataGridProperties);

        $this->_template->assign('active', $this);
        $this->_template->assign('dataGrid', $dataGrid);
        $this->_template->assign('userID', $_SESSION['CATS']->getUserID());
        $this->_template->assign('errMessage', $errMessage);

        if (!eval(Hooks::get('CLIENTS_LIST_BY_VIEW'))) return;

        $this->_template->display('./modules/suppliers/Suppliers.tpl');
    }

    /*
     * Called by handleRequest() to process loading the details page.
     */
    private function show()
    {
        /* Bail out if we don't have a valid supplier ID. */
        if (!$this->isRequiredIDValid('supplierID', $_GET))
        {
            $this->listByView('Invalid supplier ID.');
            return;
        }

        $supplierID = $_GET['supplierID'];

        $suppliers = new Suppliers($this->_siteID);
        $data = $suppliers->get($supplierID);

        /* Bail out if we got an empty result set. */
        if (empty($data))
        {
            $this->listByView('The specified supplier ID could not be found.');
            return;
        }

        /* We want to handle formatting the city and state here instead
         * of in the template.
         */
        $data['cityAndState'] = StringUtility::makeCityStateString(
            $data['city'], $data['state']
        );

        /*
         * Replace newlines with <br />, fix HTML "special" characters, and
         * strip leading empty lines and spaces.
         */
        $data['notes'] = trim(
            nl2br(htmlspecialchars($data['notes'], ENT_QUOTES))
        );

        /* Chop $data['notes'] to make $data['shortNotes']. */
        if (strlen($data['notes']) > self::NOTES_MAXLEN)
        {
            $data['shortNotes']  = substr(
                $data['notes'], 0, self::NOTES_MAXLEN
            );
            $isShortNotes = true;
        }
        else
        {
            $data['shortNotes'] = $data['notes'];
            $isShortNotes = false;
        }

        /* Hot suppliers [can] have different title styles than normal suppliers. */
        if ($data['isHot'] == 1)
        {
            $data['titleClass'] = 'jobTitleHot';
        }
        else
        {
            $data['titleClass'] = 'jobTitleCold';
        }

        /* Link to Google Maps for this address */
        if (!empty($data['address']) && !empty($data['city']) && !empty($data['state']))
        {
            $data['googleMaps'] = '<a href="http://maps.google.com/maps?q=' .
                     urlencode($data['address']) . '+' .
                     urlencode($data['city'])     . '+' .
                     urlencode($data['state']);

            /* Google Maps will find an address without Zip. */
            if (!empty($data['zip']))
            {
                $data['googleMaps'] .= '+' . $data['zip'];
            }

            $data['googleMaps'] .= '" target=_blank><img src="images/google_maps.gif" style="border: none;" class="absmiddle" /></a>';
        }
        else
        {
            $data['googleMaps'] = '';
        }

        /* Attachments */
        $attachments = new Attachments($this->_siteID);
        $attachmentsRS = $attachments->getAll(
            DATA_ITEM_COMPANY, $supplierID
        );

        foreach ($attachmentsRS as $rowNumber => $attachmentsData)
        {
            /* Show an attachment icon based on the document's file type. */
            $attachmentIcon = strtolower(
                FileUtility::getAttachmentIcon(
                    $attachmentsRS[$rowNumber]['originalFilename']
                )
            );

            $attachmentsRS[$rowNumber]['attachmentIcon'] = $attachmentIcon;
        }

        /* Job Orders for this supplier */
        $jobOrders   = new JobOrders($this->_siteID);
        $jobOrdersRS = $jobOrders->getAll(
            JOBORDERS_STATUS_ALL, -1, $supplierID, -1
        );

        if (!empty($jobOrdersRS))
        {
            foreach ($jobOrdersRS as $rowIndex => $row)
            {
                /* Convert '00-00-00' dates to empty strings. */
                $jobOrdersRS[$rowIndex]['startDate'] = DateUtility::fixZeroDate(
                    $jobOrdersRS[$rowIndex]['startDate']
                );

                /* Hot jobs [can] have different title styles than normal
                 * jobs.
                 */
                if ($jobOrdersRS[$rowIndex]['isHot'] == 1)
                {
                    $jobOrdersRS[$rowIndex]['linkClass'] = 'jobLinkHot';
                }
                else
                {
                    $jobOrdersRS[$rowIndex]['linkClass'] = 'jobLinkCold';
                }

                $jobOrdersRS[$rowIndex]['recruiterAbbrName'] = StringUtility::makeInitialName(
                    $jobOrdersRS[$rowIndex]['recruiterFirstName'],
                    $jobOrdersRS[$rowIndex]['recruiterLastName'],
                    false,
                    LAST_NAME_MAXLEN
                );

                $jobOrdersRS[$rowIndex]['ownerAbbrName'] = StringUtility::makeInitialName(
                    $jobOrdersRS[$rowIndex]['ownerFirstName'],
                    $jobOrdersRS[$rowIndex]['ownerLastName'],
                    false,
                    LAST_NAME_MAXLEN
                );
            }
        }

        /* SuppliersContacts for this supplier */
        $supplierscontacts   = new SuppliersContacts($this->_siteID);
        $supplierscontactsRS = $supplierscontacts->getAll(-1, $supplierID);
        $supplierscontactsRSWC = null;

        if (!empty($supplierscontactsRS))
        {
            foreach ($supplierscontactsRS as $rowIndex => $row)
            {

                /* Hot supplierscontacts [can] have different title styles than normal supplierscontacts. */
                if ($supplierscontactsRS[$rowIndex]['isHot'] == 1)
                {
                    $supplierscontactsRS[$rowIndex]['linkClass'] = 'jobLinkHot';
                }
                else
                {
                    $supplierscontactsRS[$rowIndex]['linkClass'] = 'jobLinkCold';
                }

                if (!empty($supplierscontactsRS[$rowIndex]['ownerFirstName']))
                {
                    $supplierscontactsRS[$rowIndex]['ownerAbbrName'] = StringUtility::makeInitialName(
                        $supplierscontactsRS[$rowIndex]['ownerFirstName'],
                        $supplierscontactsRS[$rowIndex]['ownerLastName'],
                        false,
                        LAST_NAME_MAXLEN
                    );
                }
                else
                {
                    $supplierscontactsRS[$rowIndex]['ownerAbbrName'] = 'None';
                }

                if ($supplierscontactsRS[$rowIndex]['leftSupplier'] == 0)
                {
                    $supplierscontactsRSWC[] = $supplierscontactsRS[$rowIndex];
                }
                else
                {
                    $supplierscontactsRS[$rowIndex]['linkClass'] = 'jobLinkDead';
                }
            }
        }

        /* Add an MRU entry. */
        $_SESSION['CATS']->getMRU()->addEntry(
            DATA_ITEM_COMPANY, $supplierID, $data['name']
        );

        /* Get extra fields. */
        $extraFieldRS = $suppliers->extraFields->getValuesForShow($supplierID);

        /* Get departments. */
        $departmentsRS = $suppliers->getDepartments($supplierID);

        /* Is the user an admin - can user see history? */
        if ($this->_accessLevel < ACCESS_LEVEL_DEMO)
        {
            $privledgedUser = false;
        }
        else
        {
            $privledgedUser = true;
        }

        $this->_template->assign('active', $this);
        $this->_template->assign('data', $data);
        $this->_template->assign('attachmentsRS', $attachmentsRS);
        $this->_template->assign('departmentsRS', $departmentsRS);
        $this->_template->assign('extraFieldRS', $extraFieldRS);
        $this->_template->assign('isShortNotes', $isShortNotes);
        $this->_template->assign('jobOrdersRS', $jobOrdersRS);
        $this->_template->assign('supplierscontactsRS', $supplierscontactsRS);
        $this->_template->assign('supplierscontactsRSWC', $supplierscontactsRSWC);
        $this->_template->assign('privledgedUser', $privledgedUser);
        $this->_template->assign('supplierID', $supplierID);

        if (!eval(Hooks::get('CLIENTS_SHOW'))) return;

        $this->_template->display('./modules/suppliers/Show.tpl');
    }

    /*
     * Called by handleRequest() to process loading the internal postings supplier.
     */
    private function internalPostings()
    {
        $suppliers = new Suppliers($this->_siteID);
        $supplierID = $suppliers->getDefaultSupplier();

        CATSUtility::transferRelativeURI(
            'm=suppliers&a=show&supplierID=' . $supplierID
        );
    }

    /*
     * Called by handleRequest() to process loading the add page.
     */
    private function add()
    {
        if ($this->_accessLevel < ACCESS_LEVEL_EDIT)
        {
            $this->listByView('Invalid user level for action.');
            return;
        }

        $suppliers = new Suppliers($this->_siteID);

        /* Get extra fields. */
        $extraFieldRS = $suppliers->extraFields->getValuesForAdd();

        if (!eval(Hooks::get('CLIENTS_ADD'))) return;

        $this->_template->assign('extraFieldRS', $extraFieldRS);
        $this->_template->assign('active', $this);
        $this->_template->assign('subActive', 'Add Supplier');
        $this->_template->display('./modules/suppliers/Add.tpl');
    }

    /*
     * Called by handleRequest() to process saving / submitting the add page.
     */
    private function onAdd()
    {
        if ($this->_accessLevel < ACCESS_LEVEL_EDIT)
        {
            $this->listByView('Invalid user level for action.');
            return;
        }

        $formattedPhone1 = StringUtility::extractPhoneNumber(
            $this->getTrimmedInput('phone1', $_POST)
        );
        if (!empty($formattedPhone1))
        {
            $phone1 = $formattedPhone1;
        }
        else
        {
            $phone1 = $this->getTrimmedInput('phone1', $_POST);
        }

        $formattedPhone2 = StringUtility::extractPhoneNumber(
            $this->getTrimmedInput('phone2', $_POST)
        );
        if (!empty($formattedPhone2))
        {
            $phone2 = $formattedPhone2;
        }
        else
        {
            $phone2 = $this->getTrimmedInput('phone2', $_POST);
        }

        $formattedFaxNumber = StringUtility::extractPhoneNumber(
            $this->getTrimmedInput('faxNumber', $_POST)
        );
        if (!empty($formattedFaxNumber))
        {
            $faxNumber = $formattedFaxNumber;
        }
        else
        {
            $faxNumber = $this->getTrimmedInput('faxNumber', $_POST);
        }

        $url = $this->getTrimmedInput('url', $_POST);
        if (!empty($url))
        {
            $formattedURL = StringUtility::extractURL($url);

            if (!empty($formattedURL))
            {
                $url = $formattedURL;
            }
        }

        /* Hot supplier? */
        $isHot = $this->isChecked('isHot', $_POST);

        $name            = $this->getTrimmedInput('name', $_POST);
        $address         = $this->getTrimmedInput('address', $_POST);
        $city            = $this->getTrimmedInput('city', $_POST);
        $state           = $this->getTrimmedInput('state', $_POST);
        $zip             = $this->getTrimmedInput('zip', $_POST);
        $keyTechnologies = $this->getTrimmedInput('keyTechnologies', $_POST);
        $notes           = $this->getTrimmedInput('notes', $_POST);

        /* Departments list editor. */
        $departmentsCSV = $this->getTrimmedInput('departmentsCSV', $_POST);

        /* Bail out if any of the required fields are empty. */
        if (empty($name))
        {
            $this->listByView('Required fields are missing.');
            return;
        }

        if (!eval(Hooks::get('CLIENTS_ON_ADD_PRE'))) return;

        $suppliers = new Suppliers($this->_siteID);
        $supplierID = $suppliers->add(
            $name, $address, $city, $state, $zip, $phone1,
            $phone2, $faxNumber, $url, $keyTechnologies, $isHot,
            $notes, $this->_userID, $this->_userID
        );

        if ($supplierID <= 0)
        {
            CommonErrors::fatal(COMMONERROR_RECORDERROR, $this, 'Failed to add supplier.');
        }

        if (!eval(Hooks::get('CLIENTS_ON_ADD_POST'))) return;

        /* Update extra fields. */
        $suppliers->extraFields->setValuesOnEdit($supplierID);

        /* Add departments */
        $departments = array();
        $departmentsDifferences = ListEditor::getDifferencesFromList(
            $departments, 'name', 'departmentID', $departmentsCSV
        );

        $suppliers->updateDepartments($supplierID, $departmentsDifferences);

        CATSUtility::transferRelativeURI(
            'm=suppliers&a=show&supplierID=' . $supplierID
        );
    }

    /*
     * Called by handleRequest() to process loading the edit page.
     */
    private function edit()
    {
        if ($this->_accessLevel < ACCESS_LEVEL_EDIT)
        {
            $this->listByView('Invalid user level for action.');
            return;
        }
        
        /* Bail out if we don't have a valid supplier ID. */
        if (!$this->isRequiredIDValid('supplierID', $_GET))
        {
            $this->listByView('Invalid supplier ID.');
            return;
        }

        $supplierID = $_GET['supplierID'];

        $suppliers = new Suppliers($this->_siteID);
        $data = $suppliers->getForEditing($supplierID);
        
        /* Bail out if we got an empty result set. */
        if (empty($data))
        {
            $this->listByView('The specified supplier ID could not be found.');
            return;
        }
       
        /* Get the supplier's supplierscontacts data. */
        $supplierscontactsRS = $suppliers->getSuppliersContactsArray($supplierID);        //$supplierscontactsRS = '';
        
        $users = new Users($this->_siteID);
        $usersRS = $users->getSelectList();

        /* Add an MRU entry. */
        $_SESSION['CATS']->getMRU()->addEntry(
            DATA_ITEM_COMPANY, $supplierID, $data['name']
        );

        /* Get extra fields. */
        $extraFieldRS = $suppliers->extraFields->getValuesForEdit($supplierID);

        /* Get departments. */
        $departmentsRS = $suppliers->getDepartments($supplierID);
        $departmentsString = ListEditor::getStringFromList($departmentsRS, 'name');

        $emailTemplates = new EmailTemplates($this->_siteID);
        $statusChangeTemplateRS = $emailTemplates->getByTag(
            'EMAIL_TEMPLATE_OWNERSHIPASSIGNCLIENT'
        );

        if (!isset($statusChangeTemplateRS['disabled']) || $statusChangeTemplateRS['disabled'] == 1)
        {
            $emailTemplateDisabled = true;
        }
        else
        {
            $emailTemplateDisabled = false;
        }

        if ($this->_accessLevel == ACCESS_LEVEL_DEMO)
        {
            $canEmail = false;
        }
        else
        {
            $canEmail = true;
        }

        if (!eval(Hooks::get('CLIENTS_EDIT'))) return;

        $this->_template->assign('canEmail', $canEmail);
        $this->_template->assign('active', $this);
        $this->_template->assign('data', $data);
        $this->_template->assign('usersRS', $usersRS);
        $this->_template->assign('extraFieldRS', $extraFieldRS);
        $this->_template->assign('supplierscontactsRS', $supplierscontactsRS);
        $this->_template->assign('departmentsRS', $departmentsRS);
        $this->_template->assign('departmentsString', $departmentsString);
        $this->_template->assign('emailTemplateDisabled', $emailTemplateDisabled);
        $this->_template->assign('supplierID', $supplierID);
        $this->_template->display('./modules/suppliers/Edit.tpl');                
    }

    /*
     * Called by handleRequest() to process saving / submitting the edit page.
     */
    private function onEdit()
    {        
        if ($this->_accessLevel < ACCESS_LEVEL_EDIT)
        {
            $this->listByView('Invalid user level for action.');
            return;
        }

        $suppliers = new Suppliers($this->_siteID);
         
        /* Bail out if we don't have a valid supplier ID. */
        if (!$this->isRequiredIDValid('supplierID', $_POST))
        {
            $this->listByView('Invalid supplier ID.');
            return;
        }

        /* Bail out if we don't have a valid owner user ID. */
        if (!$this->isOptionalIDValid('owner', $_POST))
        {
            $this->listByView('Invalid owner user ID.');
            return;
        }

        /* Bail out if we don't have a valid billing contact ID. */
        if (!$this->isOptionalIDValid('billingContact', $_POST))
        {
            $this->listByView('Invalid billing contact ID.');
            return;
        }

        $formattedPhone1 = StringUtility::extractPhoneNumber(
            $this->getTrimmedInput('phone1', $_POST)
        );
        if (!empty($formattedPhone1))
        {
            $phone1 = $formattedPhone1;
        }
        else
        {
            $phone1 = $this->getTrimmedInput('phone1', $_POST);
        }

        $formattedPhone2 = StringUtility::extractPhoneNumber(
            $this->getTrimmedInput('phone2', $_POST)
        );
        if (!empty($formattedPhone2))
        {
            $phone2 = $formattedPhone2;
        }
        else
        {
            $phone2 = $this->getTrimmedInput('phone2', $_POST);
        }

        $formattedFaxNumber = StringUtility::extractPhoneNumber(
            $this->getTrimmedInput('faxNumber', $_POST)
        );
        if (!empty($formattedFaxNumber))
        {
            $faxNumber = $formattedFaxNumber;
        }
        else
        {
            $faxNumber = $this->getTrimmedInput('faxNumber', $_POST);
        }

        $url = $this->getTrimmedInput('url', $_POST);
        if (!empty($url))
        {
            $formattedURL = StringUtility::extractURL($url);

            if (!empty($formattedURL))
            {
                $url = $formattedURL;
            }
        }

        /* Hot supplier? */
        $isHot = $this->isChecked('isHot', $_POST);

        $supplierID       = $_POST['supplierID'];
        $owner           = $_POST['owner'];
        $billingContact  = $_POST['billingContact'];

        /* Change ownership email? */
        if ($this->isChecked('ownershipChange', $_POST) && $owner > 0)
        {
            $supplierDetails = $suppliers->get($supplierID);

            $users = new Users($this->_siteID);
            $ownerDetails = $users->get($_POST['owner']);

            if (!empty($ownerDetails))
            {
                $emailAddress = $ownerDetails['email'];

                /* Get the change status email template. */
                $emailTemplates = new EmailTemplates($this->_siteID);
                $statusChangeTemplateRS = $emailTemplates->getByTag(
                    'EMAIL_TEMPLATE_OWNERSHIPASSIGNCLIENT'
                );

                if (empty($statusChangeTemplateRS) ||
                    empty($statusChangeTemplateRS['textReplaced']))
                {
                    $statusChangeTemplate = '';
                }
                else
                {
                    $statusChangeTemplate = $statusChangeTemplateRS['textReplaced'];
                }
                /* Replace e-mail template variables. */
                $stringsToFind = array(
                    '%CLNTOWNER%',
                    '%CLNTNAME%',
                    '%CLNTCATSURL%'
                );
                $replacementStrings = array(
                    $ownerDetails['fullName'],
                    $supplierDetails['name'],
                    '<a href="http://' . $_SERVER['HTTP_HOST'] . substr($_SERVER['REQUEST_URI'], 0, strpos($_SERVER['REQUEST_URI'], '?')) . '?m=suppliers&amp;a=show&amp;supplierID=' . $supplierID . '">'.
                        'http://' . $_SERVER['HTTP_HOST'] . substr($_SERVER['REQUEST_URI'], 0, strpos($_SERVER['REQUEST_URI'], '?')) . '?m=suppliers&amp;a=show&amp;supplierID=' . $supplierID . '</a>'
                );
                $statusChangeTemplate = str_replace(
                    $stringsToFind,
                    $replacementStrings,
                    $statusChangeTemplate
                );

                $email = $statusChangeTemplate;
            }
            else
            {
                $email = '';
                $emailAddress = '';
            }
        }
        else
        {
            $email = '';
            $emailAddress = '';
        }

        $name            = $this->getTrimmedInput('name', $_POST);
        $address         = $this->getTrimmedInput('address', $_POST);
        $city            = $this->getTrimmedInput('city', $_POST);
        $state           = $this->getTrimmedInput('state', $_POST);
        $zip             = $this->getTrimmedInput('zip', $_POST);
        $keyTechnologies = $this->getTrimmedInput('keyTechnologies', $_POST);
        $notes           = $this->getTrimmedInput('notes', $_POST);

        /* Departments list editor. */
        $departmentsCSV = $this->getTrimmedInput('departmentsCSV', $_POST);

        /* Bail out if any of the required fields are empty. */
        if (empty($name))
        {
            $this->listByView('Required fields are missing.');
            return;
        }

       if (!eval(Hooks::get('CLIENTS_ON_EDIT_PRE'))) return;

        $departments = $suppliers->getDepartments($supplierID);
        $departmentsDifferences = ListEditor::getDifferencesFromList(
            $departments, 'name', 'departmentID', $departmentsCSV
        );
        $suppliers->updateDepartments($supplierID, $departmentsDifferences);
        
        if (!$suppliers->update($supplierID, $name, $address, $city, $state,
            $zip, $phone1, $phone2, $faxNumber, $url, $keyTechnologies,
            $isHot, $notes, $owner, $billingContact, $email, $emailAddress))
        {
            CommonErrors::fatal(COMMONERROR_RECORDERROR, $this, 'Failed to update supplier.');
        }

       if (!eval(Hooks::get('CLIENTS_ON_EDIT_POST'))) return;

        /* Update extra fields. */
        $suppliers->extraFields->setValuesOnEdit($supplierID);

        /* Update supplierscontacts? */
        if (isset($_POST['updateSuppliersContacts']))
        {
            if ($_POST['updateSuppliersContacts'] == 'yes')
            {
                $supplierscontacts = new SuppliersContacts($this->_siteID);
                $supplierscontacts->updateBySupplier($supplierID, $address, $city, $state, $zip);
            }
        }


       CATSUtility::transferRelativeURI(
            'm=suppliers&a=show&supplierID=' . $supplierID
        );
    }

    /*
     * Called by handleRequest() to process deleting a supplier.
     */
    private function onDelete()
    {
        if ($this->_accessLevel < ACCESS_LEVEL_DELETE)
        {
            $this->listByView('Invalid user level for action.');
            return;
        }

        /* Bail out if we don't have a valid supplier ID. */
        if (!$this->isRequiredIDValid('supplierID', $_GET))
        {
            $this->listByView('Invalid supplier ID.');
            return;
        }

        $supplierID = $_GET['supplierID'];

        $suppliers = new Suppliers($this->_siteID);
        $rs = $suppliers->get($supplierID);

        if (empty($rs))
        {
            $this->listByView('The specified supplier ID could not be found.');
            return;
        }

        if ($rs['defaultSupplier'] == 1)
        {
            $this->listByView('Cannot delete internal postings supplier.');
            return;
        }

       if (!eval(Hooks::get('CLIENTS_ON_DELETE_PRE'))) return;

        $suppliers->delete($supplierID);

        /* Delete the MRU entry if present. */
        $_SESSION['CATS']->getMRU()->removeEntry(
            DATA_ITEM_COMPANY, $supplierID
        );

       if (!eval(Hooks::get('CLIENTS_ON_DELETE_POST'))) return;

        CATSUtility::transferRelativeURI('m=suppliers&a=listByView');
    }

    /*
     * Called by handleRequest() to process loading the search page.
     */
    private function search()
    {
        $savedSearches = new SavedSearches($this->_siteID);
        $savedSearchRS = $savedSearches->get(DATA_ITEM_COMPANY);

        if (!eval(Hooks::get('CLIENTS_SEARCH'))) return;

        $this->_template->assign('wildCardString', '');
        $this->_template->assign('savedSearchRS', $savedSearchRS);
        $this->_template->assign('active', $this);
        $this->_template->assign('subActive', 'Search Suppliers');
        $this->_template->assign('isResultsMode', false);
        $this->_template->assign('wildCardSupplierName' , '');
        $this->_template->assign('wildCardKeyTechnologies', '');
        $this->_template->assign('mode', '');
        $this->_template->display('./modules/suppliers/Search.tpl');
    }

    /*
     * Called by handleRequest() to process displaying the search results.
     */
    private function onSearch()
    {
        $wildCardSupplierName = '';
        $wildCardKeyTechnologies = '';

        /* Bail out to prevent an error if the GET string doesn't even contain
         * a field named 'wildCardString' at all.
         */
        if (!isset($_GET['wildCardString']))
        {
            $this->listByView('No wild card string specified.');
            return;
        }

        $query = trim($_GET['wildCardString']);

        /* Set up sorting. */
        if ($this->isRequiredIDValid('page', $_GET))
        {
            $currentPage = $_GET['page'];
        }
        else
        {
            $currentPage = 1;
        }

        $searchPager = new SearchPager(
            CANDIDATES_PER_PAGE, $currentPage, $this->_siteID, $_GET
        );

        if ($searchPager->isSortByValid('sortBy', $_GET))
        {
            $sortBy = $_GET['sortBy'];
        }
        else
        {
            $sortBy = 'name';
        }

        if ($searchPager->isSortDirectionValid('sortDirection', $_GET))
        {
            $sortDirection = $_GET['sortDirection'];
        }
        else
        {
            $sortDirection = 'ASC';
        }

        $baseURL = CATSUtility::getFilteredGET(
            array('sortBy', 'sortDirection', 'page'), '&amp;'
        );
        $searchPager->setSortByParameters($baseURL, $sortBy, $sortDirection);

        if (!eval(Hooks::get('CLIENTS_ON_SEARCH_PRE'))) return;

        /* Get our current searching mode. */
        $mode = $this->getTrimmedInput('mode', $_GET);

        /* Execute the search. */
        $search = new SearchSuppliers($this->_siteID);
        switch ($mode)
        {
            case 'searchByName':
                $wildCardSupplierName = $query;
                $rs = $search->byName($query, $sortBy, $sortDirection);
                break;

            case 'searchByKeyTechnologies':
                $wildCardKeyTechnologies = $query;
                $rs = $search->byKeyTechnologies($query, $sortBy, $sortDirection);
                break;

            default:
                $this->listByView('Invalid search mode.');
                return;
                break;
        }

        foreach ($rs as $rowIndex => $row)
        {
            if ($row['isHot'] == 1)
            {
                $rs[$rowIndex]['linkClass'] = 'jobLinkHot';
            }
            else
            {
                $rs[$rowIndex]['linkClass'] = 'jobLinkCold';
            }

            if (!empty($row['ownerFirstName']))
            {
                $rs[$rowIndex]['ownerAbbrName'] = StringUtility::makeInitialName(
                    $row['ownerFirstName'],
                    $row['ownerLastName'],
                    false,
                    LAST_NAME_MAXLEN
                );
            }
            else
            {
                $rs[$rowIndex]['ownerAbbrName'] = 'None';
            }
        }

        $supplierIDs = implode(',', ResultSetUtility::getColumnValues($rs, 'supplierID'));
        $exportForm = ExportUtility::getForm(
            DATA_ITEM_COMPANY, $supplierIDs, 40, 15
        );

        /* Save the search. */
        $savedSearches = new SavedSearches($this->_siteID);
        $savedSearches->add(
            DATA_ITEM_COMPANY,
            $query,
            $_SERVER['REQUEST_URI'],
            false
        );
        $savedSearchRS = $savedSearches->get(DATA_ITEM_COMPANY);

        $query = urlencode(htmlspecialchars($query));

        if (!eval(Hooks::get('CLIENTS_ON_SEARCH_POST'))) return;

        $this->_template->assign('savedSearchRS', $savedSearchRS);
        $this->_template->assign('active', $this);
        $this->_template->assign('subActive', 'Search Suppliers');
        $this->_template->assign('exportForm', $exportForm);
        $this->_template->assign('pager', $searchPager);
        $this->_template->assign('rs', $rs);
        $this->_template->assign('isResultsMode', true);
        $this->_template->assign('wildCardSupplierName', $wildCardSupplierName);
        $this->_template->assign('wildCardString', $query);
        $this->_template->assign('wildCardKeyTechnologies', $wildCardKeyTechnologies);
        $this->_template->assign('mode', $mode);
        $this->_template->display('./modules/suppliers/Search.tpl');
    }

    /*
     * Called by handleRequest() to process loading the create attachment
     * modal dialog.
     */
    private function createAttachment()
    {
        if ($this->_accessLevel < ACCESS_LEVEL_EDIT)
        {
            $this->listByView('Invalid user level for action.');
            return;
        }

        /* Bail out if we don't have a valid joborder ID. */
        if (!$this->isRequiredIDValid('supplierID', $_GET))
        {
            CommonErrors::fatalModal(COMMONERROR_BADINDEX, $this, 'Invalid job order ID.');
        }

        $supplierID = $_GET['supplierID'];

        if (!eval(Hooks::get('CLIENTS_CREATE_ATTACHMENT'))) return;

        $this->_template->assign('isFinishedMode', false);
        $this->_template->assign('supplierID', $supplierID);
        $this->_template->display(
            './modules/suppliers/CreateAttachmentModal.tpl'
        );
    }

    /*
     * Called by handleRequest() to process creating an attachment.
     */
    private function onCreateAttachment()
    {
        if ($this->_accessLevel < ACCESS_LEVEL_EDIT)
        {
            $this->listByView('Invalid user level for action.');
            return;
        }

        /* Bail out if we don't have a valid joborder ID. */
        if (!$this->isRequiredIDValid('supplierID', $_POST))
        {
            CommonErrors::fatalModal(COMMONERROR_BADINDEX, $this, 'Invalid supplier ID.');
        }

        $supplierID = $_POST['supplierID'];

        if (!eval(Hooks::get('CLIENTS_ON_CREATE_ATTACHMENT_PRE'))) return;

        $attachmentCreator = new AttachmentCreator($this->_siteID);
        $attachmentCreator->createFromUpload(
            DATA_ITEM_COMPANY, $supplierID, 'file', false, false
        );

        if ($attachmentCreator->isError())
        {
            CommonErrors::fatalModal(COMMONERROR_FILEERROR, $this, $attachmentCreator->getError());
        }

        if (!eval(Hooks::get('CLIENTS_ON_CREATE_ATTACHMENT_POST'))) return;

        $this->_template->assign('isFinishedMode', true);
        $this->_template->assign('supplierID', $supplierID);
        $this->_template->display(
            './modules/suppliers/CreateAttachmentModal.tpl'
        );
    }

    /*
     * Called by handleRequest() to process deleting an attachment.
     */
    private function onDeleteAttachment()
    {
        if ($this->_accessLevel < ACCESS_LEVEL_DELETE)
        {
            $this->listByView('Invalid user level for action.');
            return;
        }

        /* Bail out if we don't have a valid attachment ID. */
        if (!$this->isRequiredIDValid('attachmentID', $_GET))
        {
            CommonErrors::fatalModal(COMMONERROR_BADINDEX, $this, 'Invalid attachment ID.');
        }

        /* Bail out if we don't have a valid joborder ID. */
        if (!$this->isRequiredIDValid('supplierID', $_GET))
        {
            CommonErrors::fatalModal(COMMONERROR_BADINDEX, $this, 'Invalid supplier ID.');
        }

        $supplierID  = $_GET['supplierID'];
        $attachmentID = $_GET['attachmentID'];

        if (!eval(Hooks::get('CLIENTS_ON_DELETE_ATTACHMENT_PRE'))) return;

        $attachments = new Attachments($this->_siteID);
        $attachments->delete($attachmentID);

        if (!eval(Hooks::get('CLIENTS_ON_DELETE_ATTACHMENT_POST'))) return;

        CATSUtility::transferRelativeURI(
            'm=suppliers&a=show&supplierID=' . $supplierID
        );
    }


    /**
     * Formats SQL result set for display. This is factored out for code
     * clarity.
     *
     * @param array result set from listByView()
     * @return array formatted result set
     */
    private function _formatListByViewResults($resultSet)
    {
        if (empty($resultSet))
        {
            return $resultSet;
        }

        foreach ($resultSet as $rowIndex => $row)
        {
            /* Hot suppliers [can] have different title styles than normal
             * suppliers.
             */
            if ($resultSet[$rowIndex]['isHot'] == 1)
            {
                $resultSet[$rowIndex]['linkClass'] = 'jobLinkHot';
            }
            else
            {
                $resultSet[$rowIndex]['linkClass'] = 'jobLinkCold';
            }

            if (!empty($resultSet[$rowIndex]['ownerFirstName']))
            {
                $resultSet[$rowIndex]['ownerAbbrName'] = StringUtility::makeInitialName(
                    $resultSet[$rowIndex]['ownerFirstName'],
                    $resultSet[$rowIndex]['ownerLastName'],
                    false,
                    LAST_NAME_MAXLEN
                );
            }
            else
            {
                $resultSet[$rowIndex]['ownerAbbrName'] = 'None';
            }

            if ($resultSet[$rowIndex]['attachmentPresent'] == 1)
            {
                $resultSet[$rowIndex]['iconTag'] = '<img src="images/paperclip.gif" alt="" width="16" height="16" />';
            }
            else
            {
                $resultSet[$rowIndex]['iconTag'] = '&nbsp;';
            }

            /* Display nothing instead of zero's for Job Order Count on Suppliers
             * display page.
             */
            if ($resultSet[$rowIndex]['jobOrdersCount'] == 0)
            {
                $resultSet[$rowIndex]['jobOrdersCount'] = '&nbsp;';
            }
        }

        return $resultSet;
    }
}

?>
