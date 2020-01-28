<?php /* $Id: Add.tpl 3746 2007-11-28 20:28:21Z andrew $ */ ?>
<?php if ($this->isModal): ?>
    <?php TemplateUtility::printModalHeader('Candidates', array('modules/candidates/validator.js','js/countries.js','js/addressParser.js', 'js/listEditor.js',  'js/candidate.js', 'js/candidateParser.js'), 'Add New Candidate to This Job Order Pipeline'); ?>
<?php else: ?>
    <?php TemplateUtility::printHeader('Candidates', array('modules/candidates/validator.js','js/countries.js', 'js/addressParser.js', 'js/listEditor.js',  'js/candidate.js', 'js/candidateParser.js')); ?>
    <?php TemplateUtility::printHeaderBlock(); ?>
    <?php TemplateUtility::printTabs($this->active, $this->subActive); ?>

    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">

            <table>
                <tr>
                    <td width="3%">
                        <img src="images/candidate.gif" width="24" height="24" alt="Candidates" style="border: none; margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Candidates: Add Candidate</h2></td>
                </tr>
            </table>

<?php endif; ?>
<?php if ($this->isModal): ?>
                <?php $URI = CATSUtility::getIndexName() . '?m=joborders&amp;a=addCandidateModal&jobOrderID=' . $this->jobOrderID; ?>
            <?php else: ?>
                <?php $URI = CATSUtility::getIndexName() . '?m=candidates&amp;a=add'; ?>
            <?php endif; ?>

            <form name="addCandidateForm" id="addCandidateForm" enctype="multipart/form-data" action="<?php echo($URI); ?>" method="post" onsubmit="return (checkAddForm(document.addCandidateForm) && onSubmitEmailInSystem() && onSubmitPhoneInSystem());" autocomplete="off" enctype="multipart/form-data">
            <table>
                    <tbody><tr>
                        <td width="60%" height="100%" valign="top">
            <p class="note<?php if ($this->isModal): ?>Unsized<?php endif; ?>">Basic Information</p>

            <table style="font-weight:bold; border: 1px solid #000; background-color: #ffed1a; padding:5px; display:none; margin-bottom:7px;" width="100%" id="candidateAlreadyInSystemTable">
                <tr>
                    <td class="tdVertical">
                        This profile may already be in the system.&nbsp;&nbsp;Possible duplicate candidate profile:&nbsp;&nbsp;
                        <a href="javascript:void(0);" onclick="window.open('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=show&amp;candidateID='+candidateIsAlreadyInSystemID);">
                            <img src="images/new_window.gif" border="0" />
                            <img src="images/candidate_small.gif" border="0" />
                            <span id="candidateAlreadyInSystemName"></span>
                        </a>
                    </td>
                </tr>
            </table>

            
                <?php if ($this->isModal): ?>
                    <input type="hidden" name="jobOrderID" id="jobOrderID" value="<?php echo($this->jobOrderID); ?>" />
                <?php endif; ?>
                <input type="hidden" name="postback" id="postback" value="postback" />

                <table class="editTable">
                    <?php if ($this->isParsingEnabled): ?>
                    <tr>
                        <td class="tdVertical" colspan="2">
                            <img src="images/parser/manual.gif" border="0" />
                        </td>
                        <td class="tdVertical">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                    <td align="left"><img src="images/parser/import.gif" border="0" /></td>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <?php endif; ?>
                    <tr>
                        <td class="tdVertical">
                            <label id="firstNameLabel" for="firstName">First Name:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="1" name="firstName" id="firstName" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['firstName'])) $this->_($this->preassignedFields['firstName']); ?>" />&nbsp;*
                        </td>

                        <td rowspan="18" valign="top">                        <!-- Start: Table for Additional fields -->                        <table cellpadding="0" cellspacing="0" border="0">	                        <tr>		                        <td class="tdVertical">		                            <label id="visaLabel" for="visa">Visa Type:</label>		                        </td>		                        <td class="tdData">			                        <select tabindex="" id="visa" name="visa" class="inputbox" style="width: 100px;" >						                        <option value="0">(None)</option>						                        <?php foreach ($this->visaRS as $rowNumber => $visaData): ?>						                            <?php if ($visaData['visa_id'] == $this->preassignedFields['visa']): ?>						                                <option selected value="<?php $this->_($visaData['visa_id']) ?>"><?php $this->_($visaData['visa_type']) ?></option>						                            <?php else: ?>						                                <option value="<?php $this->_($visaData['visa_id']) ?>"><?php $this->_($visaData['visa_type']) ?></option>						                            <?php endif; ?>						                        <?php endforeach; ?>						                    </select>&nbsp;		                        </td>	                        </tr>	                        <tr>		                        <td class="tdVertical">				                            <label id="titleLabel" for="title">Title:</label>				                        </td>		                        <td class="tdData">				                            <input type="text" tabindex="" name="title" id="title" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['title'])) $this->_($this->preassignedFields['title']); ?>" />&nbsp;*				                        </td>	                        </tr>	                        <tr>		                        <td class="tdVertical">				                            <label id="totalExpLabel" for="totExp">Total Experience:</label>				                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="totexp1" id="totexp1" class="inputbox" style="width: 30px" value="<?php if(isset($this->preassignedFields['totexp1'])) $this->_($this->preassignedFields['totexp1']); ?>" />&nbsp;Years		                            <input type="text" tabindex="" name="totexp2" id="totexp2" class="inputbox" style="width: 30px" value="<?php if(isset($this->preassignedFields['totexp2'])) $this->_($this->preassignedFields['totexp2']); ?>" />&nbsp;Months*		                        </td>	                        </tr>	                        <tr>		                        <td class="tdVertical">				                            <label id="relExpLabel" for="totExp">Relevant Experience:</label>				                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="relexp1" id="relexp1" class="inputbox" style="width: 30px" value="<?php if(isset($this->preassignedFields['relexp1'])) $this->_($this->preassignedFields['relexp1']); ?>" />&nbsp;Years		                            <input type="text" tabindex="" name="relexp2" id="relexp2" class="inputbox" style="width: 30px" value="<?php if(isset($this->preassignedFields['relexp2'])) $this->_($this->preassignedFields['relexp2']); ?>" />&nbsp;Months*		                        </td>	                        </tr>		                    <tr>		                        <td class="tdVertical">				                           <label id="DomainLabel" for="Domain">Domain:</label>				                        </td>				                        <td class="tdData">				                        <select tabindex=""   id="domain" name="domain" class="inputbox" style="width: 150px; height: 70px" multiple="multiple" >				                        <option value="0">(None)</option>				                        <?php foreach ($this->domainRS as $rowNumber => $domainData): ?>				                            <?php if ($domainData['domain_id'] == $this->preassignedFields['domain']): ?>				                                <option selected value="<?php $this->_($domainData['domain_id']) ?>"><?php $this->_($domainData['domain_name']) ?></option>				                            <?php else: ?>				                                <option value="<?php $this->_($domainData['domain_id']) ?>"><?php $this->_($domainData['domain_name']) ?></option>				                            <?php endif; ?>				                        <?php endforeach; ?>				                    </select>&nbsp;				                        </td>		                    </tr>	                        		                    <tr>				                        <td class="tdVertical">				                           <label id="CategoryLabel" for="Category">Category:</label>				                        </td>				                        <td class="tdData">				                           <select tabindex=""   id="category" name="category" class="inputbox" style="width: 150px; height: 70px" multiple="multiple" >				                        <option value="0">(None)</option>				                        <?php foreach ($this->categoryRS as $rowNumber => $categoryData): ?>				                            <?php if ($categoryData['category_id'] == $this->preassignedFields['category']): ?>				                                <option selected value="<?php $this->_($categoryData['category_id']) ?>"><?php $this->_($categoryData['category']) ?></option>				                            <?php else: ?>				                                <option value="<?php $this->_($categoryData['category_id']) ?>"><?php $this->_($categoryData['category']) ?></option>				                            <?php endif; ?>				                        <?php endforeach; ?>				                    </select>&nbsp;				                        </td>				                    </tr>		                    <tr>				                        <td class="tdVertical">				                           <label id="rolesLabel" for="roles">Roles:</label>				                        </td>				                        <td class="tdData">				                           <select tabindex=""  id="roles" name="roles" class="inputbox" style="width: 150px; height: 70px" multiple="multiple" >				                        <option value="0">(None)</option>				                        <?php foreach ($this->rolesRS as $rowNumber => $rolesData): ?>				                            <?php if ($rolesData['role_id'] == $this->preassignedFields['roles']): ?>				                                <option selected value="<?php $this->_($rolesData['role_id']) ?>"><?php $this->_($rolesData['role_name']) ?></option>				                            <?php else: ?>				                                <option value="<?php $this->_($rolesData['role_id']) ?>"><?php $this->_($rolesData['role_name']) ?></option>				                            <?php endif; ?>				                        <?php endforeach; ?>				                    </select>&nbsp;				                        </td>				                    </tr>		                    <tr>				                        <td class="tdVertical">				                           <label id="educationLabel" for="roles">Education:</label>				                        </td>				                        <td class="tdData">				                            <input type="text" tabindex="" name="education" id="education" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['education'])) $this->_($this->preassignedFields['education']); ?>" />&nbsp;				                        </td>				                    </tr>		                    	                        <tr>		                        <td class="tdVertical">				                            <label id="collegeLabel" for="totExp">College/University:</label>				                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="college" id="college" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['college'])) $this->_($this->preassignedFields['college']); ?>" />&nbsp;		                        </td>	                        </tr>	                        <tr>		                        <td class="tdVertical">				                            <label id="GraduationLabel" for="graduation">Year of Graduation:</label>				                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="graduation" id="graduation" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['graduation'])) $this->_($this->preassignedFields['graduation']); ?>" />&nbsp;		                        </td>	                        </tr>	                        <tr>		                        <td class="tdVertical">				                            <label id="EmpTypeLabel" for="EmpType">Employment Type:</label>				                        </td>		                        <td class="tdData">		                           <select tabindex=""  id="emptype" name="emptype" class="inputbox" style="width: 150px; height: 70px" multiple="multiple">			                        <option value="0">(None)</option>			                        <?php foreach ($this->employmentRS as $rowNumber => $employmentData): ?>			                            <?php if ($employmentData['employment_type_id'] == $this->preassignedFields['emptype']): ?>			                                <option selected value="<?php $this->_($employmentData['employment_type_id']) ?>"><?php $this->_($employmentData['employment_type']) ?></option>			                            <?php else: ?>			                                <option value="<?php $this->_($employmentData['employment_type_id']) ?>"><?php $this->_($employmentData['employment_type']) ?></option>			                            <?php endif; ?>			                        <?php endforeach; ?>				                    </select>&nbsp;		                        		                        </td>	                        </tr>	                        	                        <tr>		                        <td class="tdVertical">				                            <label id="authorizationLabel" for="authorization">Work authorization:</label>				                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="authorization" id="authorization" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['authorization'])) $this->_($this->preassignedFields['authorization']); ?>" />&nbsp;		                        </td>	                        </tr>	                        		                    	                        <tr>		                        <td class="tdVertical">				                            <label id="courseoneLabel" for="courseone">Course 1:</label>				                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="courseone" id="courseone" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['courseone'])) $this->_($this->preassignedFields['courseone']); ?>" />&nbsp;		                        </td>	                        </tr>	                        <tr>		                        <td class="tdVertical">				                            <label id="coursetwoLabel" for="coursetwo">Course 2:</label>				                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="coursetwo" id="coursetwo" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['coursetwo'])) $this->_($this->preassignedFields['coursetwo']); ?>" />&nbsp;		                        </td>	                        </tr>	                        	                        <tr>		                        <td class="tdVertical">		                            <label id="coursethreeLabel" for="coursethree">Course 3:</label>		                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="coursethree" id="coursethree" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['coursetwo'])) $this->_($this->preassignedFields['coursetwo']); ?>" />&nbsp;		                        </td>	                        </tr>	                        <tr>		                        <td class="tdVertical">		                            <label id="suppliersLabel" for="suppliers">Supplier:</label>		                        </td>		                        <td class="tdData">		                            <select tabindex="<?php echo($tabIndex++); ?>" id="suppliers" name="suppliers" class="inputbox" style="width: 150px;">		                            <option value="">(Select a Supplier)</option>		                            <?php foreach ($this->suppliersRS as $rowNumber => $suppliersData): ?>				                                <?php if ($suppliersData['supplierID'] == $this->preassignedFields['suppliers']): ?>				                                    <option selected value="<?php $this->_($suppliersData['supplierID']) ?>"><?php $this->_($suppliersData['name']) ?></option>				                                <?php else: ?>				                                    <option value="<?php $this->_($suppliersData['supplierID']) ?>"><?php $this->_($suppliersData['name']) ?></option>				                                <?php endif; ?>				                            <?php endforeach; ?>		                        </select>		                            		                            		                        </td>	                        </tr>	                        <!-- <tr>		                        <td class="tdVertical">		                            <label id="supplierpersonLabel" for="suppliers">Suppliers Person:</label>		                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="supplierperson" id="supplierperson" class="inputbox" style="width: 150px" value="" />&nbsp;		                        </td>	                        </tr>-->	                        <!--<tr>		                        <td class="tdVertical">		                            <label id="commentsLabel" for="comments">Comments:</label>		                        </td>		                        <td class="tdData">		                            <input type="text" tabindex="" name="comments" id="comments" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['comments'])) $this->_($this->preassignedFields['comments']); ?>" />&nbsp;		                        </td>	                        </tr>-->	                        	                        	                        		                                            </table>                        <!-- End: Table for Additional fields -->
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="middleNameLabel" for="middleName">Middle Name:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="2" name="middleName" id="middleName" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['middleName'])) $this->_($this->preassignedFields['middleName']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="lastNameLabel" for="lastName">Last Name:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="2" name="lastName" id="lastName" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['lastName'])) $this->_($this->preassignedFields['lastName']); ?>" />&nbsp;*
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="email1Label" for="email1">E-Mail:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="3" name="email1" id="email1" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['email'])) $this->_($this->preassignedFields['email']); elseif (isset($this->preassignedFields['email1'])) $this->_($this->preassignedFields['email1']); ?>" onchange="checkEmailAlreadyInSystem(this.value);" />&nbsp;*
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="email2Label" for="email2">2nd E-Mail:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="4" name="email2" id="email2" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['email2'])) $this->_($this->preassignedFields['email2']); ?>" onchange="checkEmailAlreadyInSystem(this.value);" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="webSiteLabel" for="webSite">Web Site:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="5" name="webSite" id="webSite" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['webSite'])) $this->_($this->preassignedFields['webSite']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneHomeLabel" for="phoneHome">Home Phone:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="6" name="phoneHome" id="phoneHome" class="inputbox" style="width: 150px;" value="<?php if (isset($this->preassignedFields['phoneHome'])) $this->_($this->preassignedFields['phoneHome']); ?>" onchange="checkPhoneAlreadyInSystem(this.value);"  />
                            <?php if ($this->isParsingEnabled): ?>
                                <?php if ($this->parsingStatus['parseLimit'] >= 0 && $this->parsingStatus['parseUsed'] >= $this->parsingStatus['parseLimit']): ?>
                                    &nbsp;
                                <?php else: ?>
                                    <?php if ($this->isModal): ?>&nbsp;&nbsp;<?php else: ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php endif; ?>
                                    <img id="transfer" src="images/parser/transfer<?php echo ($this->contents != '' ? '' : '_grey'); ?>.gif" <?php echo ($this->contents != '' ? 'style="cursor: pointer;"' : ''); ?> border="0" alt="Import Resume" onclick="parseDocumentFileContents();" />
                                <?php endif; ?>
                            <?php else: ?>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="arrowButton" tabindex="91" align="middle" type="button" value="&lt;--" class="arrowbutton" onclick="AddressParser_parse('addressBlock', 'person', 'addressParserIndicator', 'arrowButton'); document.addCandidateForm.firstName.focus();" />
                            <?php endif; ?>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneCellLabel" for="phoneCell">Cell Phone:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="7" name="phoneCell" id="phoneCell" class="inputbox" style="width: 150px;" value="<?php if (isset($this->preassignedFields['phoneCell'])) $this->_($this->preassignedFields['phoneCell']); ?>" onchange="checkPhoneAlreadyInSystem(this.value);" />&nbsp;*
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneWorkLabel" for="phoneWork">Work Phone:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="8" name="phoneWork" id="phoneWork" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['phoneWork'])) $this->_($this->preassignedFields['phoneWork']); ?>" onchange="checkPhoneAlreadyInSystem(this.value);" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="addressLabel" for="address">Address:</label>
                        </td>
                        <td class="tdData">
                            <textarea tabindex="9" name="address" id="address" rows="2" cols="40" class="inputbox" style="width: 150px"><?php if(isset($this->preassignedFields['address'])) $this->_($this->preassignedFields['address']); if(isset($this->preassignedFields['address2'])) $this->_("\n" . $this->preassignedFields['address2']); ?></textarea>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/indicator2.gif" id="addressParserIndicator" alt="" style="visibility: hidden; margin-left: 10px;" height="16" width="16" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="CountryLabel" for="state">Country:</label>
                        </td>
                        <td class="tdData"><select  tabindex="11"  style="width: 150px"  onchange="print_state('state',this.selectedIndex);"
                         id="country" class="inputbox"  name ="country"></select>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="stateLabel" for="state">State:</label>
                        </td>
                        <td class="tdData"><select  tabindex="11" name ="state" id ="state"  class="inputbox" ></select>&nbsp;*
                            <!--input type="text" tabindex="12" name="state1" id="state1" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['state'])) $this->_($this->preassignedFields['state']); ?>" /-->
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="cityLabel" for="city">City:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="12" name="city" id="city" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['city'])) $this->_($this->preassignedFields['city']); ?>" />&nbsp;*
                        </td>
                    </tr>



                    <tr>
                        <td class="tdVertical">
                            <label id="zipLabel" for="zip">Zip Code:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="13" name="zip" id="zip" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['zip'])) $this->_($this->preassignedFields['zip']); ?>" />&nbsp;
                            <input type="button" tabindex="92" onclick="CityState_populate('zip', 'ajaxIndicator');" value="Lookup" />
                            <img src="images/indicator2.gif" alt="AJAX" id="ajaxIndicator" style="vertical-align: middle; visibility: hidden; margin-left: 5px;" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="stateLabel" for="state">Best Time to Call:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="13" name="bestTimeToCall" id="bestTimeToCall" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['bestTimeToCall'])) $this->_($this->preassignedFields['bestTimeToCall']); ?>" />
                        </td>
                    </tr>                    <tr>                        <td class="tdVertical">                            <label id="linkedinLabel" for="linkedin">LinkedIn:</label>                        </td>                        <td class="tdData">                            <input type="text" tabindex="" name="linkedin" id="linkedin" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['linkedin'])) $this->_($this->preassignedFields['linkedin']); ?>" />                        </td>                    </tr>
                    <tr>                        <td class="tdVertical">                            <label id="skypeidLabel" for="skypeid">SkypeId:</label>                        </td>                        <td class="tdData">                            <input type="text" tabindex="" name="skypeid" id="skypeid" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['skypeid'])) $this->_($this->preassignedFields['skypeid']); ?>" />                        </td>                    </tr>                    <tr>                        <td class="tdVertical">                            <label id="preflocationsLabel" for="preflocations">Preferred locations:</label>                        </td>                        <td class="tdData">                            <input type="text" tabindex="" name="preflocations" id="preflocations" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['preflocations'])) $this->_($this->preassignedFields['preflocations']); ?>" />                        </td>                    </tr>                    <tr>                        <td class="tdVertical">                           <label id="ref_recruiter" for="ref_recruiter">Referred Recruiter:</label>                        </td>                        <td class="tdData">                        <select tabindex="36" id="ref_recruiter" name="ref_recruiter" class="inputbox" style="width: 150px;">                        <option value="0">(Select a User)</option>                        <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>                            <?php if ($usersData['userID'] == $this->preassignedFields['ref_recruiter']): ?>                                                            <option selected value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>                            <?php else: ?>                                <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>                            <?php endif; ?>                        <?php endforeach; ?>                    </select>&nbsp;                        </td>                    </tr>                    
                    <?php $tabIndex = 15; ?>
                </table>

                <?php if (!$this->isParsingEnabled || $this->associatedAttachment != 0): ?>
                <p class="note<?php if ($this->isModal): ?>Unsized<?php endif; ?>" style="margin-top: 5px;">Resume</p>

                <table class="editTable">
                    <tr>
                        <td class="tdVertical">Resume:</td>
                        <td class="tdData" style="width:320px;">
                            <?php if ($this->associatedAttachment == 0): ?>
                                <nobr> <?php /* FIXME:  remove nobr stuff */ ?>
                                    <?php if (isset($this->overAttachmentQuota)): ?>
                                        <span style="font-size:10px;">(You have already reached your limit of <?php echo(FREE_ACCOUNT_SIZE/1024); ?> MB of attachments, and cannot add additional file attachments without upgrading to CATS Professional Hosted.)<br /></font>Copy and Paste Resume:&nbsp;
                                    <?php else: ?>
                                        <input type="file" id="file" name="file" size="21" tabindex="<?php echo($tabIndex++); ?>" <?php if($this->associatedTextResume !== false): ?>disabled<?php endif; ?> /> &nbsp;
                                    <?php endif; ?>
                                    <a href="javascript:void(0);" onclick="if (document.getElementById('textResumeTD').style.display != '') { document.getElementById('textResumeTD').style.display = ''; document.getElementById('file').disabled=true; } else { document.getElementById('textResumeTD').style.display='none'; document.getElementById('file').disabled = false; }">
                                        <img src="images/package_editors.gif" style="margin:0px; padding:0px;"  class="absmiddle" alt="" border="0" title="Copy / Paste Resume" />
                                    </a>
                                </nobr>
                             <?php else: ?>
                                <a href="<?php echo $this->associatedAttachmentRS['retrievalURL']; ?>">
                                    <img src="<?php $this->_($this->associatedAttachmentRS['attachmentIcon']) ?>" alt="" width="16" height="16" style="border: none;" />
                                </a>
                                <a href="<?php echo $this->associatedAttachmentRS['retrievalURL']; ?>">
                                    <?php $this->_($this->associatedAttachmentRS['originalFilename']) ?>
                                </a>
                                <?php echo($this->associatedAttachmentRS['previewLink']); ?>
                                <input type="hidden" name="associatedAttachment" value="<?php echo($this->associatedAttachment); ?>" />
                            <?php endif; ?>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left" valign="top">
                            <input type="hidden" name="textResumeFilename" value="<?php if(isset($this->preassignedFields['textResumeFilename'])) $this->_($this->preassignedFields['textResumeFilename']); else echo('resume.txt'); ?>" />
                            <div id="textResumeTD" <?php if($this->associatedTextResume === false): ?>style="display:none;"<?php endif; ?>>
                                <p class="freeformtop" style="width: 700px;">Cut and paste resume text here.</p>

                                &nbsp;<textarea class="inputbox" tabindex="90" name="textResumeBlock" id="textResumeBlock" rows="5" cols="60" style="width: 700px; height: 300px;"><?php if ($this->associatedTextResume !== false) $this->_($this->associatedTextResume); ?></textarea>

                                <p class="freeformtop" style="width: 700px;">Cut and paste resume text here.</p>
                            </div>
                        </td>
                    </tr>
                </table>
                <?php else: ?>
                <br />
                <?php endif; ?>

                <?php if($this->EEOSettingsRS['enabled'] == 1): ?>
                    <p class="note<?php if ($this->isModal): ?>Unsized<?php endif; ?>" style="margin-top: 5px;">EEO Information</p>
                    <table class="editTable">
                         <?php if ($this->EEOSettingsRS['genderTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Gender:</label>
                                </td>
                                <td class="tdData">
                                    <select id="gender" name="gender" class="inputbox" style="width:200px;" tabindex="<?php echo($tabIndex++); ?>">
                                        <option selected="selected" value="">----</option>
                                        <option value="M"<?php if (isset($this->preassignedFields['gender']) && $this->preassignedFields['gender'] == 'M') echo ' selected'; ?>>Male</option>
                                        <option value="F"<?php if (isset($this->preassignedFields['gender']) && $this->preassignedFields['gender'] == 'F') echo ' selected'; ?>>Female</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                         <?php if ($this->EEOSettingsRS['ethnicTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Ethnic Background:</label>
                                </td>
                                <td class="tdData">
                                    <select id="race" name="race" class="inputbox" style="width:200px;" tabindex="<?php echo($tabIndex++); ?>">
                                        <option selected="selected" value="">----</option>
                                        <option value="1"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '1') echo ' selected'; ?>>American Indian</option>
                                        <option value="2"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '2') echo ' selected'; ?>>Asian or Pacific Islander</option>
                                        <option value="3"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '3') echo ' selected'; ?>>Hispanic or Latino</option>
                                        <option value="4"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '4') echo ' selected'; ?>>Non-Hispanic Black</option>
                                        <option value="5"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '5') echo ' selected'; ?>>Non-Hispanic White</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                         <?php if ($this->EEOSettingsRS['veteranTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Veteran Status:</label>
                                </td>
                                <td class="tdData">
                                    <select id="veteran" name="veteran" class="inputbox" style="width:200px;" tabindex="<?php echo($tabIndex++); ?>">
                                        <option selected="selected" value="">----</option>
                                        <option value="1"<?php if (isset($this->preassignedFields['veteran']) && $this->preassignedFields['veteran'] == '1') echo ' selected'; ?>>No</option>
                                        <option value="2"<?php if (isset($this->preassignedFields['veteran']) && $this->preassignedFields['veteran'] == '2') echo ' selected'; ?>>Eligible Veteran</option>
                                        <option valie="3"<?php if (isset($this->preassignedFields['veteran']) && $this->preassignedFields['veteran'] == '3') echo ' selected'; ?>>Disabled Veteran</option>
                                        <option value="4"<?php if (isset($this->preassignedFields['veteran']) && $this->preassignedFields['veteran'] == '4') echo ' selected'; ?>>Eligible and Disabled</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                         <?php if ($this->EEOSettingsRS['disabilityTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Disability Status:</label>
                                </td>
                                <td class="tdData">
                                    <select id="disability" name="disability" class="inputbox" style="width:200px;" tabindex="<?php echo($tabIndex++); ?>">
                                        <option selected="selected" value="">----</option>
                                        <option value="No"<?php if (isset($this->preassignedFields['disability']) && $this->preassignedFields['disability'] == 'No') echo ' selected'; ?>>No</option>
                                        <option value="Yes"<?php if (isset($this->preassignedFields['disability']) && $this->preassignedFields['disability'] == 'Yes') echo ' selected'; ?>>Yes</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                    </table>
                    <br />
                <?php endif; ?>
                </td><td width="50%" height="100%" valign="top">
                <p class="note<?php if ($this->isModal): ?>Unsized<?php endif; ?>">Other</p>
                <table class="editTable">
                
                 <tr>
                        <td class="tdVertical">
                            <label id="currentPayLabel" for="currentEmployer">Current Pay:</label>
                        </td>
                        <td class="tdData">
                            $ <input type="text" tabindex="<?php echo($tabIndex++); ?>" name="currentPay" id="currentPay" class="inputbox" style="width: 50px" value="<?php if (isset($this->preassignedFields['currentPay'])) $this->_($this->preassignedFields['currentPay']); ?>" />/hr or Salary $<input type="text" tabindex="<?php echo($tabIndex++); ?>" name="currentPaySal" id="currentPaySal" class="inputbox" style="width: 50px" value="<?php if (isset($this->preassignedFields['currentPaySal'])) $this->_($this->preassignedFields['currentPaySal']); ?>" />/yr
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="desiredPayLabel" for="currentEmployer">Desired Pay:</label>
                        </td>
                        <td class="tdData">
                            $ <input type="text" tabindex="<?php echo($tabIndex++); ?>" name="desiredPay" id="desiredPay" class="inputbox" style="width: 50px" value="<?php if (isset($this->preassignedFields['desiredPay'])) $this->_($this->preassignedFields['desiredPay']); ?>" />/hr  or Salary $<input type="text" tabindex="<?php echo($tabIndex++); ?>" name="desiredPaySal" id="desiredPaySal" class="inputbox" style="width: 50px" value="<?php if (isset($this->preassignedFields['desiredPaySal'])) $this->_($this->preassignedFields['desiredPaySal']); ?>" />/yr &nbsp;*
                        </td>
                    </tr>


                    <?php for ($i = 0; $i < count($this->extraFieldRS); $i++): ?>
                        <tr>
                            <td class="tdVertical" id="extraFieldTd<?php echo($i); ?>">
                                <label id="extraFieldLbl<?php echo($i); ?>">
                                    <?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:
                                </label>
                            </td>
                            <td class="tdData" id="extraFieldData<?php echo($i); ?>">
                                <?php echo($this->extraFieldRS[$i]['addHTML']); ?>
                            </td>
                        </tr>
                    <?php endfor; ?>

                    <tr>
                        <td class="tdVertical">
                            <label id="canRelocateLabel" for="canRelocate">Can Relocate:</label>
                        </td>
                        <td class="tdData">
                            <input type="radio" tabindex="<?php echo($tabIndex++); ?>" id="canRelocate" name="canRelocate" value="1" <?php if (isset($this->preassignedFields['canRelocate']) && $this->preassignedFields['canRelocate'] == '1') echo ' checked'; else   echo ' checked';?> /> Yes  
                            <input type="radio" tabindex="<?php echo($tabIndex++); ?>" id="canRelocate" name="canRelocate" value="0" <?php if (isset($this->preassignedFields['canRelocate']) && $this->preassignedFields['canRelocate'] == '0') echo ' checked'; ?> /> No  
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="dateAvailableLabel" for="dateAvailable">Date Available:</label>
                        </td>
                        <td class="tdData">
                            <script type="text/javascript">DateInput('dateAvailable', false, 'MM-DD-YY', '', <?php echo($tabIndex++); ?>);</script>

                            <?php /* DateInput()s take up 3 tabindexes. */ ?>
                            <?php $tabIndex += 2; ?>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">                            <!-- <label id="currentEmployerLabel" for="currentEmployer">Current Employer:</label>-->                        </td>
                        <td class="tdData">                            <input type="hidden" tabindex="<?php echo($tabIndex++); ?>" name="currentEmployer1" id="currentEmployer1" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['currentEmployer'])) $this->_($this->preassignedFields['currentEmployer']); ?>" />                        </td>
                    </tr>

                   
                    <tr>
                        <td class="tdVertical">
                            <label id="sourceLabel" for="sourceSelect">Source:</label>
                        </td>
                        <td class="tdData">
<?php if ($this->isModal): ?>
                            <select id="sourceSelect" tabindex="<?php echo($tabIndex++); ?>" name="source" class="inputbox" style="width: 150px;"  onchange="sourcechange('source',this.selectedIndex);">
<?php else: ?>
                            <select id="sourceSelect" tabindex="<?php echo($tabIndex++); ?>" name="source" class="inputbox" style="width: 150px;" onchange="if (this.value == 'edit') { listEditor('Sources', 'sourceSelect', 'sourceCSV', false); this.value = '(none)'; } if (this.value == 'nullline') { this.value = '(none)'; }">
                                <option value="edit">(Edit Sources)</option>
                                <option value="nullline">-------------------------------</option>
<?php endif; ?>
                                    <option value="(none)" <?php if (!isset($this->preassignedFields['source'])): ?>selected="selected"<?php endif; ?>>(None)</option>
                                    <?php if (isset($this->preassignedFields['source'])): ?>
                                        <option value="<?php $this->_($this->_($this->preassignedFields['source'])); ?>" selected="selected"><?php $this->_($this->_($this->preassignedFields['source'])); ?></option>
                                    <?php endif; ?>
                                <?php foreach ($this->sourcesRS AS $index => $source): ?>
                                    <option value="<?php $this->_($source['name']); ?>"><?php $this->_($source['name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <input type="hidden" id="sourceCSV" name="sourceCSV" value="<?php $this->_($this->sourcesString); ?>" />                            <input type="hidden" id="supplierID" name="supplierID" value="<?php $this->supplierID; ?>" />                            <input type="hidden" id="supplierContactsID" name="supplierContactsID" value="" />
                        </td>
                    </tr>
                    <!--<tr class="supplierBlock">
                                    <td class="tdVertical">
                                        <label id="supplierIDLabel" for="supplierID">Supplier:</label>
                                    </td>
                                    <td class="tdData">
                                    <select tabindex="36" id="supplierID" name="supplierID" class="inputbox" style="width: 150px;">
                                    <option value="">(Select a Supplier)</option>

                                    <?php foreach ($this->suppliersRS as $rowNumber => $suppliersData): ?>
                                        <?php if ($suppliersData['supplierID'] == $this->preassignedFields['supplierID']): ?>
                                            <option selected value="<?php $this->_($suppliersData['supplierID']) ?>"><?php $this->_($suppliersData['name']) ?></option>
                                        <?php else: ?>
                                            <option value="<?php $this->_($suppliersData['supplierID']) ?>"><?php $this->_($suppliersData['name']) ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>&nbsp;*

                                    </td>
                    </tr>
                    <tr class="supplierBlock">
                                    <td class="tdVertical">
                                        <label id="supplierIDLabel" for="supplierID">Supplier Contacts:</label>
                                    </td>
                                    <td class="tdData">
                                    <select tabindex="36" id="supplierContactsID" name="supplierContactsID"
                                     class="inputbox" style="width: 150px;">
                                    <option value="">(Select a Supplier Contacts)</option>                                    
                                    </select>&nbsp;*
                                    </td>
                    </tr>-->
                          
                    <tr>
                        <td class="tdVertical">
                            <label id="keySkillsLabel" for="keySkills">Key Skills*:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" tabindex="<?php echo($tabIndex++); ?>" name="keySkills" id="keySkills" style="width: 400px;" value="<?php if (isset($this->preassignedFields['keySkills'])) $this->_($this->preassignedFields['keySkills']); ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="otherSkillsLabel" for="otherSkills">Other Skills*:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" tabindex="<?php echo($tabIndex++); ?>" name="otherSkills" id="otherSkills" style="width: 400px;" value="<?php if (isset($this->preassignedFields['otherSkills'])) $this->_($this->preassignedFields['otherSkills']); ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="notesLabel" for="notes">Misc. Notes:</label>
                        </td>
                        <td class="tdData">
                            <textarea class="inputbox" tabindex="<?php echo($tabIndex++); ?>" name="notes" id="notes" rows="5" cols="40" style="width: 400px;"><?php if (isset($this->preassignedFields['notes'])) $this->_($this->preassignedFields['notes']); ?></textarea>
                        </td>
                    </tr>                    <tr>                        <td class="tdVertical">                            <label id="resumeurlLabel" for="resumeurl">Resume URL:</label>                        </td>                        <td class="tdData">                            <input type="text" class="inputbox" tabindex="<?php echo($tabIndex++); ?>" name="resumeurl" id="resumeurl" style="width: 400px;" value="<?php if (isset($this->preassignedFields['resumeurl'])) $this->_($this->preassignedFields['resumeurl']); ?>" />                        </td>                    </tr>                    					<tr>						<td colspan=3>							<?php if ($this->isParsingEnabled): ?>                                <input type="hidden" name="loadDocument" id="loadDocument" value="" />                                <input type="hidden" name="parseDocument" id="parseDocument" value="" />                                <input type="hidden" name="documentTempFile" id="documentTempFile" value="<?php echo (isset($this->preassignedFields['documentTempFile']) ? $this->preassignedFields['documentTempFile'] : ''); ?>" />                                <table cellpadding="0" cellspacing="0" border="0">                                    <tr>                                        <td valign="middle" align="right" colspan="2">                                            <img src="images/parser/arrow.gif" border="0" />                                            <input type="hidden" name="MAX_FILE_SIZE" VALUE="10000000" />                                            <input type="file" id="documentFile" name="documentFile" onchange="documentFileChange();" size="<?php if ($this->isModal): ?>20<?php else: ?>40<?php endif; ?>" />                                            <input type="button" id="documentLoad" value="Upload" onclick="loadDocumentFileContents();" disabled />                                            &nbsp;                                        </td>                                    </tr>                                    <tr>                                        <td valign="top" align="left" colspan="2">                                            <?php if (isset($this->preassignedFields['documentTempFile']) && ($tempFile = $this->preassignedFields['documentTempFile']) != ''): ?>                                            <div id="showAttachmentDetails" style="height: 20px; background-color: #e0e0e0; width: 500px; margin: 1px 0 5px 0; padding: 0 3px 0 5px;">                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">                                                    <tr>                                                        <td align="left" valign="top" nowrap="nowrap" style="font-size: 11px;">                                                            <img src="images/parser/attachment.gif" border="0" style="padding-top: 3px;" />                                                            Attachment: <span style="font-weight: bold;"><?php echo $tempFile; ?></span>                                                        </td>                                                        <td align="right" valign="top" nowrap="nowrap" style="font-size: 11px;">                                                            <a href="javascript:void(0);" onclick="removeDocumentFile();">(remove)</a>                                                        </td>                                                    </tr>                                                </table>                                            </div>                                            <?php endif; ?>                                            <textarea class="inputbox" tabindex="90" name="documentText" id="documentText" rows="5" cols="40" onmousemove="documentCheck();" onchange="documentCheck();" onmousedown="documentCheck();" onkeypress="documentCheck();" style="width: <?php if ($this->isModal): ?>320<?php else: ?>500<?php endif; ?>px; height: 210px; padding: 3px;"><?php echo $this->contents; ?></textarea>                                            <br/>                                            <div style="color: #666666; text-align: center;">                                            (<b>hint:</b> you may also paste the resume contents)                                            <br /><br />                                            <?php if (LicenseUtility::isProfessional() || file_exists('modules/asp')): ?>                                            Need to upload multiple resumes? <a href="<?php echo CATSUtility::getIndexName(); ?>?m=import&a=massImport">Click here!</a>                                            <?php else: ?>                                                <?php if ($this->parsingStatus['parseLimit'] >= 0 && (($used = $this->parsingStatus['parseUsed']) / ($limit = $this->parsingStatus['parseLimit']) * 100) > 50): ?>                                                    <?php if ($used == $limit): ?><span style="color: #800000;"><?php endif; ?>                                                    Used <b><?php echo number_format($this->parsingStatus['parseUsed'],0); ?> / <?php echo number_format($this->parsingStatus['parseLimit'],0); ?></b> daily <a href="http://www.resfly.com" target="_blank">Resfly&trade;</a> automatic resume imports                                                    <?php if ($used == $limit): ?>                                                        </span>                                                        <br />                                                        Enter resume information manually or                                                        <a href="http://www.catsone.com/?a=getcats">upgrade to CATS Professional</a>.                                                    <?php endif; ?>                                                <?php endif; ?>                                            <?php endif; ?>                                            </div>                                        </td>                                    </tr>                                </table>                            <?php else: ?>                                <?php if (PARSING_ENABLED &&                                    count($this->parsingStatus) &&                                    $this->parsingStatus['parseUsed'] >= $this->parsingStatus['parseLimit'] &&                                    $this->parsingStatus['parseLimit'] >= 0): ?>                                <a href="http://www.catsone.com/professional" target="_blank">All daily resume imports used. For more, upgrade to CATS professional</a>.                                <?php endif; ?>                                <?php $freeformTop = '<p class="freeformtop">Cut and paste freeform address here.</p>'; ?>                                <?php eval(Hooks::get('CANDIDATE_TEMPLATE_ABOVE_FREEFORM')); ?>                                <?php echo($freeformTop); ?>                                <textarea class="inputbox" tabindex="90" name="addressBlock" id="addressBlock" rows="5" cols="40" style="width: 500px; height: 250px;"></textarea>                                <?php $freeformBottom = '<p class="freeformbottom">Cut and paste freeform address here.</p>'; ?>                                <?php eval(Hooks::get('CANDIDATE_TEMPLATE_BELOW_FREEFORM')); ?>                                <?php echo($freeformBottom); ?>                            <?php endif; ?>												</td>					</tr>
                </table>
</td></tr></table>
                <input type="submit" tabindex="<?php echo($tabIndex++); ?>" class="button" value="Add Candidate" />&nbsp;
                <input type="reset"  tabindex="<?php echo($tabIndex++); ?>" class="button" value="Reset" />&nbsp;
                <?php if ($this->isModal): ?>
                    <input type="button" tabindex="<?php echo($tabIndex++); ?>" class="button" value="Back to Search" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=considerCandidateSearch&amp;jobOrderID=<?php echo($this->jobOrderID); ?>');" />
                <?php else: ?>
                    <input type="button" tabindex="<?php echo($tabIndex++); ?>" class="button" value="Back to Candidates" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates');" />
                <?php endif; ?>
                
            </form>
<script language="javascript">
function print_country(country_id){
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var option_str = document.getElementById(country_id);
	option_str.length=0;
	option_str.options[0] = new Option('Select Country','');
	
	for (var i=0; i<country_arr.length; i++) {
		option_str.options[option_str.length] = new Option(country_arr[i],country_arr[i]);
	}
	option_str.selectedIndex = 239;
	print_state("state", 239);
}

function print_state(state_id, state_index=239){
	var option_str = document.getElementById(state_id);
	
	option_str.length=0;	// Fixed by Julian Woods
	option_str.options[0] = new Option('Select State','');
	option_str.selectedIndex = 0;
	var state_arr = s_a[state_index].split("|");
	for (var i=0; i<state_arr.length; i++) {
		option_str.options[option_str.length] = new Option(state_arr[i],state_arr[i]);
	}
	
}
print_country("country");
$("#extraFieldTd1").hide();
$("#extraFieldData1").hide();
$(document).on("change","input[type=radio]",function(){
    var ac=$('[name="extraField0"]:checked').val();
    
    if(ac=="YES"){
		$("#extraFieldTd1").show();
		$("#extraFieldData1").show();
	}else{
		$("#extraFieldTd1").hide();
		$("#extraFieldData1").hide();
	}    
});
$(".supplierBlock").hide();	

$( "#sourceSelect" ).change(function() {
	//var option_str = document.getElementById(state_id);
	
	var str = "";
    $( "#sourceSelect option:selected" ).each(function() {
      str += $( this ).text() ;
    });
   
	if(str=="Supplier")
	{
		$(".supplierBlock").show();
	}else 
	{
		$(".supplierBlock").hide();		
	}		$(".supplierBlock").hide();	
});

</script>	
<script type="text/javascript">
    document.addCandidateForm.firstName.focus();
    <?php if(isset($this->preassignedFields['email']) || isset($this->preassignedFields['email1'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['email'])) echo(urlencode($this->preassignedFields['email'])); else if(isset($this->preassignedFields['email1'])) echo(urlencode($this->preassignedFields['email1'])); ?>"));
    <?php endif; ?>
    <?php if(isset($this->preassignedFields['email2']) || isset($this->preassignedFields['email2'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['email2'])) echo(urlencode($this->preassignedFields['email2'])); else if(isset($this->preassignedFields['email2'])) echo(urlencode($this->preassignedFields['email2'])); ?>"));
    <?php endif; ?>
    <?php if(isset($this->preassignedFields['phoneCell']) || isset($this->preassignedFields['phoneCell'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['phoneCell'])) echo(urlencode($this->preassignedFields['phoneCell'])); else if(isset($this->preassignedFields['phoneCell'])) echo(urlencode($this->preassignedFields['phoneCell'])); ?>"));
    <?php endif; ?>
    <?php if(isset($this->preassignedFields['phoneWork']) || isset($this->preassignedFields['phoneWork'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['phoneWork'])) echo(urlencode($this->preassignedFields['phoneWork'])); else if(isset($this->preassignedFields['phoneWork'])) echo(urlencode($this->preassignedFields['phoneWork'])); ?>"));
    <?php endif; ?>
    <?php if(isset($this->preassignedFields['phoneHome']) || isset($this->preassignedFields['phoneHome'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['phoneHome'])) echo(urlencode($this->preassignedFields['phoneHome'])); else if(isset($this->preassignedFields['phoneHome'])) echo(urlencode($this->preassignedFields['phoneHome'])); ?>"));
    <?php endif; ?>
    
     $('#supplierID').on('change', function() {
				var supplierID = $( "#supplierID" ).val();
				
				$.ajax({
					type: "POST",
					url: "<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&a=loadsuppliercontacts&supplierID="+ supplierID,
					dataType: "json",
					success: function(data){
													         
						//alert(data);
						$('#supplierContactsID').find('option')
								    .remove()
								    .end()
								    .append('<option value="">Select Supplier Contacts</option>');
								    
					  // alert(data.length);
			            $.each(data['jocontacts'],function(key,value)
								         {
								      
								   $("#supplierContactsID").append("<option value='"+key+"'>" + value +"</option>");
								         });
								         		
												
						
														               
			                                },
			        error: function(msg) {
							 alert('error'+ msg);
							  
							  var output = '';
								for (var property in msg) {
								  output += property + ': ' + msg[property]+'; ';
								}
								alert(output);
							  return false;
							              }                        
			                
				      });
				      return false; 
				
			});
</script>

<?php if ($this->isModal): ?>
    </body>
</html>
<?php else: ?>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
<?php endif; ?>
