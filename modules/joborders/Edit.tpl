<?php /* $Id: Edit.tpl 3810 2007-12-05 19:13:25Z brian $ */ ?>
<?php TemplateUtility::printHeader('Job Orders', array('modules/joborders/validator.js','js/countries.js' , 'js/company.js', 'js/sweetTitles.js',  'js/suggest.js', 'js/joborder.js', 'js/lib.js', 'js/listEditor.js', 'tinymce')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/job_orders.gif" width="24" height="24" border="0" alt="Job Orders" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Job Orders: Edit Job Order</h2></td>
                </tr>
            </table>

            <p class="note">Edit Job Order</p>

            <form name="editJobOrderForm" id="editJobOrderForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=edit" method="post" onsubmit="return checkEditForm(document.editJobOrderForm);" autocomplete="off">
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" id="jobOrderID" name="jobOrderID" value="<?php echo($this->jobOrderID); ?>" />

               <table>
                    <tbody><tr>
                        <td width="50%" height="100%" valign="top">
                            <p class="noteUnsized">Job Information</p>

                            <table class="editTable" width="100%">
                                <tbody>
                                <tr>
                                    <td class="tdVertical">
			                            <label id="isHotLabel" for="isHot">Hot:</label>
			                        </td>
			                        <td class="tdData">
			                            <input type="checkbox" tabindex="18" id="isHot" name="isHot"<?php if ($this->data['isHot'] == 1): ?> checked<?php endif; ?> />&nbsp;
			                            <img title="Checking this box indicates that the job order is 'hot', and shows up highlighted throughout the system." src="images/information.gif" alt="" width="16" height="16" />
			                        </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                       <label id="jobstatusLabel" for="jobstatus">Job Status : </label> 
                                    </td>
                                    <td class="tdData">
                                     <input type="checkbox" tabindex="19" id="public" name="public" onchange="checkPublic(this);" onclick="checkPublic(this);" onkeydown="checkPublic(this);"<?php if ($this->data['public'] == 1): ?> checked<?php endif; ?> />&nbsp;
                            <img title="Checking this box indicates that the job order is public. Job orders flaged as public will be able to be viewed by anonymous users." src="images/information.gif" alt="" width="16" height="16" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="supplierIDLabel" for="supplierID">Industry:</label>
                                    </td>
                                    <td class="tdData">
                                    <select tabindex="36" id="jobgroup" name="jobgroup" class="inputbox" style="width: 150px;">
                                            <option value="">(Select a Industry)</option>
                                            <option value="Engineering" <?php if($this->data['jobgroup']=="Engineering"){ ?> selected <?php }?>>Engineering</option>
                                            <option value="Health" <?php if($this->data['jobgroup']=="Health"){ ?> selected <?php }?>>Health</option>
                                            <option value="Technology" <?php if($this->data['jobgroup']=="Technology"){ ?> selected <?php }?>>Technology</option>
                                            <option value="Manufacturing" <?php if($this->data['jobgroup']=="Manufacturing"){ ?> selected <?php }?>>Manufacturing</option>
                                            <option value="Financial" <?php if($this->data['jobgroup']=="Financial"){ ?> selected <?php }?>>Financial</option>
                                            <option value="Administrative" <?php if($this->data['jobgroup']=="Administrative"){ ?> selected <?php }?>>Administrative</option>
                                            <option value="Hospitality" <?php if($this->data['jobgroup']=="Hospitality"){ ?> selected <?php }?>>Hospitality</option>
                                    
                                   
                                </select>
                                    
                                        

                               
                                    </td>
                                </tr>
                                <tr>
			                        <td class="tdVertical">
			                            <label id="titleLabel" for="title">Title:</label>
			                        </td>
			                        <td class="tdData" colspan="3">
			                            <input type="text" tabindex="1" class="inputbox" id="title" name="title" value="<?php $this->_($this->data['title']); ?>" style="width: 150px;" />&nbsp;*
			                        </td>
                              </tr>
                                <tr>                                    <td class="tdVertical">                                        <label id="clientRefLabel" for="clientrefno">Client Ref.No:</label>                                    </td>                                    <td class="tdData">										<input type="text" tabindex="1" class="inputbox" id="clientrefno" name="clientrefno" value="<?php $this->_($this->data['clientrefno']); ?>" style="width: 150px;" />&nbsp;                                    </td>                                </tr>                               
                                                                                                
                               <tr>
                                    <td class="tdVertical">
                                      <label id="startDateLabel" for="startDate">Posted Date:</label>  
                                    </td>
                                    <td class="tdData">
                                        <?php if (!empty($this->data['startDate'])): ?>
                                <script type="text/javascript">DateInput('startDate', false, 'MM-DD-YY', '<?php echo($this->data['startDateMDY']); ?>', 9);</script>
                            <?php else: ?>
                                <script type="text/javascript">DateInput('startDate', false, 'MM-DD-YY', '', 9);</script>
                            <?php endif; ?>
                                    </td>
                                </tr>
                               <tr>
                                    <td class="tdVertical">
                                       <label id="startDateLabel" for="startDate">Expiration Date:</label> 
                                    </td>
                                    <td class="tdData">
                                       <?php if (!empty($this->data['endDate'])): ?>
		                                <script type="text/javascript">DateInput('endDate', false, 'MM-DD-YY', '<?php echo($this->data['endDateMDY']); ?>', 9);</script>
		                            <?php else: ?>
		                                <script type="text/javascript">DateInput('endDate', false, 'MM-DD-YY', '', 9);</script>
		                            <?php endif; ?> 
                                    </td>
                                </tr>                                 
                               <tr>
                                    <td class="tdVertical">
                                      <label id="openingsLabel" for="openings">Job Openings:</label>  
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="16" class="inputbox" id="openings" name="openings" value="<?php $this->_($this->data['openings']); ?>" style="width: 50px;" />&nbsp;*
                                    </td>
                                </tr>
                               <tr> <td class="tdVertical">
			                            <label id="openingsAvailableLabel" for="openingsAvailable">Remaining Openings:</label>
			                        </td>
			                        <td class="tdData">
			                            <input type="text" tabindex="16" class="inputbox" id="openingsAvailable" name="openingsAvailable" value="<?php $this->_($this->data['openingsAvailable']); ?>" style="width: 50px;" />&nbsp;*
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
                                       <label id="descriptionLabel" for="description">Description:</label> 
                                    </td>
                                    <td class="tdData">
                                      <textarea tabindex="20" class="mceEditor" name="description" id="description" rows="15" style="width: 500px;"><?php $this->_($this->data['description']); ?></textarea>
                                    </td>
                                </tr>
                               <tr>
                            <td class="tdVertical">
                                <label id="notesLabel" for="notes">Internal Notes:</label>
                            </td>
                            <td class="tdData">
                                <textarea tabindex="21" class="mceEditor" name="notes" id="notes" rows="5" style="width: 500px;"><?php $this->_($this->data['notes']); ?></textarea>
                        </tr>                                 
                               <tr>
                        <td class="tdVertical">
                            <label id="statusLabel" for="status">Status:</label>
                        </td>
                        <td class="tdData">
                            <?php if(isset($this->overOpenJOQuota) && ($this->data['status'] == 'On-Hold Or Manager reviewing resumes' || $this->data['status'] == 'Lost' || $this->data['status'] == 'Full' || $this->data['status'] == 'Closed' || $this->data['status'] == 'Cancelled')): ?>
                                <select tabindex="8" id="status" name="status" class="inputbox" style="width: 150px;">
                                    <option <?php if ($this->data['status'] == 'On-Hold Or Manager reviewing resumes'): ?>selected<?php endif; ?> value="On-Hold Or Manager reviewing resumes">On-Hold/Manager reviewing resumes</option>
                                    <option <?php if ($this->data['status'] == 'Full'): ?>selected<?php endif; ?> value="Full">Full</option>
                                    <option <?php if ($this->data['status'] == 'Closed'): ?>selected<?php endif; ?> value="Closed">Closed</option>
                                    <option <?php if ($this->data['status'] == 'Cancelled'): ?>selected<?php endif; ?> value="Cancelled">Cancelled</option>
                                    <option <?php if ($this->data['status'] == 'Lost'): ?>selected<?php endif; ?> value="Lost">Lost</option>
                                </select>&nbsp;*<br />
                                <span style="font-size:10px;">(You have already reached your limit of <?php echo(FREE_ACCOUNT_JOBORDERS); ?> open Job Orders, and cannot make this Job Order Active.)<br /></font>

                            <?php else: ?>
                                <select tabindex="8" id="status" name="status" class="inputbox" style="width: 150px;">
                                    <option <?php if ($this->data['status'] == 'Active'): ?>selected<?php endif; ?> value="Active">Active</option>
                                    <option <?php if ($this->data['status'] == 'On-Hold Or Manager reviewing resumes' || $this->data['status'] == 'On-Hold Or Manager reviewing resumes'): ?>selected<?php endif; ?> value="On-Hold Or Manager reviewing resumes">On-Hold/Manager reviewing resumes</option>
                                    <option <?php if ($this->data['status'] == 'Interviewing Candidates'): ?>selected<?php endif; ?> value="Interviewing Candidates">Interviewing Candidates</option>
                                    <option <?php if ($this->data['status'] == 'Candidate Selected Or Onboarding'): ?>selected<?php endif; ?> value="Candidate Selected Or Onboarding">Candidate Selected Or Onboarding</option>                                                                                             <option <?php if ($this->data['status'] == 'Closed'): ?>selected<?php endif; ?> value="Closed">Closed</option>
                                    <option <?php if ($this->data['status'] == 'Cancelled'): ?>selected<?php endif; ?> value="Cancelled">Cancelled</option>
                                    <option <?php if ($this->data['status'] == 'Closure Lost'): ?>selected<?php endif; ?> value="Closure Lost">Closure Lost</option>                                                                                                      <option <?php if ($this->data['status'] == 'Lost'): ?>selected<?php endif; ?> value="Lost">Lost</option>                                                                        <option <?php if ($this->data['status'] == 'Own'): ?>selected<?php endif; ?> value="Own">Own</option>
                                    <option <?php if ($this->data['status'] == 'Full'): ?>selected<?php endif; ?> value="Full">Full</option>                                    <!--option <?php if ($this->data['status'] == 'Upcoming'): ?>selected<?php endif; ?> value="Upcoming">Upcoming</option>
                                    <option <?php if ($this->data['status'] == 'Lead'): ?>selected<?php endif; ?> value="Lead">Prospective / Lead</option>                                  
                                    <option <?php if ($this->data['status'] == 'Full'): ?>selected<?php endif; ?> value="Full">Full</option-->
                                    
                                    
                                </select>&nbsp;*
                            <?php endif; ?>
                        </td>
                     
                    
                    	
                    </tr>  <?php for ($i = 0; $i < count($this->extraFieldRS); $i++): ?>
                        <tr>
                            <td class="tdVertical" id="extraFieldTd<?php echo($i); ?>">
                                <label id="extraFieldLbl<?php echo($i); ?>">
                                    <?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:
                                </label>
                            </td>
                            <td class="tdData" id="extraFieldData<?php echo($i); ?>">
                                <?php echo($this->extraFieldRS[$i]['editHTML']); ?>
                            </td>
                        </tr>
                    <?php endfor; ?>
                               <tr id="displayQuestionnaires" style="<?php if ($this->isPublic): ?>display: table-row;<?php else: ?>display: none;<?php endif; ?>">
                        <?php if ($this->careerPortalEnabled): ?>
                        <td class="tdVertical">
                            <label id="notesLabel" for="notes">Questionnaire:</label>
                        </td>
                        <td class="tdData">
                            <select id="questionnaire" name="questionnaire" class="inputbox" style="width: 500px;">
                            <option value="none">None</option>
                            <?php foreach ($this->questionnaires as $questionnaire): ?>
                                <option value="<?php echo $questionnaire['questionnaireID']; ?>"<?php if ($this->questionnaireID == $questionnaire['questionnaireID']) echo ' selected'; ?>><?php echo $questionnaire['title']; ?></option>
                            <?php endforeach; ?>
                            </select>
                            <?php if ($_SESSION['CATS']->getAccessLevel() >= ACCESS_LEVEL_SA): ?>
                            <br />
                            <a href="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalSettings" target="_blank">Add / Edit / Delete Questionnaires</a>
                            <?php endif; ?>
                        </td>
                        <?php endif; ?>
                             </tr>
                            </tbody></table>

                             



                        </td>

                        <td width="50%" height="100%" valign="top">
                         <p class="noteUnsized">Client / Implemenation Partner</p>
                             <table class="editTable" width="100%">
                                <tbody>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="companyIDLabel" for="companyID">Name:</label>
                                    </td>
                                    <td class="tdData">
							<!--                            <input type="hidden" name="companyID1" id="companyID1" value="<?php echo($this->data['companyID']); ?>" />                            <?php if ($this->defaultCompanyID !== false): ?>
                                <input type="radio" name="typeCompany" <?php if ($this->defaultCompanyID != $this->data['companyID']) echo(' checked'); ?> onchange="document.getElementById('companyName').disabled = false; if (oldCompanyID != -1) document.getElementById('companyID').value = oldCompanyID;">
                                <input type="text" name="companyName" id="companyName" tabindex="2" value="<?php $this->_($this->data['companyName']) ?>" class="inputbox" style="width: 125px" onFocus="suggestListActivate('getCompanyNames', 'companyName', 'CompanyResults', 'companyID', 'ajaxTextEntryHover', 0, '<?php echo($this->sessionCookie); ?>', 'helpShim');" <?php if ($this->defaultCompanyID == $this->data['companyID']) echo(' disabled'); ?>/>&nbsp;*
                            <?php else: ?>
                                <input type="text" name="companyName" id="companyName" tabindex="2" value="<?php $this->_($this->data['companyName']) ?>" class="inputbox" style="width: 150px" onFocus="suggestListActivate('getCompanyNames', 'companyName', 'CompanyResults', 'companyID', 'ajaxTextEntryHover', 0, '<?php echo($this->sessionCookie); ?>', 'helpShim');" <?php if ($this->defaultCompanyID == $this->data['companyID']) echo(' disabled'); ?>/>&nbsp;*
                            <?php endif; ?>
                            <br />
                            <iframe id="helpShim" src="javascript:void(0);" scrolling="no" frameborder="0" style="position:absolute; display:none;"></iframe>
                            <div id="CompanyResults" class="ajaxSearchResults"></div>
                            <?php if ($this->defaultCompanyID !== false): ?>
                                <input type="radio" name="typeCompany" <?php if ($this->defaultCompanyID == $this->data['companyID']) echo(' checked'); ?> id="defaultCompany" onchange="if(document.getElementById('companyName').disabled == false && document.getElementById('companyID').value > 0) {oldCompanyID = document.getElementById('companyID').value; } else if(document.getElementById('companyName').disabled == false) { oldCompanyID = 0; } document.getElementById('companyName').disabled = true; document.getElementById('companyID').value = '<?php echo($this->defaultCompanyID); ?>'; ">&nbsp;Internal Posting
                            <?php endif; ?>
                            <script type="text/javascript">oldCompanyID = -1; watchCompanyIDChangeJO('<?php echo($this->sessionCookie); ?>');</script>                            -->						    <select tabindex="10" id="companyID" name="companyID" class="inputbox" style="width: 150px;" onchange="updateCompanyData2('<?php echo($this->sessionCookie); ?>','partnerLocationID')">							    <option value="0">None</option>							    <?php foreach ($this->companiesRS as $rowNumber => $companiesData): ?>							          <?php if ($this->data['companyID'] == $companiesData['companyID']): ?>							          	<option selected value="<?php $this->_($companiesData['companyID']) ?>"><?php $this->_($companiesData['name']) ?></option>							    	  <?php else: ?>							    	  	<option value="<?php $this->_($companiesData['companyID']) ?>"><?php $this->_($companiesData['name']) ?></option>							    	  <?php endif; ?>	       							    <?php endforeach; ?>							</select>&nbsp;*	                           
                        </td>
                        </tr>                                <tr>                                    <td class="tdVertical">                                        <label id="partnerLocationLabel" for="partnerLocation">Company Location:</label>                                    </td>                                    <td class="tdData">									    <select tabindex="10" id="partnerLocationID" name="partnerLocationID" class="inputbox" style="width: 150px;">										    <option value="0">None</option>			                                <?php foreach ($this->partnerLocationRS as $rowNumber => $partnerLocationData): ?>			                                    <?php if ($this->data['client_location_id'] == $partnerLocationData['CompLocID']): ?>			                                        <option selected value="<?php $this->_($partnerLocationData['CompLocID']) ?>"><?php $this->_($partnerLocationData['CompanyAdd']) ?></option>			                                    <?php else: ?>			                                        <option value="<?php $this->_($partnerLocationData['CompLocID']) ?>"><?php $this->_($partnerLocationData['CompanyAdd']) ?></option>			                                    <?php endif; ?>			                                <?php endforeach; ?>										    										</select>&nbsp;                                    </td>                                </tr>                        <tr>
                            <td class="tdVertical">
                                <label id="contactIDLabel" for="contactID">Contact:</label>
                            </td>
                            <td class="tdData">
                             <select tabindex="3" id="contactID" name="contactID" class="inputbox" style="width: 150px;">
                                <option value="0">None</option>

                                <?php foreach ($this->contactsRS as $rowNumber => $contactsData): ?>
                                    <?php if ($this->data['contactID'] == $contactsData['contactID']): ?>
                                        <option selected value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>
                                    <?php else: ?>
                                        <option value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </select>&nbsp;
                            <img src="images/indicator2.gif" id="contactsIndicator" alt="" style="visibility: hidden; margin-left: 5px;" height="16" width="16" />
                        </td>
                            </tr>                           <tr>                            <td class="tdVertical">                                <label id="contactIDLabel" for="contactID">Secondary Contact :</label>                            </td>                            <td class="tdData">                                <select tabindex="9" id="contactID2" name="contactID2" class="inputbox" style="width: 150px;">                                    <option value="0">None</option>		                                <?php foreach ($this->contactsRS as $rowNumber => $contactsData): ?>				                                    <?php if ($this->data['contact_id2'] == $contactsData['contactID']): ?>				                                        <option selected value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>				                                    <?php else: ?>				                                        <option value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>				                                    <?php endif; ?>				                                <?php endforeach; ?>                                </select>&nbsp;                                <img src="images/indicator2.gif" id="contactsIndicator" alt="" style="visibility: hidden; margin-left: 5px;" height="16" width="16" />                            </td>                            </tr>                                                            <tr>
                                    <td class="tdVertical">
                                        
                                    </td>
                                    <td class="tdData">
                                       
                                    </td>
                                </tr>
                            </tbody></table>
						<p class="noteUnsized">End Client</p>                             <table class="editTable" width="100%">                                <tbody>                                <tr>                                    <td class="tdVertical">                                        <label id="CustIDLabel" for="custID">Name:</label>                                    </td>                                    <td class="tdData">									    <select tabindex="10" id="custCompID" name="custCompID" class="inputbox" style="width: 150px;" onchange="updateClientCompanyData('<?php echo($this->sessionCookie); ?>','WorkLocationID')">										    <option value="0">None</option>										    <?php foreach ($this->companiesRS as $rowNumber => $companiesData): ?>										          <?php if ($this->data['endclient_company_id'] == $companiesData['companyID']): ?>										          	<option selected value="<?php $this->_($companiesData['companyID']) ?>"><?php $this->_($companiesData['name']) ?></option>										    	  <?php else: ?>										    	  	<option value="<?php $this->_($companiesData['companyID']) ?>"><?php $this->_($companiesData['name']) ?></option>										    	  <?php endif; ?>	       										    <?php endforeach; ?>										</select>&nbsp;						                                                    </td>                                </tr>                               <tr>                                    <td class="tdVertical">                                        <label id="workLocationLabel" for="custID">Work Location:</label>                                    </td>                                    <td class="tdData">									    <select tabindex="10" id="WorkLocationID" name="WorkLocationID" class="inputbox" style="width: 150px;">																			    <option value="0">None</option>			                                <?php foreach ($this->WorkLocationRS as $rowNumber => $WorkLocationData): ?>			                                    <?php if ($this->data['endclient_location_id'] == $WorkLocationData['CompLocID']): ?>			                                        <option selected value="<?php $this->_($WorkLocationData['CompLocID']) ?>"><?php $this->_($WorkLocationData['CompanyAdd']) ?></option>			                                    <?php else: ?>			                                        <option value="<?php $this->_($WorkLocationData['CompLocID']) ?>"><?php $this->_($WorkLocationData['CompanyAdd']) ?></option>			                                    <?php endif; ?>			                                <?php endforeach; ?>																			</select>&nbsp;                                    </td>                                </tr>                                <tr>                                    <td class="tdVertical">                                       <label id="clientContact1Label" for="clientContact1">Primary Contact:</label>                                     </td>                                    <td class="tdData">                                       <select  tabindex="11"  style="width: 150px"  onchange=""  id="clientContact1" class="inputbox"  name ="clientContact1">                                       <option value="0">None</option>                                       			                                <?php foreach ($this->endclient_contactRS as $rowNumber => $endclient_contactData): ?>						                                    <?php if ($this->data['endclient_contact_id'] == $endclient_contactData['contactID']): ?>						                                        <option selected value="<?php $this->_($endclient_contactData['contactID']) ?>"><?php $this->_($endclient_contactData['lastName']) ?>, <?php $this->_($endclient_contactData['firstName']) ?></option>						                                    <?php else: ?>						                                        <option value="<?php $this->_($endclient_contactData['contactID']) ?>"><?php $this->_($endclient_contactData['lastName']) ?>, <?php $this->_($endclient_contactData['firstName']) ?></option>						                                    <?php endif; ?>						                                <?php endforeach; ?>                                                                              </select>                                     </td>                                </tr>                               <tr>                                    <td class="tdVertical">                                       <label id="clientContact2Label" for="clientContact2">Secondary Contact:</label>                                     </td>                                    <td class="tdData">                                       <select  tabindex="11"  style="width: 150px"  onchange=""  id="clientContact2" class="inputbox"  name ="clientContact2">                                       <option value="0">None</option>                                       			                                <?php foreach ($this->endclient_contactRS as $rowNumber => $endclient_contactData): ?>						                                    <?php if ($this->data['endclient_contact_id2'] == $endclient_contactData['contactID']): ?>						                                        <option selected value="<?php $this->_($endclient_contactData['contactID']) ?>"><?php $this->_($endclient_contactData['lastName']) ?>, <?php $this->_($endclient_contactData['firstName']) ?></option>						                                    <?php else: ?>						                                        <option value="<?php $this->_($endclient_contactData['contactID']) ?>"><?php $this->_($endclient_contactData['lastName']) ?>, <?php $this->_($endclient_contactData['firstName']) ?></option>						                                    <?php endif; ?>						                                <?php endforeach; ?>                                                                             </select>                                    </td>                                </tr>                                <tr>                                    <td class="tdVertical">                                                                            </td>                                    <td class="tdData">                                                                           </td>                                </tr>                            </tbody></table>                        
                            <p class="noteUnsized" style="display: none;">Supplier Information</p>
                             <table class="editTable" width="100%" style="display: none;">
                                <tbody>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="supplierIDLabel" for="supplierID">Supplier:</label>
                                    </td>
                                    <td class="tdData">
                                    <select tabindex="36" id="supplierID" name="supplierID" class="inputbox" style="width: 150px;">
                                    <option value="">(Select a Supplier)</option>

                                    <?php foreach ($this->suppliersRS as $rowNumber => $suppliersData): ?>
                                        <?php if ($suppliersData['supplierID'] == $this->supplierID): ?>
                                            <option selected value="<?php $this->_($suppliersData['supplierID']) ?>"><?php $this->_($suppliersData['name']) ?></option>
                                        <?php else: ?>
                                            <option value="<?php $this->_($suppliersData['supplierID']) ?>"><?php $this->_($suppliersData['name']) ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>&nbsp;*
                                    
                                        

                               
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="supplierIDLabel" for="supplierID">Supplier Contacts:</label>
                                    </td>
                                    <td class="tdData">
                                    <select tabindex="36" id="supplierContactsID" name="supplierContactsID"
                                     class="inputbox" style="width: 150px;">
                                    <option value="">(Select a Supplier Contacts)</option>  
                                    <?php foreach ($this->supplierscontactsRS as $rowNumber => $supplierscontactsData): ?>
                                        <?php
                                        //print_r($supplierscontactsData);
                                         if ($supplierscontactsData['suppliercontactID'] == $this->supplierContactID): ?>
                                            <option selected value="<?php $this->_($supplierscontactsData['suppliercontactID']) ?>"><?php $this->_($supplierscontactsData['firstName']) ?> <?php $this->_($supplierscontactsData['lastName']) ?></option>
                                        <?php else: ?>
                                            <option value="<?php $this->_($supplierscontactsData['suppliercontactID']) ?>"><?php $this->_($supplierscontactsData['firstName']) ?> <?php $this->_($supplierscontactsData['lastName']) ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>                                  
                                    </select>&nbsp;*
                                    
                                        

                               
                                    </td>
                                </tr>
                           
                            </tbody></table>
                          <p class="noteUnsized">Hiring Information</p>
                            <table class="editTable" width="100%">
                                <tbody>                                
                                <tr>
                                    <td class="tdVertical">
                                       <label id="typeLabel" for="type">Contract Type :</label> 
                                    </td>
                                    <td class="tdData">
                                        <select tabindex="28" id="type" name="type" class="inputbox" style="width: 150px;" onchange="contracttypechange('type',this.selectedIndex);">
                                    <option value="C"   <?php if(isset($this->data['type']) && $this->data['type'] == 'C') echo('selected'); ?>>C (Contract)</option>    
                                    <option value="C2H" <?php if(isset($this->data['type']) && $this->data['type'] == 'C2H') echo('selected'); ?>>C2H (Contract to Hire)</option>
                                    <option value="H"   <?php if(isset($this->data['type']) && ($this->data['type'] == 'H' || $this->data['type'] == 'DH')) echo('selected'); ?>>DH (Direct Hire)</option>
                                    <!--option value="FL"  <?php if(isset($this->data['type']) && $this->data['type'] == 'FL') echo('selected'); ?>>FL (Freelance)</option-->
                                </select>&nbsp;*
                                    </td>
                                </tr>
                               
                               <tr class="CON CH Contr">
                                    <td class="tdVertical">
                                      <label id="maxRateLabel" for="maxRate">Bill Rate:</label>  
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="29" maxlength="10" class="inputbox" id="minRate" name="minRate" style="width: 50px;" <?php if(isset($this->data['minRate'])): ?>value="<?php $this->_($this->data['maxRate']); ?>"<?php endif; ?>/><b>/hour</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="29" maxlength="10" class="inputbox" id="maxRate" name="maxRate" style="width: 50px;" <?php if(isset($this->data['maxRate'])): ?>value="<?php $this->_($this->data['maxRate']); ?>"<?php endif; ?>/><b>/hour</b> </td>
                                </tr>
                                
                                    
                               <tr class="CON CH Contr">
                                    <td class="tdVertical">
                                       <label id="payrateLabel" for="Payrate">Pay Rate:</label>
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="30" maxlength="10"  class="inputbox" id="minpayRate" name="minpayRate" style="width: 50px;" <?php if(isset($this->data['minpayRate'])): ?>value="<?php $this->_($this->data['minpayRate']); ?>"<?php endif; ?>/><b>/hour</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="30" maxlength="10"  class="inputbox" id="payRate" name="payRate" style="width: 50px;" <?php if(isset($this->data['payRate'])): ?>value="<?php $this->_($this->data['payRate']); ?>"<?php endif; ?>/><b>/hour</b>      </td>
                                </tr>
                                
                                <tr class="CON CH Contr">
                                    <td class="tdVertical">
                                       <label id="payrateLabel" for="Payrate"></label>
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="30" maxlength="10"  class="inputbox" id="minsalary" name="minsalary" style="width: 100px;" <?php if(isset($this->data['minsalary'])): ?>value="<?php $this->_($this->data['minsalary']); ?>"<?php endif; ?>/><b>Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="13" class="inputbox" id="salary" name="salary" maxlength="10"   style="width: 100px;" <?php if(isset($this->data['salary'])): ?>value="<?php $this->_($this->data['salary']); ?>"<?php endif; ?>/><b>Salary Yearly</b> 
                                    </td>
                                </tr>
                                
                                <tr class="CON CH Contr">
                                    <td class="tdVertical">
                                       <label id="durationLabel" for="duration">Duration:</label> 
                                    </td>
                                    <td class="tdData">
                                       <select tabindex="31" id="duration" name="duration" class="inputbox" style="width: 150px;">
                                
                                    <option value="0-3 months"<?php if ($this->data['duration'] == '0-3 months'){ ?> selected="selected"<?php }?>>0-3 months</option>                                   
                                                                    
                                    <option value="0-6 months"<?php if ($this->data['duration'] == '0-6 months'){ ?>  selected="selected"<?php }?>>0-6 months</option>                                    
                                                                    
                                    <option value="6-12 months" <?php if ($this->data['duration'] == '6-12 months'){ ?>selected="selected"<?php }?>>6-12 months</option>
                                                                   
                                    <option value="1-2 years" <?php if ($this->data['duration'] == '1-2 years'){ ?> selected="selected"<?php }?>>1-2 years</option>
                                
                                    <option value="N/A" <?php if ($this->data['duration'] == '1-2 years'){ ?>selected="selected"<?php }?>>N/A</option>
                                    
                                
                            </select>
                                    </td>
                                </tr>
                                <tr class="CH Contr">
                                    <td class="tdVertical">
                                       <label id="benefitsyLabel" for="benefits">Benefits:</label> 
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="34" class="inputbox" id="benefits" name="benefits" style="width: 90%;" <?php if(isset($this->data['benefits'])): ?>value="<?php $this->_($this->data['benefits']); ?>"<?php endif; ?>/>
                                    </td>
                                </tr>
                                 <tr class="CH Contr">
                                    <td class="tdVertical" style="text-align: left;" colspan="2"><p class="noteUnsized">Client Hiring Information</p></td>
                              </tr> 
                                 <tr class="CH DH Contr">
                                    <td class="tdVertical">
                                       <label id="currentpayrateLabel" for="Payrate">Pay Rate:</label>
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="32" maxlength="10"  class="inputbox" id="mincurrentpayRate" name="mincurrentpayRate" style="width: 50px;" <?php if(isset($this->data['mincurrentpayRate'])): ?>value="<?php $this->_($this->data['mincurrentpayRate']); ?>"<?php endif; ?>/><b>/hour</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="32" maxlength="10"  class="inputbox" id="currentpayRate" name="currentpayRate" style="width: 50px;" <?php if(isset($this->data['currentpayRate'])): ?>value="<?php $this->_($this->data['currentpayRate']); ?>"<?php endif; ?>/><b>/hour</b>
                                    </td>
                                </tr>
                                
                                 <tr class="CH DH Contr">
                                    <td class="tdVertical">
                                       <label id="currentpayrateLabel" for="Payrate"></label>
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="32" maxlength="10"  class="inputbox" id="mincurrentpayRateSal" name="mincurrentpayRateSal" style="width: 100px;" <?php if(isset($this->data['mincurrentpayRateSal'])): ?>value="<?php $this->_($this->data['mincurrentpayRateSal']); ?>"<?php endif; ?>/><b>Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="32" maxlength="10"  class="inputbox" id="currentpayRateSal" name="currentpayRateSal" style="width: 100px;" <?php if(isset($this->data['currentpayRateSal'])): ?>value="<?php $this->_($this->data['currentpayRateSal']); ?>"<?php endif; ?>/><b>Salary Yearly</b>
                                    </td>
                                </tr>
                                
                                 
                                <tr class="CH DH Contr">
                                    <td class="tdVertical">
                                       <label id="benefitsyLabel" for="benefits"><span class="CH Contr">Client </span>Benefits:</label> 
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="34" class="inputbox" id="clientbenefits" name="clientbenefits" style="width: 90%;" <?php if(isset($this->data['clientbenefits'])): ?>value="<?php $this->_($this->data['clientbenefits']); ?>"<?php endif; ?>/>
                                    </td>
                                </tr>
                                <tr class="DH Contr">
                                    <td class="tdVertical">
                                       <label id="OurfeeLabel" for="ourfee">Our fee:</label> 
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="35" maxlength="10" class="inputbox" id="ourfee_percent" name="ourfee_percent" style="width: 50px;" <?php if(isset($this->data['ourfee_percent'])): ?>value="<?php $this->_($this->data['ourfee_percent']); ?>"<?php endif; ?>/>%&nbsp;&nbsp;Or&nbsp;&nbsp;
                                      Fixed Amount $<input type="text" tabindex="35" maxlength="10" class="inputbox" id="ourfee" name="ourfee" style="width: 100px;" <?php if(isset($this->data['ourfee'])): ?>value="<?php $this->_($this->data['ourfee']); ?>"<?php endif; ?>/>
                                    </td>
                                </tr>
                                <tr>
                            <td class="tdVertical">
                                <label id="notesLabel" for="notes">Notes:</label>
                            </td>
                            <td class="tdData">
                                <textarea tabindex="6" class="mceEditor" name="hirenotes" id="hirenotes" rows="5" style="width: 100%;"><?php if(isset($this->data['hirenotes'])): ?><?php $this->_($this->data['hirenotes']); ?><?php endif; ?></textarea>
                            </td>
                        </tr>
                            </tbody></table>
                            <p class="noteUnsized">Job Ownership Information</p>
                             <table class="editTable" width="100%">
                                <tbody>
                                <tr>
                                    <td class="tdVertical">
                                       <label id="recruiterLabel" for="recruiter">Account Manager:</label>
                                    </td>
                                    <td class="tdData">
                                       <select tabindex="7" id="owner" name="owner" class="inputbox" style="width: 150px;" <?php if (!$this->emailTemplateDisabled): ?>onchange="document.getElementById('divOwnershipChange').style.display=''; <?php if ($this->canEmail): ?>document.getElementById('checkboxOwnershipChange').checked=true;<?php endif; ?>"<?php endif; ?>>
                                <option value="-1">None</option>

                                <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>
                                    <?php if ($this->data['owner'] == $usersData['userID']): ?>
                                        <option selected value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                    <?php else: ?>
                                        <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </select>&nbsp;*
                            <div style="display:none;" id="divOwnershipChange">
                                <input type="checkbox" name="ownershipChange" id="checkboxOwnershipChange" <?php if (!$this->canEmail): ?>disabled<?php endif; ?> /> E-Mail new Account Manager of change
                                    </td>
                                </tr> 
                                <tr>
                                    <td class="tdVertical">
                                       <label id="ownerLabel" for="owner">Assignee:</label> 
                                    </td>
                                    <td class="tdData">
                                    <select tabindex="6" id="recruiter" name="recruiter" class="inputbox" style="width: 150px;">
                                <option value="">(Select a User)</option>

                                <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>
                                    <?php if ($this->data['recruiter'] == $usersData['userID']): ?>
                                        <option selected value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                    <?php else: ?>
                                        <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </select>&nbsp;*
                                       
                            </div>
                                    </td>
                                </tr>
                                
                                
                            </tbody></table>
                        </td>
                        </tr>
                        </table>
      				
					<p class="noteUnsized">Website Posting</p>                  
					<table class="editTable" width="100%">
                    <tr>
                        <td class="tdVertical">
                            <label id="pubtitleLabel" for="title">Public Title:</label>
                        </td>
                        <td class="tdData">
                             <input type="text" tabindex="20" class="inputbox" id="pubtitle" name="pubtitle" value="<?php $this->_($this->data['pubtitle']); ?>" style="width: 100%;" />&nbsp;
                        </td></tr>


                        <tr>
                            <td class="tdVertical">
                                <label id="pdescriptionLabel" for="pdescription">Description:</label>
                            </td>
                            <td class="tdData">
                                <textarea tabindex="40" class="mceEditor" name="pdescription" id="pdescription" rows="15" style="width: 90%;"><?php if(isset($this->data['pdescription'])): ?><?php $this->_($this->data['pdescription']); ?><?php endif; ?></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdVertical">
                                <label id="DisclaimerLabel" for="Disclaimer">Disclaimer:</label>
                            </td>
                            <td class="tdData">
                                <input type="checkbox" tabindex="41" id="disclaimer" name="disclaimer"/>&nbsp;Posted information in job title and job description must not contain any client information including the bill rates and job IDs. Please review the information before adding the job order. </td>
                        </tr>  
                        

                        
                    </table>              

               
                <input type="submit" tabindex="22" class="button" name="submit" id="submit" value="Save" />&nbsp;
                <input type="reset"  tabindex="23" class="button" name="reset"  id="reset"  value="Reset" />&nbsp;
                <input type="button" tabindex="24" class="button" name="back"   id="back"   value="Back to Details" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=show&amp;jobOrderID=<?php echo($this->jobOrderID); ?>');" />
            </form>
<script language="javascript">
function print_country(country_id){
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var option_str = document.getElementById(country_id);
	option_str.length=0;
	option_str.options[0] = new Option('Select Country','');
	
	var selectedIndex=0;
	for (var i=0; i<country_arr.length; i++) {
		option_str.options[option_str.length] = new Option(country_arr[i],country_arr[i]);
		if(country_arr[i]=='<?php echo $this->data['country'];?>')
			selectedIndex= i+1;
	}
	if(selectedIndex>0){
		option_str.selectedIndex = selectedIndex;
		print_state("state", selectedIndex);	
	}else{
		option_str.selectedIndex = 239;
		print_state("state", 239);
	}
}
function contracttypechange(typefield,type_ndex){
	//var option_str = document.getElementById(state_id);
	//alert(type_ndex);
	if(type_ndex=="0")
	{
		$(".DH").hide();
		$(".CH").hide();
		$(".CON").show();
		
	}else if(type_ndex=="1")
	{
		$(".CON").hide();
		$(".DH").hide();
	    $(".CH").show();
		
		
	}else if(type_ndex=="2")
	{   $(".CON").hide();
	    $(".CH").hide();
		$(".DH").show();		
	}
}
<?php 
		if(isset($this->data['type']) && $this->data['type'] == 'C') 
		echo '$(".CON").show();'; 
		else if(isset($this->data['type']) && $this->data['type'] == 'C2H') 
		echo '$(".CH").show();'; 
		else if(isset($this->data['type']) && ($this->data['type'] == 'H' || $this->data['type'] == 'DH')) 
		echo '$(".DH").show();'; 

?>

      

function print_state(state_id, state_index=239){
	var option_str = document.getElementById(state_id);
	
	option_str.length=0;	// Fixed by Julian Woods
	option_str.options[0] = new Option('Select State','');
	option_str.selectedIndex = 0;
	var state_arr = s_a[state_index].split("|");
	for (var i=0; i<state_arr.length; i++) {
		option_str.options[option_str.length] = new Option(state_arr[i],state_arr[i]);
		if(state_arr[i]=='<?php echo $this->data['state'];?>')
		option_str.selectedIndex = i+1;
	} 
	
}
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
								      
								        $("#supplierContactsID").append("<option>" + value +"</option>");
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
     
		
print_country("country");</script>
            <script type="text/javascript">
                document.editJobOrderForm.title.focus();
            </script>
        </div>
    </div>
<?php TemplateUtility::printFooter();  ?>
