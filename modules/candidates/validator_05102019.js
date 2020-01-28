/*
 * CATS
 * Candidates Form Validation
 *
 * Copyright (C) 2005 - 2007 Cognizo Technologies, Inc.
 * All rights reserved.
 *
 * $Id: validator.js 2646 2007-07-09 16:40:31Z Andrew $
 */

function checkAddForm(form)
{
    var errorMessage = '';
    errorMessage += checkFirstName();
    errorMessage += checkLastName();
    errorMessage += checkEmail1();
    errorMessage += checkCPhone();
    errorMessage += checkstate();
    errorMessage += checkcity();
    errorMessage += checkdesiredPay();
    errorMessage += checkkeySkills();
    errorMessage += checkotherSkills();
    errorMessage += checkRelExperince();        errorMessage += checkTotalExperince();        errorMessage += checkTitle();
    if (errorMessage != '')
    {
        alert("Form Error:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkEditForm(form)
{
    var errorMessage = '';

    errorMessage += checkFirstName();
    errorMessage += checkLastName();
    errorMessage += checkEmail1();
    errorMessage += checkCPhone();
    errorMessage += checkstate();
    errorMessage += checkcity();
    errorMessage += checkdesiredPay();
    errorMessage += checkkeySkills();
    errorMessage += checkotherSkills();        errorMessage += checkRelExperince();        errorMessage += checkTotalExperince();        errorMessage += checkTitle();

    if (errorMessage != '')
    {
        alert("Form Error:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkCreateAttachmentForm(form)
{
    var errorMessage = '';

    errorMessage += checkAttachmentFile();

    if (errorMessage != '')
    {
        alert("Form Error:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkSearchByFullNameForm(form)
{
    var errorMessage = '';

    errorMessage += checkSearchFullName();

    if (errorMessage != '')
    {
        alert("Form Error:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkSearchPhoneNumberForm(form)
{
    var errorMessage = '';

    errorMessage += checkPhoneNumber();

    if (errorMessage != '')
    {
        alert("Form Error:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkSearchByKeySkillsForm(form)
{
    var errorMessage = '';

    errorMessage += checkSearchKeySkills();

    if (errorMessage != '')
    {
        alert("Form Error:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkSearchResumeForm(form)
{
    var errorMessage = '';

    errorMessage += checkSearchResume();

    if (errorMessage != '')
    {
        alert("Form Error:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkEmailForm(form)
{
    var errorMessage = '';

    errorMessage += checkEmailSubject();
    errorMessage += checkEmailBody();

    if (errorMessage != '')
    {
        alert("Form Error:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkFirstName()
{
    var errorMessage = '';

    fieldValue = document.getElementById('firstName').value;
    fieldLabel = document.getElementById('firstNameLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - You must enter First Name.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkkeySkills()
{
    var errorMessage = '';

    fieldValue = document.getElementById('keySkills').value;
    fieldLabel = document.getElementById('keySkillsLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - You must enter key Skills.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkotherSkills()
{
    var errorMessage = '';

    fieldValue = document.getElementById('otherSkills').value;
    fieldLabel = document.getElementById('otherSkillsLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - You must enter Other Skills.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkLastName()
{
    var errorMessage = '';

    fieldValue = document.getElementById('lastName').value;
    fieldLabel = document.getElementById('lastNameLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - You must enter Last Name.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkEmail1()
{
    var errorMessage = '';

    fieldValue = document.getElementById('email1').value;
    fieldLabel = document.getElementById('email1Label');

    if (fieldValue == '')
    {
        errorMessage = "    - You must enter Email.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkCPhone()
{
    var errorMessage = '';

    fieldValue = document.getElementById('phoneCell').value;
    fieldLabel = document.getElementById('phoneCellLabel');

    if (fieldValue == '')
    {
        errorMessage = "    - You must enter Cellphone Number.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkdesiredPay()
{
    var errorMessage = '';

    fieldValue = document.getElementById('desiredPay').value;
    fieldLabel = document.getElementById('desiredPayLabel');

    if (fieldValue == '')
    {
        errorMessage = "    - You must enter Desired Pay.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkstate()
{
    var errorMessage = '';

    fieldValue = document.getElementById('state').value;
    fieldLabel = document.getElementById('stateLabel');

    if (fieldValue == '')
    {
        errorMessage = "    - You must Select State.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkcity()
{
    var errorMessage = '';

    fieldValue = document.getElementById('city').value;
    fieldLabel = document.getElementById('cityLabel');

    if (fieldValue == '')
    {
        errorMessage = "    - You must enter City.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkSearchFullName()
{
    var errorMessage = '';

    fieldValue = document.getElementById('wildCardString_fullName').value;
    fieldLabel = document.getElementById('wildCardStringLabel_fullName');
    if (fieldValue == '')
    {
        errorMessage = "    - You must enter some search text.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkSearchKeySkills()
{
    var errorMessage = '';

    fieldValue = document.getElementById('wildCardString_keySkills').value;
    fieldLabel = document.getElementById('wildCardStringLabel_keySkills');
    if (fieldValue == '')
    {
        errorMessage = "    - You must enter some search text.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkSearchResume()
{
    var errorMessage = '';

    fieldValue = document.getElementById('wildCardString_resume').value;
    fieldLabel = document.getElementById('wildCardStringLabel_resume');
    if (fieldValue == '')
    {
        errorMessage = "    - You must enter some search text.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkAttachmentFile()
{
    var errorMessage = '';

    fieldValue = document.getElementById('file').value;
    fieldLabel = document.getElementById('file');
    if (fieldValue == '')
    {
        errorMessage = "    - You must enter a file to upload.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkPhoneNumber()
{
    var errorMessage = '';

    fieldValue = document.getElementById('wildCardString_phoneNumber').value;
    fieldLabel = document.getElementById('wildCardStringLabel_phoneNumber');

    if (fieldValue == '')
    {
        errorMessage = "    - You must enter numbers to search.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkEmailSubject()
{
    var errorMessage = '';

    fieldValue = document.getElementById('emailSubject').value;
    fieldLabel = document.getElementById('emailSubjectLabel');

    if (fieldValue == '')
    {
        errorMessage = "    - You must enter a subject for your e-mail.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkEmailBody()
{
    var errorMessage = '';

    fieldValue = document.getElementById('emailBody').value;
    fieldLabel = document.getElementById('emailBodyLabel');

    if (fieldValue == '')
    {
        errorMessage = "    - You must enter a body for your e-mail.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}
function checkTitle(){    var errorMessage = '';    fieldValue = document.getElementById('title').value;    fieldLabel = document.getElementById('titleLabel');    if (fieldValue == '')    {        errorMessage = "    - You must enter Title.\n";        fieldLabel.style.color = '#ff0000';    }    else    {        fieldLabel.style.color = '#000';    }    return errorMessage;}function checkTotalExperince(){    var errorMessage = '';    fieldValue = document.getElementById('totexp1').value;    fieldLabel = document.getElementById('totalExpLabel');    if (fieldValue == '')    {        errorMessage = "    - You must enter Total Experience.\n";        fieldLabel.style.color = '#ff0000';    }    else    {        fieldLabel.style.color = '#000';    }    return errorMessage;}function checkRelExperince(){    var errorMessage = '';    fieldValue = document.getElementById('relexp1').value;    fieldLabel = document.getElementById('relExpLabel');    if (fieldValue == '')    {        errorMessage = "    - You must enter Relevant Experience.\n";        fieldLabel.style.color = '#ff0000';    }    else    {        fieldLabel.style.color = '#000';    }    return errorMessage;}