<?php /* $Id: Edit.tpl 3695 2007-11-26 22:01:04Z brian $ */ ?>
<?php TemplateUtility::printHeader('Candidates', array('modules/candidates/validator.js','js/countries.js', 'js/sweetTitles.js', 'js/listEditor.js', 'js/doubleListEditor.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/candidate.gif" width="24" height="24" border="0" alt="Candidates" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Candidates: Edit</h2></td>
               </tr>
            </table>

            <p class="note">Edit Candidate</p>

            <form name="editCandidateForm" id="editCandidateForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=edit" method="post" onsubmit="return checkEditForm(document.editCandidateForm);" autocomplete="off">
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" id="candidateID" name="candidateID" value="<?php $this->_($this->data['candidateID']); ?>" />
 <table  width="100%">
                    <tbody><tr>
                        <td width="33%" height="100%" valign="top">
                <table class="editTable"  width="100%">
                    <tr>
                        <td class="tdVertical" valign="top" style="height: 28px;">
                            <label id="isHotLabel" for="isHot">Active:</label>
                        </td>
                        <td class="tdData" >
                            <input type="checkbox" id="isActive" name="isActive"<?php if ($this->data['isActive'] == 1): ?> checked<?php endif; ?> />
                            <img title="Unchecking this box indicates the candidate is inactive, and will no longer display on the resume search results." src="images/information.gif" alt="" width="16" height="16" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="tdVertical">
                            <label id="firstNameLabel" for="firstName">First Name:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="firstName" name="firstName" value="<?php $this->_($this->data['firstName']); ?>" style="width: 150px;" />&nbsp;*
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="middleNameLabel" for="middleName">Middle Name:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="middleName" name="middleName" value="<?php $this->_($this->data['middleName']); ?>" style="width: 150px;" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="lastNameLabel" for="lastName">Last Name:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="lastName" name="lastName" value="<?php $this->_($this->data['lastName']); ?>" style="width: 150px;" />&nbsp;*
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="email1Label" for="email1">E-Mail:</label>
                        </td>
                        <td class="tdData">
                            <input type="email" class="inputbox" id="email1" name="email1" value="<?php $this->_($this->data['email1']); ?>" style="width: 150px;"  onchange="checkEmailAlreadyInSystem(this.value);" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="email2Label" for="email2">2nd E-Mail:</label>
                        </td>
                        <td class="tdData">
                            <input type="email" class="inputbox" id="email2" name="email2" value="<?php $this->_($this->data['email2']); ?>" style="width: 150px;"  onchange="checkEmailAlreadyInSystem(this.value);" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneHomeLabel" for="phoneHome">Home Phone:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="phoneHome" name="phoneHome" value="<?php $this->_($this->data['phoneHome']); ?>" style="width: 150px;" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneCellLabel" for="phoneCell">Cell Phone:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="phoneCell" name="phoneCell" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" placeholder="***-***-****" value="<?php $this->_($this->data['phoneCell']); ?>" style="width: 150px;" />&nbsp;
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneWorkLabel" for="phoneWork">Work Phone:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="phoneWork" name="phoneWork" value="<?php $this->_($this->data['phoneWork']); ?>" style="width: 150px;" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="webSiteLabel" for="webSite">Web Site:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="webSite" name="webSite" value="<?php $this->_($this->data['webSite']); ?>" style="width: 150px" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="addressLabel" for="address1">Address:</label>
                        </td>
                        <td class="tdData">
                            <textarea class="inputbox" id="address" name="address" style="width: 150px;"><?php $this->_($this->data['address']); ?></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="countryLabel" for="state">Country:</label>
                        </td>
                        <td class="tdData"><select  tabindex="11"  style="width: 150px"  onchange="print_state('state',this.selectedIndex);"
                         id="country" class="inputbox"  name ="country"></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="stateLabel" for="state">State:</label>
                        </td>
                        <td class="tdData"><select  tabindex="11" name ="state" id ="state"  class="inputbox" ></select>
                            <!--input type="text" class="inputbox" id="state1" name="state1" value="<?php $this->_($this->data['state']); ?>" style="width: 150px;" /-->
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="cityLabel" for="city">City:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="city" name="city" value="<?php $this->_($this->data['city']); ?>" style="width: 150px;" />
                        </td>
                    </tr>

                    

                    <tr>
                        <td class="tdVertical">
                            <label id="zipLabel" for="zip">Zip Code:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="zip" name="zip" value="<?php $this->_($this->data['zip']); ?>" style="width: 150px;" />
                            <input type="button" class="button" onclick="CityState_populate('zip', 'ajaxIndicator');" value="Lookup" />
                            <img src="images/indicator2.gif" alt="AJAX" id="ajaxIndicator" style="vertical-align: middle; visibility: hidden; margin-left: 5px;" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="canRelocateLabel" for="canRelocate">Best Time To Call:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="bestTimeToCall" name="bestTimeToCall" value="<?php $this->_($this->data['bestTimeToCall']); ?>" style="width: 150px;" />
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td class="tdVertical" valign="top" style="height: 28px;">
                            <label id="isHotLabel" for="isHot">Do Not Work:</label>
                        </td>
                        <td class="tdData" >
                            <input type="checkbox" id="isHot" name="isHot"<?php if ($this->data['isHot'] == 1): ?> checked<?php endif; ?> />

                        </td>
                    </tr>
                     <tr>
                        <td class="tdVertical" valign="top" style="height: 28px;">
                            <label id="isPrequalifiedLabel" for="isPrequalified">Pre-Qualified Candidate:</label>
                        </td>
                        <td class="tdData" >
                            <input type="checkbox" id="isPrequalified" name="isPrequalified"<?php if ($this->data['isPrequalified'] == 1): ?> checked<?php endif; ?> />

                        </td>
                    </tr>
                            
                    

                    <tr>
                        <td class="tdVertical">
                            <label id="ownerLabel" for="owner">Owner:</label>
                        </td>
                        <td class="tdData">
                            <select id="owner" name="owner" class="inputbox" style="width: 150px;" <?php if (!$this->emailTemplateDisabled): ?>onchange="document.getElementById('divOwnershipChange').style.display=''; <?php if ($this->canEmail): ?>document.getElementById('checkboxOwnershipChange').checked=true;<?php endif; ?>"<?php endif; ?>>
                                <option value="-1">None</option>

                                <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>
                                    <?php if ($this->data['owner'] == $usersData['userID']): ?>
                                        <option selected="selected" value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                    <?php else: ?>
                                        <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </select>&nbsp;*
                            <div style="display:none;" id="divOwnershipChange">
                                <input type="checkbox" name="ownershipChange" id="checkboxOwnershipChange" <?php if (!$this->canEmail): ?>disabled<?php endif; ?>> E-Mail new owner of change
                            </div>
                        </td>
                    </tr>

                     <tr>
                        <td class="tdVertical">
                            <label id="sourceLabel" for="image">Picture:</label>
                        </td>
                        <td class="tdData">
                            <input type="button" class="button" id="addImage" name="addImage" value="Edit Profile Picture" style="width:150px;" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=addEditImage&amp;candidateID=<?php echo($this->candidateID); ?>', 400, 370, null); return false;" />&nbsp;
                        </td>
                    </tr>
                </table>
               
                <?php if($this->EEOSettingsRS['enabled'] == 1): ?>
                    <?php if(!$this->EEOSettingsRS['canSeeEEOInfo']): ?>
                        <table class="editTable"  width="100%">
                            <tr>
                                <td>
                                    Editing EEO data is disabled.
                                </td>
                            </tr>
                        </table>
                        <table class="editTable" width="100%"  style="display:none;">
                    <?php else: ?>
                        <table class="editTable"  width="100%">
                    <?php endif; ?>               

                         <?php if ($this->EEOSettingsRS['genderTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Gender:</label>
                                </td>
                                <td class="tdData">
                                    <select id="gender" name="gender" class="inputbox" style="width:200px;">
                                        <option value="">----</option>
                                        <option value="m" <?php if (strtolower($this->data['eeoGender']) == 'm') echo('selected'); ?>>Male</option>
                                        <option value="f" <?php if (strtolower($this->data['eeoGender']) == 'f') echo('selected'); ?>>Female</option>
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
                                    <select id="race" name="race" class="inputbox" style="width:200px;">
                                        <option value="">----</option>
                                        <option value="1" <?php if ($this->data['eeoEthnicTypeID'] == 1) echo('selected'); ?>>American Indian</option>
                                        <option value="2" <?php if ($this->data['eeoEthnicTypeID'] == 2) echo('selected'); ?>>Asian or Pacific Islander</option>
                                        <option value="3" <?php if ($this->data['eeoEthnicTypeID'] == 3) echo('selected'); ?>>Hispanic or Latino</option>
                                        <option value="4" <?php if ($this->data['eeoEthnicTypeID'] == 4) echo('selected'); ?>>Non-Hispanic Black</option>
                                        <option value="5" <?php if ($this->data['eeoEthnicTypeID'] == 5) echo('selected'); ?>>Non-Hispanic White</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                         <?php if ($this->EEOSettingsRS['veteranTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Vetran Status:</label>
                                </td>
                                <td class="tdData">
                                    <select id="veteran" name="veteran" class="inputbox" style="width:200px;">
                                        <option value="">----</option>
                                        <option value="1" <?php if ($this->data['eeoVeteranTypeID'] == 1) echo('selected'); ?>>No</option>
                                        <option value="2" <?php if ($this->data['eeoVeteranTypeID'] == 2) echo('selected'); ?>>Eligible Veteran</option>
                                        <option value="3" <?php if ($this->data['eeoVeteranTypeID'] == 3) echo('selected'); ?>>Disabled Veteran</option>
                                        <option value="4" <?php if ($this->data['eeoVeteranTypeID'] == 4) echo('selected'); ?>>Eligible and Disabled</option>
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
                                    <select id="disability" name="disability" class="inputbox" style="width:200px;">
                                        <option value="">----</option>
                                        <option value="No" <?php if ($this->data['eeoDisabilityStatus'] == 'No') echo('selected'); ?>>No</option>
                                        <option value="Yes" <?php if ($this->data['eeoDisabilityStatus'] == 'Yes') echo('selected'); ?>>Yes</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                    </table>
                <?php endif; ?>
                </td>
                

                <table class="editTable"  width="100%">
                    <tr>
                        <td class="tdVertical">
                            <label id="currentPayLabel" for="currentEmployer">Current Pay:</label>
                        </td>
                        <td class="tdData">
                            $ <input type="text" name="currentPay" id="currentPay" value="<?php $this->_($this->data['currentPay']); ?>" class="inputbox" style="width: 50px" />/hr OR <input type="text" name="currentPaySal" id="currentPaySal" value="<?php $this->_($this->data['currentPaySal']); ?>" class="inputbox" style="width: 50px" />/yr
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="desiredPayLabel" for="currentEmployer">Desired Pay:</label>
                        </td>
                        <td class="tdData">
                           $ <input type="text" name="desiredPay" id="desiredPay" value="<?php $this->_($this->data['desiredPay']); ?>" class="inputbox" style="width: 50px" />/hr  OR <input type="text" name="desiredPaySal" id="desiredPaySal" value="<?php $this->_($this->data['desiredPaySal']); ?>" class="inputbox" style="width: 50px" />/yr
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
                                <?php echo($this->extraFieldRS[$i]['editHTML']); ?>
                            </td>
                        </tr>
                    <?php endfor; ?>

                    <tr>
                        <td class="tdVertical">
                            <label id="canRelocateLabel" for="canRelocate">Can Relocate:</label>
                        </td>
                        <td class="tdData">
                            <input type="radio" id="canRelocate" name="canRelocate"<?php if ($this->data['canRelocate'] == 1): ?> checked<?php endif; ?> /> Yes
                            <input type="radio" id="canRelocate" name="canRelocate"<?php if ($this->data['canRelocate'] == 0): ?> checked<?php endif; ?> /> No
                        </td>
                    </tr>


                    <tr>
                        <td class="tdVertical">
                            <label id="dateAvailableLabel" for="dateAvailable">Date Available:</label>
                        </td>
                        <td class="tdData">
                            <?php if (!empty($this->data['dateAvailable'])): ?>
                                <script type="text/javascript">DateInput('dateAvailable', false, 'MM-DD-YY', '<?php echo($this->data['dateAvailableMDY']); ?>', -1);</script>
                            <?php else: ?>
                                <script type="text/javascript">DateInput('dateAvailable', false, 'MM-DD-YY', '', -1);</script>
                            <?php endif; ?>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <!-- <label id="currentEmployerLabel" for="currentEmployer">Current Employer:</label>-->
                        </td>
                        <td class="tdData">
                            <input type="hidden" class="inputbox" id="currentEmployer" name="currentEmployer" value="<?php $this->_($this->data['currentEmployer']); ?>" style="width: 150px;" />
                    </tr>

                   <tr>
                        <td class="tdVertical">
                            <label id="sourceLabel" for="sourceSelect">Source:</label>
                        </td>
                        <td class="tdData">
<?php if ($this->isModal): ?>
                            <select id="sourceSelect" class="sourceSelect" tabindex="<?php echo($tabIndex++); ?>" name="source" class="inputbox" style="width: 150px;"   onchange="sourcechange('source',this.selectedIndex);">
<?php else: ?>
                            <select id="sourceSelect" class="sourceSelect"  tabindex="<?php echo($tabIndex++); ?>" name="source" class="inputbox" style="width: 150px;" onchange="if (this.value == 'edit') { listEditor('Sources', 'sourceSelect', 'sourceCSV', false); this.value = '(none)'; } if (this.value == 'nullline') { this.value = '(none)'; }">
                                <option value="edit">(Edit Sources)</option>
                                <option value="nullline">-------------------------------</option>
<?php endif; ?>
                                    <option value="(none)" <?php if (!isset($this->preassignedFields['source'])): ?>selected="selected"<?php endif; ?>>(None)</option>
                                    <?php if (isset($this->preassignedFields['source'])): ?>
                                        <option value="<?php $this->_($this->_($this->preassignedFields['source'])); ?>" selected="selected"><?php $this->_($this->_($this->preassignedFields['source'])); ?></option>
                                    <?php endif; ?>
                                <?php foreach ($this->sourcesRS AS $index => $source): ?>
                                    <option value="<?php $this->_($source['name']); ?>"
                                    <?php if ($source['name'] == $this->data['source']){ echo " selected";} ?>><?php $this->_($source['name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <input type="hidden" id="sourceCSV" name="sourceCSV" value="<?php $this->_($this->sourcesString); ?>" />
                        </td>
                    </tr>
                    <tr class="supplierBlock">
                                    <td class="tdVertical">
                                        <label id="supplierIDLabel" for="supplierID">Supplier:</label>
                                    </td>
                                    <td class="tdData">
                                    <select tabindex="36" id="supplierID" name="supplierID" class="inputbox" style="width: 150px;">
                                    <option value="">(Select a Supplier)</option>

                                    <?php foreach ($this->suppliersRS as $rowNumber => $suppliersData): ?>
                                        <?php if ($suppliersData['supplierID'] == $this->data['supplierID']): ?>
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
                                    <option value="">(Select a Supplier Contacts)</option>                                                              <?php foreach ($this->supplierscontactsRS as $rowNumber => $supplierscontactsData): ?>
                                        <?php
                                        //print_r($supplierscontactsData);
                                         if ($supplierscontactsData['suppliercontactID'] == $this->data['suppliercontactID']): ?>
                                            <option selected value="<?php $this->_($supplierscontactsData['suppliercontactID']) ?>"><?php $this->_($supplierscontactsData['firstName']) ?> <?php $this->_($supplierscontactsData['lastName']) ?></option>
                                        <?php else: ?>
                                            <option value="<?php $this->_($supplierscontactsData['suppliercontactID']) ?>"><?php $this->_($supplierscontactsData['firstName']) ?> <?php $this->_($supplierscontactsData['lastName']) ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?> 
                                    </select>&nbsp;*
                                    
                                        

                               
                                    </td>
                    </tr> 

                    <tr>
                        <td class="tdVertical">
                           <label id="keySkillsLabel" for="keySkills">Key Skills:</label>
                        </td>
                        <td class="tdData"><label id="keySkillsLabel" for="keySkills"></label>
                            <input type="text" class="inputbox" id="keySkills" name="keySkills" value="<?php $this->_($this->data['keySkills']); ?>" style="width: 400px;" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="otherSkillsLabel" for="otherSkills">Other Skills:</label>
                        </td>
                        <td class="tdData"><label id="otherSkillsLabel" for="otherSkills"></label>
                            <input type="text" class="inputbox" tabindex="<?php echo($tabIndex++); ?>" name="otherSkills" id="otherSkills" style="width: 400px;" value="<?php $this->_($this->data['otherSkills']); ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical">
                            <label id="notesLabel" for="notes">Misc. Notes:</label>
                        </td>
                        <td class="tdData">
                            <textarea class="inputbox" id="notes" name="notes" rows="5" style="width: 400px;"><?php $this->_($this->data['notes']); ?></textarea>
                        </td>
                    </tr>
                </table>

                </td></tr></tbody></table>

                <input type="submit" class="button" name="submit" id="submit" value="Save" />&nbsp;
                <input type="reset"  class="button" name="reset"  id="reset"  value="Reset" onclick="resetFormForeign();" />&nbsp;
                <input type="button" class="button" name="back"   id="back"   value="Back to Details" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=show&amp;candidateID=<?php echo($this->candidateID); ?>');" />
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
$(".supplierBlock").hide();	
<?php if($this->data['source']=="Supplier"){?>
	$(".supplierBlock").show();	
<?php }?> 
var ac=$('[name="extraField0"]:checked').val();
if(ac=="NO"){
        $("#extraFieldTd1").hide();
		$("#extraFieldData1").hide();	
} else if(ac=="YES"){
	    $("#extraFieldTd1").show();
		$("#extraFieldData1").show();  
}

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

$( "#sourceSelect" ).change(function() {
	//var option_str = document.getElementById(state_id);
	//alert(type_ndex);
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
	}
});
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
print_country("country");
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
            <script type="text/javascript">
                document.editCandidateForm.firstName.focus();
            </script>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>