<?php

include_once('./lib/Companies.php');


$interface = new SecureAJAXInterface();

if (!$interface->isRequiredIDValid('companyID', false))
{
    $interface->outputXMLErrorPage(-1, 'Invalid company ID.');
    die();
}

$siteID = $interface->getSiteID();

$companyID = $_REQUEST['companyID'];

/* Get an array of the company's location data. */
$companies = new Companies($siteID);
$locationArray = $companies->CheckCompanyImpPartner($companyID);

if (empty($locationArray))
{
    $interface->outputXMLErrorPage(-2, 'No location data.');
    die();
}

/* Send back the XML data. */
$interface->outputXMLPage(
    "<data>\n" .
    "    <errorcode>0</errorcode>\n" .
    "    <errormessage></errormessage>\n" .
    "    <isImpPartner>" . $locationArray['isImpPartner'] . "</isImpPartner>\n" .
    "</data>\n"
);

?>
