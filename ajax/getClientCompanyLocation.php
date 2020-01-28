<?php
include_once('./lib/Companies.php');include_once('./lib/Search.php');$interface = new SecureAJAXInterface();if (!$interface->isRequiredIDValid('companyID', false))
{    $interface->outputXMLErrorPage(-1, 'Invalid company ID.');    die();}
$siteID = $interface->getSiteID();$companyID = $_REQUEST['companyID'];
/* Get an array of the company's location data. */
$companies = new Companies($siteID);$locationArray = $companies->getCompanyWorkLocation($companyID);
if (empty($locationArray)){    $interface->outputXMLErrorPage(-2, 'No location data.');    die();
}

/* Send back the XML data. */$output ="<data>\n" ."    <errorcode>0</errorcode>\n" ."    <errormessage></errormessage>\n"."    <totalelements>" . count($locationArray) . "</totalelements>\n";foreach ($locationArray as $rowIndex => $row){        $output .=        "    <complocations>\n" .        "        <LocationID>". $locationArray[$rowIndex]['CompLocID']. "</LocationID>\n" .        "        <Address1>". $locationArray[$rowIndex]['CompanyAdd']. "</Address1>\n" .        "    </complocations>\n";    }$output .= "</data>\n";$interface->outputXMLPage($output);

?>
