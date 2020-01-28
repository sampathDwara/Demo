var currentCompanyID = -1;var currentClientCompanyID = -1; 

function watchCompanyIDChangeJO(sessionCookie)
{    if (currentCompanyID == -1)    {        currentCompanyID = document.getElementById('companyID').value * 1;    }
    if (currentCompanyID != document.getElementById('companyID').value * 1 && document.getElementById('companyID').value * 1 > 0 && document.getElementById('companyID').value != '')    {        updateCompanyData(sessionCookie);    }        setTimeout("watchCompanyIDChangeJO('"+sessionCookie+"');", 600);
}
function watchClientCompanyIDChangeJO(sessionCookie,listElementID){    if (currentClientCompanyID == -1)    {    	currentClientCompanyID = document.getElementById('custCompID').value * 1;    }    if (currentClientCompanyID != document.getElementById('custCompID').value * 1 && document.getElementById('custCompID').value * 1 > 0 && document.getElementById('custCompID').value != '')    {     	updateClientCompanyData(sessionCookie,listElementID);    }        setTimeout("watchClientCompanyIDChangeJO('"+sessionCookie+"','"+listElementID+"');", 600);}
function updateCompanyData(sessionCookie)
{
    currentCompanyID = document.getElementById('companyID').value * 1;
    //CompanyLocation_populate('companyID', sessionCookie);    	CompanyLocation_populate_Jo_Client('companyID','partnerLocationID', sessionCookie);
    CompanyContacts_populate('companyID', 'contactID', 'contactsIndicator', sessionCookie);        CompanySecondaryContacts_populate('companyID', 'contactID2', 'contactsIndicator', sessionCookie);
    CompanyDepartments_populateJO(currentCompanyID, sessionCookie);
}function updateCompanyData2(sessionCookie,WorkLocationID){		currentCompanyID = document.getElementById('companyID').value * 1;		if(currentCompanyID != 0)	{		CompanyLocation_populate_Jo_Client('companyID','partnerLocationID', sessionCookie);	    CompanyContacts_populate('companyID', 'contactID', 'contactsIndicator', sessionCookie);	    CompanySecondaryContacts_populate('companyID', 'contactID2', 'contactsIndicator', sessionCookie);	    Company_impartner_jo('companyID', sessionCookie);	    		//CompanyLocation_populate_Jo_Client('custCompID',WorkLocationID, sessionCookie);        //CompanyContacts_populate_Jo_Client('custCompID', 'clientContact1', 'contactsIndicator2', sessionCookie);        //CompanySecondaryContacts_populate_Jo_Client('custCompID', 'clientContact2', 'contactsIndicator2', sessionCookie);        //CompanyDepartments_populateJO(currentCompanyID, sessionCookie);	}	else	{	    /* Create a 'None' option to add to the contact select list. */		clientContact2 = document.getElementById('contactID2');		clientContact1 = document.getElementById('contactID');		WorkLocationID1 = document.getElementById('partnerLocationID');	    var noneOption = document.createElement('option');	    noneOption.value = '0';	    noneOption.appendChild(document.createTextNode('None'));	    var noneOption1 = document.createElement('option');	    noneOption1.value = '0';	    noneOption1.appendChild(document.createTextNode('None'));	    	    var noneOption2 = document.createElement('option');	    noneOption2.value = '0';	    noneOption2.appendChild(document.createTextNode('None'));	    	    	    /* Clear the list and add the 'None' option. */	    WorkLocationID1.options.length = 0;	    WorkLocationID1.appendChild(noneOption);	    clientContact1.options.length = 0;	    clientContact1.appendChild(noneOption1);	    	    clientContact2.options.length = 0;	    clientContact2.appendChild(noneOption2);	    		custCompID	   = document.getElementById('custCompID');		WorkLocationID = document.getElementById('WorkLocationID');		clientContact1 = document.getElementById('clientContact1');		clientContact2 = document.getElementById('clientContact2');		    custCompID.options[0].selected = 'selected';	    WorkLocationID.options[0].selected = 'selected';	    clientContact1.options[0].selected = 'selected';	    clientContact2.options[0].selected = 'selected';				custCompID.disabled		=	true;		WorkLocationID.disabled	=	true;		clientContact1.disabled	=	true;		clientContact2.disabled	=	true;	    	    	}}function updateClientCompanyData(sessionCookie,WorkLocationID){		currentCompanyID = document.getElementById('custCompID').value * 1;		if(currentCompanyID != 0)	{		CompanyLocation_populate_Jo_Client('custCompID',WorkLocationID, sessionCookie);        CompanyContacts_populate_Jo_Client('custCompID', 'clientContact1', 'contactsIndicator2', sessionCookie);        CompanySecondaryContacts_populate_Jo_Client('custCompID', 'clientContact2', 'contactsIndicator2', sessionCookie);        //CompanyDepartments_populateJO(currentCompanyID, sessionCookie);	}	else	{	    /* Create a 'None' option to add to the contact select list. */		clientContact2 = document.getElementById('clientContact2');		clientContact1 = document.getElementById('clientContact1');		WorkLocationID1 = document.getElementById('WorkLocationID');	    var noneOption = document.createElement('option');	    noneOption.value = '0';	    noneOption.appendChild(document.createTextNode('None'));	    var noneOption1 = document.createElement('option');	    noneOption1.value = '0';	    noneOption1.appendChild(document.createTextNode('None'));	    	    var noneOption2 = document.createElement('option');	    noneOption2.value = '0';	    noneOption2.appendChild(document.createTextNode('None'));	    	    	    /* Clear the list and add the 'None' option. */	    WorkLocationID1.options.length = 0;	    WorkLocationID1.appendChild(noneOption);	    clientContact1.options.length = 0;	    clientContact1.appendChild(noneOption1);	    	    clientContact2.options.length = 0;	    clientContact2.appendChild(noneOption2);	    	}}

function CompanyDepartments_populateJO(companyID, sessionCookie)
{

    if (companyID == '' || !stringIsNumeric(companyID))
    {
        return;
    }

    var http = AJAX_getXMLHttpObject();

    /* Build HTTP POST data. */
    var POSTData = '&companyID=' + urlEncode(companyID);

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

            return;
        }

        var departmentsNode = http.responseXML.getElementsByTagName('departments').item(0);

        if (departmentsNode.firstChild)
        {
            document.getElementById('departmentsCSV').value = departmentsNode.firstChild.nodeValue;
        }
        else
        {
            document.getElementById('departmentsCSV').value = '';
        }
        listEditorUpdateSelectFromCSV('departmentSelect', 'departmentsCSV', true, false);
        document.getElementById('departmentSelect').disabled = false;
    }

    AJAX_callCATSFunction(
        http,
        'getCompanyLocationAndDepartments',
        POSTData,
        callBack,
        0,
        sessionCookie,
        false,
        false
    );
}

