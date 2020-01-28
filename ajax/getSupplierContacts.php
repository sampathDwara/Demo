<?php
/*
 * CATS
 * AJAX Supplier Contacts Interface
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
 * $Id: getSupplierContacts.php 1892 2007-02-20 06:44:04Z will $
 */

include_once('./lib/Suppliers.php');


$interface = new SecureAJAXInterface();

if (!$interface->isRequiredIDValid('supplierID', false))
{
    $interface->outputXMLErrorPage(-1, 'Invalid supplier ID.');
    die();
}

$siteID = $interface->getSiteID();

$supplierID = $_REQUEST['supplierID'];

/* Get an array of the supplier's supplierscontacts data. */
$suppliers = new Suppliers($siteID);
$supplierscontactsArray = $suppliers->getSupplierContactsArray($supplierID);

if (empty($supplierscontactsArray))
{
    $interface->outputXMLErrorPage(-2, 'No supplierscontacts data.');
    die();
}

$output =
    "<data>\n" .
    "    <errorcode>0</errorcode>\n" .
    "    <errormessage></errormessage>\n";

foreach ($supplierscontactsArray as $rowIndex => $row)
{
    $output .=
        "    <contact>\n" .
        "        <id>"        . $supplierscontactsArray[$rowIndex]['contactID'] . "</id>\n" .
        "        <firstname>" . $supplierscontactsArray[$rowIndex]['firstName'] . "</firstname>\n" .
        "        <lastname>"  . $supplierscontactsArray[$rowIndex]['lastName']  . "</lastname>\n" .
        "    </contact>\n";
}

$output .=
    "</data>\n";

/* Send back the XML data. */
$interface->outputXMLPage($output);

?>
