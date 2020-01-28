/*
 * CATS
 * Supplier Contacts / Location JavaScript Library
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
 * $Id: supplier.js 2466 2007-05-16 16:58:04Z brian $
 */

/**
 * Populates a supplier's location information from a CATS AJAX function by
 * supplier ID.
 *
 * @return void
 */
function SupplierLocation_populate(supplierSelectID, sessionCookie)
{
    var supplierSelectList = document.getElementById(supplierSelectID);
    var supplierID         = supplierSelectList.value;

    if (supplierID == '' || !stringIsNumeric(supplierID))
    {
        document.getElementById('scity').value  = '';
        document.getElementById('sstate').value = '';
        return;
    }

    var http = AJAX_getXMLHttpObject();

    /* Build HTTP POST data. */
    var POSTData = '&supplierID=' + urlEncode(supplierID);

    /* Anonymous callback function triggered when HTTP response is received. */
    var callBack = function ()
    {
        if (http.readyState != 4)
        {
            return;
        }

        if (!http.responseXML)
        {
            var errorMessage = "An error occurred while receiving a response from the server.\n\n"
                             + http.responseText;
            alert(errorMessage);
            return;
        }

        //alert(http.responseText);

        /* Return if we have any errors. */
        var errorCodeNode    = http.responseXML.getElementsByTagName('errorcode').item(0);
        var errorMessageNode = http.responseXML.getElementsByTagName('errormessage').item(0);
        if (!errorCodeNode || !errorCodeNode.firstChild ||
            errorCodeNode.firstChild.nodeValue != '0')
        {
            if (errorCodeNode && errorCodeNode.firstChild &&
                errorCodeNode.firstChild.nodeValue != '-2' && errorMessageNode &&
                errorMessageNode.firstChild)
            {
                var errorMessage = "An error occurred while receiving a response from the server.\n\n"
                                 + errorMessageNode.firstChild.nodeValue;
                alert(errorMessage);
            }

            /* Make sure that the elements exist in the page.
             * FIXME: Explain; why would these fields ever not exist? -Will
             */
            if (document.getElementById('saddress'))
            {
                document.getElementById('saddress').value  = '';
            }

            document.getElementById('scity').value  = '';
            document.getElementById('sstate').value = '';

            if (document.getElementById('szip'))
            {
                document.getElementById('szip').value = '';
            }

            return;
        }

        var addressNode  = http.responseXML.getElementsByTagName('address').item(0);
        var cityNode      = http.responseXML.getElementsByTagName('city').item(0);
        var stateNode     = http.responseXML.getElementsByTagName('state').item(0);
        var zipNode       = http.responseXML.getElementsByTagName('zip').item(0);

        if (document.getElementById('saddress'))
        {
            if (addressNode.firstChild)
            {
                document.getElementById('saddress').value = addressNode.firstChild.nodeValue;
            }
            else
            {
                document.getElementById('saddress').value = '';
            }
        }

        if (cityNode.firstChild)
        {
            document.getElementById('scity').value = cityNode.firstChild.nodeValue;
        }
        else
        {
            document.getElementById('scity').value = '';
        }

        if (stateNode.firstChild)
        {
            document.getElementById('state').value = stateNode.firstChild.nodeValue;
        }
        else
        {
            document.getElementById('sstate').value = '';
        }

        if (document.getElementById('szip'))
        {
            if (zipNode.firstChild)
            {
                document.getElementById('szip').value = zipNode.firstChild.nodeValue;
            }
            else
            {
                document.getElementById('szip').value = '';
            }
        }
    }

    AJAX_callCATSFunction(
        http,
        'getSupplierLocation',
        POSTData,
        callBack,
        0,
        sessionCookie,
        false,
        false
    );
}

/**
 * Populates a supplier's contacts information from a CATS AJAX function by
 * supplier ID.
 *
 * @return void
 */
function SupplierContacts_populate(supplierSelectID, contactSelectID, indicatorID,
    sessionCookie)
{    
    var supplierSelectList = document.getElementById(supplierSelectID);
    var supplierID         = supplierSelectList.value;
    
    SupplierContacts_populate_bySupplierID(supplierID, contactSelectID, indicatorID,
    sessionCookie);
}

function SupplierContacts_populate_bySupplierID(supplierID, contactSelectID, indicatorID,
    sessionCookie)
{
    var contactSelectList = document.getElementById(contactSelectID);
    var contactIndicator  = document.getElementById(indicatorID);

    /* Create a 'None' option to add to the contact select list. */
    var noneOption = document.createElement('option');
    noneOption.value = '-1';
    noneOption.appendChild(document.createTextNode('None'));

    /* Clear the contact select list and add the 'None' option. */
    contactSelectList.options.length = 0;
    contactSelectList.appendChild(noneOption);

    if (supplierID == '' || supplierID == '-1' || !stringIsNumeric(supplierID))
    {
        return;
    }

    contactSelectList.disabled = true;
    contactIndicator.style.visibility = 'visible';

    var http = AJAX_getXMLHttpObject();

    /* Build HTTP POST data. */
    var POSTData = '&supplierID=' + urlEncode(supplierID);
    //alert(POSTData);
    /* Anonymous callback function triggered when HTTP response is received. */
    var callBack = function ()
    {
        if (http.readyState != 4)
        {
            return;
        }

        if (!http.responseXML)
        {
            var errorMessage = "An error occurred while receiving a response from the server.\n\n"
                             + http.responseText;
            alert(errorMessage);
            return;
        }

        //alert(http.responseText);

        /* Return if we have any errors. */
        var errorCodeNode    = http.responseXML.getElementsByTagName('errorcode').item(0);
        var errorMessageNode = http.responseXML.getElementsByTagName('errormessage').item(0);
        if (!errorCodeNode.firstChild || errorCodeNode.firstChild.nodeValue != '0')
        {
            if (errorCodeNode.firstChild.nodeValue != '-2')
            {
                var errorMessage = "An error occurred while receiving a response from the server.\n\n"
                                 + errorMessageNode.firstChild.nodeValue;
                alert(errorMessage);
            }

            contactSelectList.disabled = false;
            contactIndicator.style.visibility = 'hidden';

            return;
        }

        /* Loop through all of the <contact> nodes. */
        contactNodes = http.responseXML.getElementsByTagName('contact')
        for (var i = 0; i < contactNodes.length; i++)
        {
            var IDNode        = contactNodes[i].getElementsByTagName('id').item(0);
            var firstNameNode = contactNodes[i].getElementsByTagName('firstname').item(0);
            var lastNameNode  = contactNodes[i].getElementsByTagName('lastname').item(0);

            if (!IDNode.firstChild || !firstNameNode.firstChild ||
                !lastNameNode.firstChild)
            {
                continue;
            }

            var option = document.createElement('option');
            option.value = IDNode.firstChild.nodeValue;
            option.appendChild(
                document.createTextNode(
                    lastNameNode.firstChild.nodeValue + ', ' +
                    firstNameNode.firstChild.nodeValue
                )
            );
            contactSelectList.appendChild(option);
        }

        contactSelectList.disabled = false;
        contactIndicator.style.visibility = 'hidden';
    }

    AJAX_callCATSFunction(
        http,
        'getSupplierContacts',
        POSTData,
        callBack,
        0,
        sessionCookie,
        false,
        false
    );
}
