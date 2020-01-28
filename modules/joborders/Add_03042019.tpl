<?php /* $Id: Add.tpl 3810 2007-12-05 19:13:25Z brian $ */ ?>
<?php TemplateUtility::printHeader('Job Orders', array('modules/joborders/validator.js','js/countries.js' ,  'js/company.js', 'js/supplier.js', 'js/sweetTitles.js', 'js/suggest.js', 'js/joborder.js', 'js/lib.js', 'js/listEditor.js', 'tinymce')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/job_orders.gif" width="24" height="24" border="0" alt="Job Orders" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Job Orders: Add Job Order</h2></td>
                </tr>
            </table>

            <p class="note">Add a new job order to the system.</p>

            <?php if ($this->noCompanies): ?>
                <table style="margin-top: 8px; width: 50%;" class="selectView">
                    <tr>
                        <td>
                            <span><span class="bold">You have not added any companies yet.</span> You can't add a job order until
                            you add at least one company. Please go to the <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=companies">Companies</a>
                            module and add a company.</span>
                        </td>
                    </tr>
                </table>
            <?php else: ?>
                <form name="addJobOrderForm" id="addJobOrderForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=add" method="post" onsubmit="return checkAddForm(document.addJobOrderForm);" autocomplete="off">
                    <input type="hidden" name="postback" id="postback" value="postback" />


                    <table>
                    <tbody><tr>
                        <td width="50%" height="100%" valign="top">
                            <p class="noteUnsized">Job Information</p>

                            <table class="editTable" width="100%">
                                <tbody>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="hotLabel" for="title">Hot:</label>
                                    </td>
                                    <td class="tdData">
                                       <input type="checkbox" tabindex="1" id="isHot" name="isHot" />&nbsp;
                                <img title="Checking this box indicates that the job order is 'hot', and shows up highlighted throughout the system." src="images/information.gif" alt="" width="16" height="16" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                       <label id="jobstatusLabel" for="jobstatus">Job Status : </label> 
                                    </td>
                                    <td class="tdData">
                                       <input type="checkbox" tabindex="38" id="public" name="public" onchange="checkPublic(this);" onclick="checkPublic(this);" onkeydown="checkPublic(this);" />&nbsp;Public 
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
                                            <option value="Engineering">Engineering</option>
                                            <option value="Health">Health</option>
                                            <option value="Technology">Technology</option>
                                            <option value="Manufacturing">Manufacturing</option>
                                            <option value="Financial">Financial</option>
                                            <option value="Administrative">Administrative</option>
                                            <option value="Hospitality">Hospitality</option>
                                   
                                </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="titleLabel" for="title">Title:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" tabindex="1" class="inputbox" id="title" name="title" style="width: 150px;" <?php if(isset($this->jobOrderSourceRS['title'])): ?>value="<?php $this->_($this->jobOrderSourceRS['title']); ?>"<?php endif; ?> />&nbsp;*
                                    </td>
                                </tr>

                                                                                                
                               <tr>
                                    <td class="tdVertical">
                                      <label id="startDateLabel" for="startDate">Posted Date:</label>  
                                    </td>
                                    <td class="tdData">
                                       <script type="text/javascript">DateInput('startDate', false, 'MM-DD-YY', '', 8);</script> 
                                    </td>
                                </tr>
                                
                                 
                               <tr>
                                    <td class="tdVertical">
                                       <label id="startDateLabel" for="startDate">Expiration Date:</label> 
                                    </td>
                                    <td class="tdData">
                                       <script type="text/javascript">DateInput('endDate', false, 'MM-DD-YY', '', 8);</script> 
                                    </td>
                                </tr>
                                
                                 
                               <tr>
                                    <td class="tdVertical">
                                      <label id="openingsLabel" for="openings">Job Openings:</label>  
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="4" class="inputbox" id="openings" name="openings" style="width: 50px;" <?php if(isset($this->jobOrderSourceRS['openings'])): ?>value="<?php $this->_($this->jobOrderSourceRS['openings']); ?>"<?php else: ?>value="1"<?php endif; ?>/>&nbsp;* 
                                    </td>
                                </tr>
                                
                                 
                               <tr>
                                    <td class="tdVertical">
                                       <label id="descriptionLabel" for="description">Description:</label> 
                                    </td>
                                    <td class="tdData">
                                      <textarea tabindex="5" class="mceEditor" name="description" id="description" rows="21" style="width: 500px;"><?php if(isset($this->jobOrderSourceRS['description'])): ?><?php $this->_($this->jobOrderSourceRS['description']); ?><?php endif; ?></textarea>  
                                    </td>
                                </tr>
                                <tr>
                            <td class="tdVertical">
                                <label id="notesLabel" for="notes">Internal Notes:</label>
                            </td>
                            <td class="tdData">
                                <textarea tabindex="6" class="mceEditor" name="notes" id="notes" rows="5" style="width: 500px;"><?php if(isset($this->jobOrderSourceRS['notes'])): ?><?php $this->_($this->jobOrderSourceRS['notes']); ?><?php endif; ?></textarea>
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
                                        
                                    </td>
                                    <td class="tdData">
                                        
                                    </td>
                                </tr>
                            </tbody></table>
                        </td>

                        <td width="50%" height="100%" valign="top">                        <p class="noteUnsized">Client</p>                             <table class="editTable" width="100%">                                <tbody>                                <tr>                                    <td class="tdVertical">                                        <label id="CustIDLabel" for="custID">Client Company:</label>                                    </td>                                    <td class="tdData">									    <select tabindex="10" id="custCompID" name="custCompID" class="inputbox" style="width: 150px;">																			    <option value="0">(Select a Customer)</option>																				    <?php foreach ($this->custCompRS as $rowNumber => $custCompData): ?>																				          <option value="<?php $this->_($custCompData['implCompanyID']) ?>"><?php $this->_($custCompData['CompanyName']) ?></option>  																				    <?php endforeach; ?>																			</select>&nbsp;*                                    </td>                                </tr>                                <tr>                                    <td class="tdVertical">                                        <label id="CustIDLabel" for="custID">Work Location:</label>                                    </td>                                    <td class="tdData">									    <select tabindex="10" id="custCompID" name="custCompID" class="inputbox" style="width: 150px;">																			    <option value="0">(Select a Work Location)</option>																				    <?php foreach ($this->custCompLocRS as $rowNumber => $custCompLocData): ?>																				          <option value="<?php $this->_($custCompLocData['CompLocID']) ?>"><?php $this->_($custCompLocData['CompanyAdd']) ?></option>  																				    <?php endforeach; ?>																			</select>&nbsp;*                                    </td>                                </tr>                                <!--<tr>                                    <td class="tdVertical">                                        <label id="departmentLabel" for="department">Department:</label>                                    </td>                                    <td class="tdData">                                        <select id="departmentSelect" name="department" class="inputbox" style="width: 150px;" onchange="if (this.value == 'edit') { listEditor('Departments', 'departmentSelect', 'departmentsCSV', false); this.value = '(none)'; } if (this.value == 'nullline') { this.value = '(none)'; }">                                    <option value="(none)" selected="selected">None</option>                                </select>                                <input type="hidden" id="departmentsCSV" name="departmentsCSV" value="<?php if ($this->selectedCompanyID !== false): $this->_($this->selectedDepartmentsString); endif; ?>" />                                <?php if ($this->selectedCompanyID !== false): ?>                                    <script type="text/javascript">listEditorUpdateSelectFromCSV('departmentSelect', 'departmentsCSV', true, false);</script>                                <?php endif; ?>                                    </td>                                </tr>-->                           <!--<tr>                            <td class="tdVertical">                                <label id="contactIDLabel" for="contactID">Contact:</label>                            </td>                            <td class="tdData">                                <select tabindex="9" id="contactID" name="contactID" class="inputbox" style="width: 150px;">                                    <option value="-1">None</option>                                    <?php if ($this->selectedCompanyID !== false): ?>                                        <?php foreach ($this->selectedCompanyContacts as $rowNumber => $contactsData): ?>                                            <option value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>                                        <?php endforeach; ?>                                    <?php endif; ?>                                </select>&nbsp;                                <img src="images/indicator2.gif" id="contactsIndicator" alt="" style="visibility: hidden; margin-left: 5px;" height="16" width="16" />                            </td>                            </tr>-->                                <tr>                                    <td class="tdVertical">                                       <label id="AddressLabel" for="Address">Address:</label>                                     </td>                                    <td class="tdData">                                       <input type="text" tabindex="10"  value="" class="inputbox" id="AddressID" name="JobAddress" style="width: 150px; " />                                     </td>                                </tr>                                <tr>                                    <td class="tdVertical">                                       <label id="stateLabel" for="state">Country:</label>                                     </td>                                    <td class="tdData">                                       <select  tabindex="11"  style="width: 150px"  onchange="print_state('state',this.selectedIndex);"	                         id="country" class="inputbox"  name ="country"></select>                                    </td>                                </tr>                                <tr>                                    <td class="tdVertical">                                         <label id="stateLabel" for="state">State:</label>                                    </td>                                    <td class="tdData">                                       <?php if ($this->selectedCompanyID !== false): ?>                                    <select  tabindex="11" name ="state" id ="state"  class="inputbox" ></select>                                    <!--input type="text" tabindex="5" class="inputbox" id="state" name="state" value="<?php $this->_($this->selectedCompanyLocation['state']); ?>" style="width: 150px;" /-->&nbsp;*                                <?php else: ?>                                    <select  tabindex="12" name ="state" id ="state"  class="inputbox" ></select>                                    <!--input type="text" tabindex="5" class="inputbox" id="state" name="state" style="width: 150px;" /-->&nbsp;*                                <?php endif; ?>                                    </td>                                </tr>                                <tr>                                    <td class="tdVertical">                                        <label id="cityLabel" for="city">City:</label>                                    </td>                                    <td class="tdData">                                       <?php if ($this->selectedCompanyID !== false): ?>                                    <input type="text" tabindex="13" class="inputbox" id="city" name="city" value="<?php $this->_($this->selectedCompanyLocation['city']); ?>" style="width: 150px;" />&nbsp;*                                <?php else: ?>                                    <input type="text" tabindex="14" class="inputbox" id="city" name="city" style="width: 150px;" />&nbsp;*                                <?php endif; ?>                                    </td>                                </tr>                                <tr>                                    <td class="tdVertical">                                        <label id="zipLabel" for="zip">Zip:</label>                                    </td>                                    <td class="tdData">                                       <input type="text" tabindex="15" class="inputbox" id="zip" name="zip" style="width: 150px;" />&nbsp;                                    </td>                                </tr>                                <tr>                                    <td class="tdVertical">                                                                            </td>                                    <td class="tdData">                                                                           </td>                                </tr>                            </tbody></table>                        
                        <p class="noteUnsized">Implemenation Partner</p>
                             <table class="editTable" width="100%">
                                <tbody>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="companyIDLabel" for="companyID">Company:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="hidden" name="companyID" id="companyID" value="<?php if ($this->selectedCompanyID === false) { if (isset($this->jobOrderSourceRS['companyID'])) { echo ($this->jobOrderSourceRS['companyID']); } else { echo(0); } } else { echo($this->selectedCompanyID); } ?>" />

                                <?php if ($this->defaultCompanyID !== false): ?>
                                    <input type="radio" name="typeCompany" checked onchange="document.getElementById('companyName').disabled = false; if (oldCompanyID != -1) document.getElementById('companyID').value = oldCompanyID;">
                                    <input type="text" name="companyName" id="companyName" tabindex="7" value="<?php if ($this->selectedCompanyID !== false) { $this->_($this->companyRS['name']); } ?><?php if(isset($this->jobOrderSourceRS['companyName']) && $this->selectedCompanyID == false ): ?><?php $this->_($this->jobOrderSourceRS['companyName']); ?><?php endif; ?>" class="inputbox" style="width: 125px" onFocus="suggestListActivate('getCompanyNames', 'companyName', 'CompanyResults', 'companyID', 'ajaxTextEntryHover', 0, '<?php echo($this->sessionCookie); ?>', 'helpShim');" <?php if ($this->selectedCompanyID !== false) { echo('disabled'); } ?>/>&nbsp;*
                                <?php else: ?>
                                    <input type="text" name="companyName" id="companyName" tabindex="8" value="<?php if ($this->selectedCompanyID !== false) { $this->_($this->companyRS['name']); } ?><?php if(isset($this->jobOrderSourceRS['companyName']) && $this->selectedCompanyID == false ): ?><?php $this->_($this->jobOrderSourceRS['companyName']); ?><?php endif; ?>" class="inputbox" style="width: 150px" onFocus="suggestListActivate('getCompanyNames', 'companyName', 'CompanyResults', 'companyID', 'ajaxTextEntryHover', 0, '<?php echo($this->sessionCookie); ?>', 'helpShim');" <?php if ($this->selectedCompanyID !== false) { echo('disabled'); } ?>/>&nbsp;*
                                <?php endif; ?>
                                <br />
                                <iframe id="helpShim" src="javascript:void(0);" scrolling="no" frameborder="0" style="position:absolute; display:none;"></iframe>
                                <div id="CompanyResults" class="ajaxSearchResults"></div>

                                <?php if ($this->defaultCompanyID !== false): ?>
                                    <input type="radio" name="typeCompany" id="defaultCompany" onchange="if(document.getElementById('companyName').disabled == false && document.getElementById('companyID').value > 0) {oldCompanyID = document.getElementById('companyID').value; } else if(document.getElementById('companyName').disabled == false) { oldCompanyID = 0; } document.getElementById('companyName').disabled = true; document.getElementById('companyID').value = '<?php echo($this->defaultCompanyID); ?>'; ">&nbsp;Internal Posting<br />
                                <?php endif; ?>

                                <script type="text/javascript">oldCompanyID = -1; watchCompanyIDChangeJO('<?php echo($this->sessionCookie); ?>');</script>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="departmentLabel" for="department">Department:</label>
                                    </td>
                                    <td class="tdData">
                                        <select id="departmentSelect" name="department" class="inputbox" style="width: 150px;" onchange="if (this.value == 'edit') { listEditor('Departments', 'departmentSelect', 'departmentsCSV', false); this.value = '(none)'; } if (this.value == 'nullline') { this.value = '(none)'; }">
                                    <option value="(none)" selected="selected">None</option>
                                </select>
                                <input type="hidden" id="departmentsCSV" name="departmentsCSV" value="<?php if ($this->selectedCompanyID !== false): $this->_($this->selectedDepartmentsString); endif; ?>" />
                                <?php if ($this->selectedCompanyID !== false): ?>
                                    <script type="text/javascript">listEditorUpdateSelectFromCSV('departmentSelect', 'departmentsCSV', true, false);</script>
                                <?php endif; ?>
                                    </td>
                                </tr>
                           <tr>
                            <td class="tdVertical">
                                <label id="contactIDLabel" for="contactID">Contact:</label>
                            </td>
                            <td class="tdData">
                                <select tabindex="9" id="contactID" name="contactID" class="inputbox" style="width: 150px;">
                                    <option value="-1">None</option>

                                    <?php if ($this->selectedCompanyID !== false): ?>
                                        <?php foreach ($this->selectedCompanyContacts as $rowNumber => $contactsData): ?>
                                            <option value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </select>&nbsp;
                                <img src="images/indicator2.gif" id="contactsIndicator" alt="" style="visibility: hidden; margin-left: 5px;" height="16" width="16" />
                            </td>
                            </tr>
                                <tr>
                                    <td class="tdVertical">
                                       <label id="AddressLabel" for="Address">Address:</label> 
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="10"  value="" class="inputbox" id="AddressID" name="JobAddress" style="width: 150px; " /> 
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                       <label id="stateLabel" for="state">Country:</label> 
                                    </td>
                                    <td class="tdData">
                                       <select  tabindex="11"  style="width: 150px"  onchange="print_state('state',this.selectedIndex);"
	                         id="country" class="inputbox"  name ="country"></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                         <label id="stateLabel" for="state">State:</label>
                                    </td>
                                    <td class="tdData">
                                       <?php if ($this->selectedCompanyID !== false): ?>
                                    <select  tabindex="11" name ="state" id ="state"  class="inputbox" ></select>
                                    <!--input type="text" tabindex="5" class="inputbox" id="state" name="state" value="<?php $this->_($this->selectedCompanyLocation['state']); ?>" style="width: 150px;" /-->&nbsp;*
                                <?php else: ?>
                                    <select  tabindex="12" name ="state" id ="state"  class="inputbox" ></select>
                                    <!--input type="text" tabindex="5" class="inputbox" id="state" name="state" style="width: 150px;" /-->&nbsp;*
                                <?php endif; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="cityLabel" for="city">City:</label>
                                    </td>
                                    <td class="tdData">
                                       <?php if ($this->selectedCompanyID !== false): ?>
                                    <input type="text" tabindex="13" class="inputbox" id="city" name="city" value="<?php $this->_($this->selectedCompanyLocation['city']); ?>" style="width: 150px;" />&nbsp;*
                                <?php else: ?>
                                    <input type="text" tabindex="14" class="inputbox" id="city" name="city" style="width: 150px;" />&nbsp;*
                                <?php endif; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="zipLabel" for="zip">Zip:</label>
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="15" class="inputbox" id="zip" name="zip" style="width: 150px;" />&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                        
                                    </td>
                                    <td class="tdData">
                                       
                                    </td>
                                </tr>
                            </tbody></table>

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
                                    <option value="C"   <?php if(isset($this->jobOrderSourceRS['type']) && $this->jobOrderSourceRS['type'] == 'C') echo('selected'); ?>>C (Contract)</option>    
                                    <option value="C2H" <?php if(isset($this->jobOrderSourceRS['type']) && $this->jobOrderSourceRS['type'] == 'C2H') echo('selected'); ?>>C2H (Contract to Hire)</option>
                                    <option value="H"   <?php if(isset($this->jobOrderSourceRS['type']) && ($this->jobOrderSourceRS['type'] == 'H' || $this->jobOrderSourceRS['type'] == 'DH')) echo('selected'); ?>>DH (Direct Hire)</option>
                                    <!--option value="FL"  <?php if(isset($this->jobOrderSourceRS['type']) && $this->jobOrderSourceRS['type'] == 'FL') echo('selected'); ?>>FL (Freelance)</option-->
                                </select>&nbsp;*
                                    </td>
                                </tr>
                               
                               <tr class="CON CH Contr">
                                    <td class="tdVertical">
                                      <label id="maxRateLabel" for="maxRate">Bill Rate:</label>  
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="29" maxlength="10" class="inputbox" id="minRate" name="minRate" style="width: 50px;" <?php if(isset($this->jobOrderSourceRS['minRate'])): ?>value="<?php $this->_($this->jobOrderSourceRS['maxRate']); ?>"<?php endif; ?>/><b>/hour</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="29" maxlength="10" class="inputbox" id="maxRate" name="maxRate" style="width: 50px;" <?php if(isset($this->jobOrderSourceRS['maxRate'])): ?>value="<?php $this->_($this->jobOrderSourceRS['maxRate']); ?>"<?php endif; ?>/><b>/hour</b> </td>
                                </tr>
                                
                                    
                               <tr class="CON CH Contr">
                                    <td class="tdVertical">
                                       <label id="payrateLabel" for="Payrate">Pay Rate:</label>
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="30" maxlength="10"  class="inputbox" id="minpayRate" name="minpayRate" style="width: 50px;" <?php if(isset($this->jobOrderSourceRS['minpayRate'])): ?>value="<?php $this->_($this->jobOrderSourceRS['minpayRate']); ?>"<?php endif; ?>/><b>/hour</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="30" maxlength="10"  class="inputbox" id="payRate" name="payRate" style="width: 50px;" <?php if(isset($this->jobOrderSourceRS['payRate'])): ?>value="<?php $this->_($this->jobOrderSourceRS['payRate']); ?>"<?php endif; ?>/><b>/hour</b>      </td>
                                </tr>
                                
                                <tr class="CON CH Contr">
                                    <td class="tdVertical">
                                       <label id="payrateLabel" for="Payrate"></label>
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="30" maxlength="10"  class="inputbox" id="minsalary" name="minsalary" style="width: 100px;" <?php if(isset($this->jobOrderSourceRS['minsalary'])): ?>value="<?php $this->_($this->jobOrderSourceRS['minsalary']); ?>"<?php endif; ?>/><b>Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="13" class="inputbox" id="salary" name="salary" maxlength="10"   style="width: 100px;" <?php if(isset($this->jobOrderSourceRS['salary'])): ?>value="<?php $this->_($this->jobOrderSourceRS['salary']); ?>"<?php endif; ?>/><b>Salary Yearly</b> 
                                    </td>
                                </tr>
                                
                                <tr class="CON CH Contr">
                                    <td class="tdVertical">
                                       <label id="durationLabel" for="duration">Duration:</label> 
                                    </td>
                                    <td class="tdData">
                                       <select tabindex="31" id="duration" name="duration" class="inputbox" style="width: 150px;">
                                
                                    <option value="0-3 months"<?php if ($this->jobOrderSourceRS['duration'] == '0-3 months'){ ?> selected="selected"<?php }?>>0-3 months</option>                                   
                                                                    
                                    <option value="0-6 months"<?php if ($this->jobOrderSourceRS['duration'] == '0-6 months'){ ?>  selected="selected"<?php }?>>0-6 months</option>                                    
                                                                    
                                    <option value="6-12 months" <?php if ($this->jobOrderSourceRS['duration'] == '6-12 months'){ ?>selected="selected"<?php }?>>6-12 months</option>
                                                                   
                                    <option value="1-2 years" <?php if ($this->jobOrderSourceRS['duration'] == '1-2 years'){ ?> selected="selected"<?php }?>>1-2 years</option>
                                
                                    <option value="N/A" <?php if ($this->jobOrderSourceRS['duration'] == '1-2 years'){ ?>selected="selected"<?php }?>>N/A</option>
                                    
                                
                            </select>
                                    </td>
                                </tr>
                                <tr class="CH Contr">
                                    <td class="tdVertical">
                                       <label id="benefitsyLabel" for="benefits">Benefits:</label> 
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="34" class="inputbox" id="benefits" name="benefits" style="width: 90%;" <?php if(isset($this->jobOrderSourceRS['benefits'])): ?>value="<?php $this->_($this->jobOrderSourceRS['benefits']); ?>"<?php endif; ?>/>
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
                                        <b>Min $</b><input type="text" tabindex="32" maxlength="10"  class="inputbox" id="mincurrentpayRate" name="mincurrentpayRate" style="width: 50px;" <?php if(isset($this->jobOrderSourceRS['mincurrentpayRate'])): ?>value="<?php $this->_($this->jobOrderSourceRS['mincurrentpayRate']); ?>"<?php endif; ?>/><b>/hour</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="32" maxlength="10"  class="inputbox" id="currentpayRate" name="currentpayRate" style="width: 50px;" <?php if(isset($this->jobOrderSourceRS['currentpayRate'])): ?>value="<?php $this->_($this->jobOrderSourceRS['currentpayRate']); ?>"<?php endif; ?>/><b>/hour</b>
                                    </td>
                                </tr>
                                
                                 <tr class="CH DH Contr">
                                    <td class="tdVertical">
                                       <label id="currentpayrateLabel" for="Payrate"></label>
                                    </td>
                                    <td class="tdData">
                                        <b>Min $</b><input type="text" tabindex="32" maxlength="10"  class="inputbox" id="mincurrentpayRateSal" name="mincurrentpayRateSal" style="width: 100px;" <?php if(isset($this->jobOrderSourceRS['mincurrentpayRateSal'])): ?>value="<?php $this->_($this->jobOrderSourceRS['mincurrentpayRateSal']); ?>"<?php endif; ?>/><b>Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><input type="text" tabindex="32" maxlength="10"  class="inputbox" id="currentpayRateSal" name="currentpayRateSal" style="width: 100px;" <?php if(isset($this->jobOrderSourceRS['currentpayRateSal'])): ?>value="<?php $this->_($this->jobOrderSourceRS['currentpayRateSal']); ?>"<?php endif; ?>/><b>Salary Yearly</b>
                                    </td>
                                </tr>
                                
                                 
                                <tr class="CH DH Contr">
                                    <td class="tdVertical">
                                       <label id="benefitsyLabel" for="benefits"><span class="CH Contr">Client </span>Benefits:</label> 
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="34" class="inputbox" id="clientbenefits" name="clientbenefits" style="width: 90%;" <?php if(isset($this->jobOrderSourceRS['clientbenefits'])): ?>value="<?php $this->_($this->jobOrderSourceRS['clientbenefits']); ?>"<?php endif; ?>/>
                                    </td>
                                </tr>
                                <tr class="DH Contr">
                                    <td class="tdVertical">
                                       <label id="OurfeeLabel" for="ourfee">Our fee:</label> 
                                    </td>
                                    <td class="tdData">
                                       <input type="text" tabindex="35" maxlength="10" class="inputbox" id="ourfee_percent" name="ourfee_percent" style="width: 50px;" <?php if(isset($this->jobOrderSourceRS['ourfee_percent'])): ?>value="<?php $this->_($this->jobOrderSourceRS['ourfee_percent']); ?>"<?php endif; ?>/><b>%&nbsp;&nbsp;Or&nbsp;&nbsp;
                                      Fixed Amount $</b><input type="text" tabindex="35" maxlength="10" class="inputbox" id="ourfee" name="ourfee" style="width: 100px;" <?php if(isset($this->jobOrderSourceRS['ourfee'])): ?>value="<?php $this->_($this->jobOrderSourceRS['ourfee']); ?>"<?php endif; ?>/>
                                    </td>
                                </tr>
                                <tr>
                            <td class="tdVertical">
                                <label id="notesLabel" for="notes">Notes:</label>
                            </td>
                            <td class="tdData">
                                <textarea tabindex="6" class="mceEditor" name="hirenotes" id="hirenotes" rows="5" style="width: 100%;"><?php if(isset($this->jobOrderSourceRS['hirenotes'])): ?><?php $this->_($this->jobOrderSourceRS['hirenotes']); ?><?php endif; ?></textarea>
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
                                       <select tabindex="36" id="recruiter" name="recruiter" class="inputbox" style="width: 150px;">
                                    <option value="">(Select a User)</option>                                    <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>
                                        <?php if ($usersData['userID'] == $this->userID): ?>
                                            <option selected value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                        <?php else: ?>
                                            <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>&nbsp;*
                                    </td>
                                </tr> 
                                <tr>
                                    <td class="tdVertical">
                                       <label id="ownerLabel" for="owner">Assignee:</label> 
                                    </td>
                                    <td class="tdData">
                                        <select tabindex="37" id="owner" name="owner" class="inputbox" style="width: 150px;">
                                    <option value="">(Select a User)</option>

                                    <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>
                                        <?php if ($usersData['userID'] == $this->userID): ?>
                                            <option selected value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                        <?php else: ?>
                                            <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>&nbsp;*
                                    </td>
                                </tr>
                                
                                
                            </tbody></table>

                        </td>
                    </tr>
                </tbody></table>

<p class="noteUnsized">Website Posting</p>                  
<table class="editTable" width="100%">
                    <tr>
                        <td class="tdVertical">
                            <label id="pubtitleLabel" for="title">Public Title:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="39" class="inputbox" id="pubtitle" name="pubtitle" value="" style="width: 90%;" />&nbsp;*
                        </td></tr>

                       

                        <tr>
                            <td class="tdVertical">
                                <label id="pdescriptionLabel" for="pdescription">Description:</label>
                            </td>
                            <td class="tdData">
                                <textarea tabindex="40" class="mceEditor" name="pdescription" id="pdescription" rows="15" style="width: 90%;"><?php if(isset($this->jobOrderSourceRS['pdescription'])): ?><?php $this->_($this->jobOrderSourceRS['pdescription']); ?><?php endif; ?></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdVertical">
                                <label id="DisclaimerLabel" for="Disclaimer">Disclaimer:</label>
                            </td>
                            <td class="tdData">
                                <input type="checkbox" tabindex="41" id="disclaimer" name="disclaimer"/>&nbsp;Posted information in job title and job description must not contain any client information including the bill rates and job IDs. Please review the information before adding the job order. </td>
                        </tr>  
                        

                        <tr id="displayQuestionnaires" style="display: none;">
                            <?php if ($this->careerPortalEnabled): ?>
                            <td class="tdVertical">
                                <label id="notesLabel" for="notes">Questionnaire:</label>
                            </td>
                            <td class="tdData">
                                <select id="questionnaire" tabindex="42"  name="questionnaire" class="inputbox" style="width: 500px;">
                                <option value="none" selected>None</option>
                                <?php foreach ($this->questionnaires as $questionnaire): ?>
                                    <option value="<?php echo $questionnaire['questionnaireID']; ?>"><?php echo $questionnaire['title']; ?></option>
                                <?php endforeach; ?>
                                </select>
                                <?php if ($_SESSION['CATS']->getAccessLevel() >= ACCESS_LEVEL_SA): ?>
                                <br />
                                <a href="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalSettings" target="_blank">Add / Edit / Delete Questionnaires</a>
                                <?php endif; ?>
                            </td>
                            <?php endif; ?>
                        </tr>
                    </table>
                    <input type="submit" tabindex="43" class="button" name="submit" value="Add Job Order" />&nbsp;
                    <input type="reset"  tabindex="44" class="button" name="reset"  value="Reset" />&nbsp;
                    <input type="button" tabindex="45" class="button" name="back"   value="Back to Job Orders" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=listByView');" />
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
	//print_state("sstate", 239);
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
        $(".DH").hide();
		$(".CH").hide();
		$(".CON").show();

print_country("country");
//print_country("scountry");
function output(json){

        var Data = eval('(' + json + ')');
        var html = '';
        //alert(Data.length);
        for(var i=0;i<Data.length;i++){
            html += 'name' + Data[i].name + 'age' + Data[i].age;
        }

        document.getElementById('div1').innerHTML = html;
        document.getElementById('div2').innerHTML = Data[0].name;
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

</script>
                <script type="text/javascript">
                    document.addJobOrderForm.title.focus();
                    <?php if (isset($this->jobOrderSourceRS['companyID'])): ?>updateCompanyData('<?php echo($this->sessionCookie); ?>');<?php endif; ?>
                </script>

            <?php endif; ?>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