function checkPublic(e)
{
    var styleSheet = document.getElementById('displayQuestionnaires').style;

    if (e.checked)
    {
        if (styleSheet.display)
        {
            styleSheet.display = 'table-row';
        }
    }
    else
    {
        if (styleSheet.display)
        {
            styleSheet.display = 'none';
        }
    }
}


var currentSupplierID = -1;

function watchSupplierIDChangeJO(sessionCookie)
{
    if (currentSupplierID == -1)
    {
        currentSupplierID = document.getElementById('supplierID').value * 1;
    }

    if (currentSupplierID != document.getElementById('supplierID').value * 1 && document.getElementById('supplierID').value * 1 > 0 && document.getElementById('supplierID').value != '')
    {
        updateSupplierData(sessionCookie);
    }
    setTimeout("watchSupplierIDChangeJO('"+sessionCookie+"');", 600);
}

function updateSupplierData(sessionCookie)
{
    currentSupplierID = document.getElementById('supplierID').value * 1;
    SupplierLocation_populate('supplierID', sessionCookie);
    SupplierContacts_populate('supplierID', 'contactID', 'contactsIndicator', sessionCookie);
    SupplierDepartments_populateJO(currentSupplierID, sessionCookie);
}

function SupplierDepartments_populateJO(supplierID, sessionCookie)
{

    if (supplierID == '' || !stringIsNumeric(supplierID))
    {
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

            return;
        }

        var departmentsNode = http.responseXML.getElementsByTagName('sdepartments').item(0);

        if (departmentsNode.firstChild)
        {
            document.getElementById('sdepartmentsCSV').value = departmentsNode.firstChild.nodeValue;
        }
        else
        {
            document.getElementById('sdepartmentsCSV').value = '';
        }
        listEditorUpdateSelectFromCSV('sdepartmentSelect', 'sdepartmentsCSV', true, false);
        document.getElementById('sdepartmentSelect').disabled = false;
    }

    AJAX_callCATSFunction(
        http,
        'getSupplierLocationAndDepartments',
        POSTData,
        callBack,
        0,
        sessionCookie,
        false,
        false
    );
}
