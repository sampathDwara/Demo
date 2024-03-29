<?php /* $Id: Edit.tpl 3093 2007-09-24 21:09:45Z brian $ */ ?>
<?php TemplateUtility::printHeader('SuppliersContacts', array('modules/supplierscontacts/validator.js', 'js/sweetTitles.js', 'js/suggest.js', 'js/listEditor.js',  'js/supplierscontact.js', 'js/supplier.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>
 
        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/supplierscontact.gif" width="24" height="24" border="0" alt="SuppliersContacts" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>SuppliersContacts: Edit Contact</h2></td>
                </tr>
            </table>

            <form name="editContactForm" id="editContactForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=edit" method="post" onsubmit="return checkEditForm(document.editContactForm);" autocomplete="off">
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" name="suppliercontactID" id="suppliercontactID" value="<?php echo($this->suppliercontactID); ?>" />

                <table>
                    <tr>
                        <td width="50%" height="100%" valign="top">
                            <p class="noteUnsized">Basic Information</p>

                            <table class="editTable" width="100%" height="285">
                                <tr>
                                    <td class="tdVertical">
                                        <label id="firstNameLabel" for="firstName">First Name:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="firstName" id="firstName" value="<?php $this->_($this->data['firstName']); ?>" class="inputbox" style="width: 150px" />&nbsp;*
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="lastNameLabel" for="lastName">Last Name:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="lastName" id="lastName" value="<?php $this->_($this->data['lastName']); ?>" class="inputbox" style="width: 150px" />&nbsp;*
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="supplierIDLabel" for="supplierID"><span id="supplierAssociatedLabel" <?php if ($this->data['leftSupplier'] != 1): ?> style="display:none;" <?php endif; ?> >Previous </span>Supplier:</label>
                                    </td>

                                    <td class="tdData">
                                        <input type="hidden" name="supplierID" id="supplierID" value="<?php $this->_($this->data['supplierID']); ?>" />
                                        <input type="text" name="supplierName" id="supplierName" value="<?php $this->_($this->data['supplierName']); ?>" class="inputbox" style="width: 150px" onFocus="suggestListActivate('getSupplierNames', 'supplierName', 'SupplierResults', 'supplierID', 'ajaxTextEntryHover', 0, '<?php echo($this->sessionCookie); ?>', 'helpShim');" <?php if ($this->defaultSupplierID == $this->data['supplierID']) echo('disabled'); ?> />&nbsp;*
                                        <?php if ($this->defaultSupplierID !== false): ?>
                                            <input type="checkbox" id="defaultSupplier" onchange="if (this.checked) { document.getElementById('supplierName').disabled = true; document.getElementById('supplierID').value = '<?php echo($this->defaultSupplierID); ?>'; document.getElementById('supplierName').value = &quot;<?php $this->_($this->defaultSupplierRS['name']); ?>&quot;; } else { document.getElementById('supplierName').disabled = false; }"<?php if ($this->defaultSupplierID == $this->data['supplierID']) echo(' checked'); ?> />&nbsp;Internal Contact
                                        <?php endif; ?>
                                        <script type="text/javascript">watchSupplierIDChange('<?php echo($this->sessionCookie); ?>');</script>
                                        <br />
                                        <iframe id="helpShim" src="javascript:void(0);" scrolling="no" frameborder="0" style="position:absolute; display:none;"></iframe>
                                        <div id="SupplierResults" class="ajaxSearchResults"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="titleLabel" for="title">Title:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="title" id="title" value="<?php $this->_($this->data['title']); ?>" class="inputbox" style="width: 150px" />&nbsp;
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="departmentLabel" for="department">Department:</label>
                                    </td>
                                    <td class="tdData">
                                        <select id="departmentSelect" name="department" class="inputbox" style="width: 150px;" onchange="if (this.value == 'edit') { listEditor('Departments', 'departmentSelect', 'departmentsCSV', false); this.value = '(none)'; } if (this.value == 'nullline') { this.value = '(none)'; }">
                                            <option value="edit">(Edit Departments)</option>
                                            <option value="nullline">-------------------------------</option>
                                            <?php if ($this->data['departmentID'] == 0): ?>
                                                <option value="(none)" selected="selected">(None)</option>
                                            <?php else: ?>
                                                <option value="(none)">(None)</option>
                                            <?php endif; ?>
                                            <?php foreach ($this->departmentsRS as $index => $department): ?>
                                                <option value="<?php $this->_($department['name']); ?>" <?php if ($department['name'] == $this->data['department']): ?>selected<?php endif; ?>><?php $this->_($department['name']); ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                        <input type="hidden" id="departmentsCSV" name="departmentsCSV" value="<?php $this->_($this->departmentsString); ?>" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="departmentLabel" for="department">Reports to:</label>
                                    </td>
                                    <td class="tdData">
                                        <select id="reportsTo" name="reportsTo" class="inputbox" style="width: 150px;" >
                                            <?php if ($this->data['reportsTo'] == -1): ?>
                                                <option value="(none)" selected="selected">(None)</option>
                                            <?php else: ?>
                                                <option value="(none)">(None)</option>
                                            <?php endif; ?>
                                            <?php foreach ($this->reportsToRS as $index => $supplierscontact): ?>
                                                <?php if ($supplierscontact['suppliercontactID'] != $this->suppliercontactID): ?>
                                                    <option value="<?php $this->_($supplierscontact['suppliercontactID']); ?>" <?php if ($supplierscontact['suppliercontactID'] == $this->data['reportsTo']): ?>selected<?php endif; ?>><?php $this->_($supplierscontact['firstName'] . ' ' . $supplierscontact['lastName']); ?></option>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        </select>
                                        &nbsp; <img src="images/indicator2.gif" alt="AJAX" id="ajaxIndicatorReportsTo" style="vertical-align: middle; visibility: hidden; margin-left: 5px;" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="isHotLabel" for="isHot">Hot Contact:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" id="isHot" name="isHot"<?php if ($this->data['isHotContact'] == 1): ?> checked<?php endif; ?> />&nbsp;
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">Left Supplier:</td>
                                    <td class="tdData">
                                        <input type="checkbox" id="leftSupplier" name="leftSupplier"<?php if ($this->data['leftSupplier'] == 1): ?> checked<?php endif; ?> onclick="if (document.getElementById('leftSupplier').checked) document.getElementById('supplierAssociatedLabel').style.display=''; else document.getElementById('supplierAssociatedLabel').style.display='none';" />&nbsp;
                                    </td>
                                </tr>

                                <?php /* These empty rows force the other rows to group at the top and align with the right-side table. */ ?>
                                <tr><td>&nbsp;</td></tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr><td>&nbsp;</td></tr>
                            </table>
                        </td>

                        <td width="50%" height="100%" valign="top">
                            <p class="noteUnsized">Contact Information</p>

                            <table class="editTable" width="100%" height="285">
                                <tr>
                                    <td class="tdVertical">
                                        <label id="email1Label" for="email1">E-Mail:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="email1" id="email1" value="<?php $this->_($this->data['email1']); ?>" class="inputbox" style="width: 150px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="email2Label" for="email2">2nd E-Mail:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="email2" id="email2" value="<?php $this->_($this->data['email2']); ?>" class="inputbox" style="width: 150px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="phoneWorkLabel" for="phoneWork">Work Phone:</label>
                                    </td>
                                    <td class="tdData"><input type="text" name="phoneWork" id="phoneWork" value="<?php $this->_($this->data['phoneWork']); ?>" class="inputbox" style="width: 150px" /></td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="phoneCellLabel" for="phoneCell">Cell Phone:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="phoneCell" id="phoneCell" value="<?php $this->_($this->data['phoneCell']); ?>" class="inputbox" style="width: 150px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="phoneOtherLabel" for="phoneOther">Other Phone:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="phoneOther" id="phoneOther" value="<?php $this->_($this->data['phoneOther']); ?>" class="inputbox" style="width: 150px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="addressLabel" for="address">Address:</label>
                                    </td>
                                    <td class="tdData">
                                        <textarea name="address" id="address" class="inputbox" style="width: 150px"><?php $this->_($this->data['address']); ?></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="cityLabel" for="city">City:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="city" id="city" value="<?php $this->_($this->data['city']); ?>" class="inputbox" style="width: 150px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="stateLabel" for="state">State:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="state" id="state" value="<?php $this->_($this->data['state']); ?>" class="inputbox" style="width: 150px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="zipLabel" for="zip">Postal Code:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="zip" id="zip" value="<?php $this->_($this->data['zip']); ?>" class="inputbox" style="width: 150px" />
                                        <input type="button" class="button" onclick="CityState_populate('zip', 'ajaxIndicator');" value="Lookup" />
                                        <img src="images/indicator2.gif" alt="AJAX" id="ajaxIndicator" style="vertical-align: middle; visibility: hidden; margin-left: 5px;" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <p class="note">Other</p>

                <table class="editTable">
                    
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
                            <label id="ownerLabel" for="owner">Owner:</label>
                        </td>
                        <td class="tdData">
                            <select id="owner" name="owner" class="inputbox" style="width: 150px;" <?php if (!$this->emailTemplateDisabled): ?>onchange="document.getElementById('divOwnershipChange').style.display=''; <?php if ($this->canEmail): ?>document.getElementById('checkboxOwnershipChange').checked=true;<?php endif; ?>"<?php endif; ?>>
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
                                <input type="checkbox" name="ownershipChange" id="checkboxOwnershipChange" <?php if (!$this->canEmail): ?>disabled<?php endif; ?>> E-Mail new owner of change
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="notesLabel" for="notes">Misc. Notes:</label>
                        </td>
                        <td class="tdData">
                            <textarea class="inputbox" name="notes" id="notes" rows="5" style="width: 400px;"><?php $this->_($this->data['notes']); ?></textarea>
                        </td>
                    </tr>
                </table>
                <input type="submit" class="button" name="submit" id="submit" value="Save" />&nbsp;
                <input type="reset"  class="button" name="reset"  id="reset"  value="Reset" />&nbsp;
                <input type="button" class="button" name="back"   id="back"   value="Back to Details" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=show&amp;suppliercontactID=<?php echo($this->suppliercontactID); ?>');" />
            </form>

            <script type="text/javascript">
                document.editContactForm.firstName.focus();
            </script>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
