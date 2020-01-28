<?php /* $Id: Show.tpl 3582 2007-11-12 22:58:48Z brian $ */ ?>
<?php TemplateUtility::printHeader('Supplier - '.$this->data['name'], array( 'js/sorttable.js', 'js/attachment.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/suppliers.gif" width="24" height="24" border="0" alt="Suppliers" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Suppliers: Supplier Details</h2></td>
               </tr>
            </table>

            <p class="note">Supplier Details</p>

            <table class="detailsOutside">
                <tr style="vertical-align:top;">
                    <td width="50%" height="100%">
                        <table class="detailsInside" height="100%">
                            <tr>
                                <td class="vertical">Supplier Name:</td>
                                <td class="data">
                                    <span class="<?php echo($this->data['titleClass']); ?>"><?php $this->_($this->data['name']); ?></span>
                                    <?php TemplateUtility::printSingleQuickActionMenu(DATA_ITEM_SUPPLIER, $this->supplierID); ?>
                                </td>
                            </tr>

                            <!-- CONTACT INFO -->                              

                            <tr>
                                <td class="vertical">Primary Phone:</td>
                                <td class="data"><?php $this->_($this->data['phone1']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Secondary Phone:</td>
                                <td class="data"><?php $this->_($this->data['phone2']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Fax Number:</td>
                                <td class="data"><?php $this->_($this->data['faxNumber']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Address:</td>
                                <td class="data"><?php echo(nl2br(htmlspecialchars($this->data['address']))); ?>&nbsp;
                                <?php echo($this->data['googleMaps']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">&nbsp;</td>
                                <td class="data">
                                    <?php $this->_($this->data['cityAndState']); ?>
                                    <?php $this->_($this->data['zip']); ?>
                                </td>
                            </tr>

                            <?php for ($i = 0; $i < intval(count($this->extraFieldRS)/2); $i++): ?>
                               <tr>
                                    <td class="vertical"><?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>
                                    <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>
                               </tr>
                            <?php endfor; ?>

                            <!-- /CONTACT INFO -->
                       </table>
                    </td>

                    <td width="50%" height="100%">
                        <table class="detailsInside" height="100%">
                        <!-- CONTACT INFO -->

                            <tr>
                                <td class="vertical">Billing Contact:</td>
                                <td class="data">
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=show&amp;suppliercontactID=<?php echo($this->data['billingContact']); ?>">
                                        <?php $this->_($this->data['billingContactFullName']); ?>
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td class="vertical">Web Site:</td>
                                <td class="data">
                                    <a href="<?php $this->_($this->data['url']); ?>" target="_blank">
                                        <?php $this->_($this->data['url']); ?>
                                    </a>
                                </td>
                            </tr>

                        <!-- /CONTACT INFO -->

                            <tr>
                                <td class="vertical">Key Technologies:</td>
                                <td class="data"><?php $this->_($this->data['keyTechnologies']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Created:</td>
                                <td class="data"><?php $this->_($this->data['dateCreated']); ?> (<?php $this->_($this->data['enteredByFullName']); ?>)</td>
                            </tr>

                            <tr>
                                <td class="vertical">Owner:</td>
                                <td class="data"><?php $this->_($this->data['ownerFullName']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">&nbsp;</td>
                                <td class="data">&nbsp;</td>
                            </tr>

                        <!-- CONTACT INFO -->

                            <?php for ($i = (intval(count($this->extraFieldRS))/2); $i < (count($this->extraFieldRS)); $i++): ?>
                                <tr>
                                    <td class="vertical"><?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>
                                    <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>                                </tr>
                            <?php endfor; ?>

                        <!-- /CONTACT INFO -->
                        </table>
                    </td>
                </tr>
            </table>

            <!-- CONTACT INFO -->
            <?php if (count($this->departmentsRS) > 0): ?>
                <table class="detailsOutside">
                    <tr>
                        <td>
                            <table class="detailsInside">
                                <tr>
                                    <td valign="top" class="vertical">Departments:</td>
                                    <td valign="top" class="data">
                                        <?php foreach ($this->departmentsRS as $departmentRecord): ?>
                                            <?php $this->_($departmentRecord['name']); ?>
                                            <br />
                                        <?php endforeach; ?>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            <?php endif; ?>
            <!-- /CONTACT INFO -->

            <!-- CONTACT INFO -->
            <table class="detailsOutside">
                <tr>
                    <td>
                        <table class="detailsInside">
                            <tr>
                                <td valign="top" class="vertical">Attachments:</td>
                                <td valign="top" class="data">
                                    <table class="attachmentsTable">
                                        <?php foreach ($this->attachmentsRS as $rowNumber => $attachmentsData): ?>
                                            <tr>
                                                <td>
                                                    <?php echo $attachmentsData['retrievalLink']; ?>
                                                        <img src="<?php $this->_($attachmentsData['attachmentIcon']) ?>" alt="" width="16" height="16" border="0" />
                                                        &nbsp;
                                                        <?php $this->_($attachmentsData['originalFilename']) ?>
                                                    </a>
                                                </td>
                                                <td><?php $this->_($attachmentsData['dateCreated']) ?></td>
                                                <td>
                                                    <?php if ($this->accessLevel >= ACCESS_LEVEL_DELETE): ?>
                                                        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=suppliers&amp;a=deleteAttachment&amp;supplierID=<?php echo($this->supplierID); ?>&amp;attachmentID=<?php $this->_($attachmentsData['attachmentID']) ?>"  title="Delete" onclick="javascript:return confirm('Delete this attachment?');">
                                                            <img src="images/actions/delete.gif" alt="" width="16" height="16" border="0" />
                                                        </a>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </table>
                                    <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT): ?>
                                            <?php if (isset($this->attachmentLinkHTML)): ?>
                                                <?php echo($this->attachmentLinkHTML); ?>
                                            <?php else: ?>
                                                <a href="#" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=suppliers&amp;a=createAttachment&amp;supplierID=<?php echo($this->supplierID); ?>', 400, 125, null); return false;">
                                            <?php endif; ?>
                                            <img src="images/paperclip_add.gif" width="16" height="16" border="0" alt="add attachment" class="absmiddle" />&nbsp;Add Attachment
                                        </a>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="vertical">Misc. Notes:</td>
                                <?php if ($this->isShortNotes): ?>
                                    <td id="shortNotes" style="display:block;" class="data">
                                        <?php echo($this->data['shortNotes']); ?><span class="moreText">...</span>&nbsp;
                                        <p><a href="#" class="moreText" onclick="toggleNotes(); return false;">[More]</a></p>
                                    </td>
                                    <td id="fullNotes" style="display:none;" class="data">
                                        <?php echo($this->data['notes']); ?>&nbsp;
                                        <p><a href="#" class="moreText" onclick="toggleNotes(); return false;">[Less]</a></p>
                                    </td>
                                <?php else: ?>
                                    <td id="shortNotes" style="display:block;" class="data">
                                        <?php echo($this->data['notes']); ?>
                                    </td>
                                <?php endif; ?>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!-- /CONTACT INFO -->

            <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT && $this->accessLevel!= 370 ): ?>
                <a id="edit_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=suppliers&amp;a=edit&amp;supplierID=<?php echo($this->supplierID); ?>">
                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />&nbsp;Edit
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <?php endif; ?>
            <?php if ($this->accessLevel >= ACCESS_LEVEL_DELETE && $this->data['defaultSupplier'] != 1 && $this->accessLevel!= 370 ): ?>
                <a id="delete_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=suppliers&amp;a=delete&amp;supplierID=<?php echo($this->supplierID); ?>" onclick="javascript:return confirm('Delete this supplier?');">
                    <img src="images/actions/delete.gif" width="16" height="16" class="absmiddle" alt="delete" border="0" />&nbsp;Delete
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <?php endif; ?>
            <?php if ($this->privledgedUser): ?>
                <a id="history_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=viewItemHistory&amp;dataItemType=200&amp;dataItemID=<?php echo($this->supplierID); ?>">
                    <img src="images/icon_clock.gif" width="16" height="16" class="absmiddle"  border="0" />&nbsp;View History
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <?php endif; ?>
            <br clear="all" />
            <br />

            <p class="note">Job Orders</p>
            <table class="sortable">
                <tr>
                    <th align="left" width="30" nowrap="nowrap">ID</th>
                    <th align="left" width="200">Title</th>
                    <th align="left" width="15">Type</th>
                    <th align="left" width="15">Status</th>
                    <th align="left" width="60">Created</th>
                    <th align="left" width="60">Modified</th>
                    <th align="left" width="60">Start</th>
                    <th align="left" width="15">Age</th>
                    <th align="left" width="10">S</th>
                    <th align="left" width="10">P</th>
                    <th align="left" width="65">Recruiter</th>
                    <th align="left" width="68">Owner</th>
                    <th align="left" width="25">Action</th>
                </tr>

                <?php foreach ($this->jobOrdersRS as $rowNumber => $jobOrdersData): ?>
                    <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['jobOrderID']) ?></td>
                        <td valign="top">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=show&amp;jobOrderID=<?php $this->_($jobOrdersData['jobOrderID']) ?>">
                                <?php $this->_($jobOrdersData['title']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['type']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['status']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['dateCreated']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['dateModified']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['startDate']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['daysOld']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['submitted']); ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['pipeline']); ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['recruiterAbbrName']); ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['ownerAbbrName']); ?></td>
                        <td valign="top" align="center">
                            <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT && $this->accessLevel!= 370 ): ?>
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=edit&amp;jobOrderID=<?php $this->_($jobOrdersData['jobOrderID']) ?>">
                                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />
                                </a>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>

            <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT && $this->accessLevel!= 370 ): ?>
                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=add&amp;selected_supplier_id=<?php echo($this->supplierID); ?>" title="Add Job Order">
                    <img src="images/actions/job_order.gif" width="16" height="16" class="absmiddle" alt="New Job Order" border="0" />&nbsp;Add Job Order
                </a>
            <?php endif; ?>
            <br clear="all" />
            <br />

            <!-- CONTACT INFO -->
            <p class="note">Contacts</p>
            <table class="sortable">
                <tr>
                    <th align="left" nowrap="nowrap">First Name</th>
                    <th align="left" nowrap="nowrap">Last Name</th>
                    <th align="left">Title</th>
                    <th align="left">Department</th>
                    <th align="left" nowrap="nowrap">Work Phone</th>
                    <th align="left" nowrap="nowrap">Cell Phone</th>
                    <th align="left">Created</th>
                    <th align="left">Owner</th>
                    <th align="center">Action</th>
                </tr>

                <?php if (count($this->supplierscontactsRSWC) != 0): ?>
                 <?php foreach ($this->supplierscontactsRSWC as $rowNumber => $supplierscontactsData): ?>
                    <tr id="ContactsDefault<?php echo($rowNumber) ?>" class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                        <td valign="top" align="left">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=show&amp;suppliercontactID=<?php $this->_($supplierscontactsData['suppliercontactID']) ?>" class="<?php $this->_($supplierscontactsData['linkClass']); ?>">
                                <?php $this->_($supplierscontactsData['firstName']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=show&amp;suppliercontactID=<?php $this->_($supplierscontactsData['suppliercontactID']) ?>" class="<?php $this->_($supplierscontactsData['linkClass']); ?>">
                                <?php $this->_($supplierscontactsData['lastName']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['title']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['department']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['phoneWork']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['phoneCell']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['dateCreated']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['ownerAbbrName']); ?></td>
                        <td valign="top" align="center">
                            <?php if (!empty($supplierscontactsData['email1'])): ?>
                                <a href="mailto:<?php $this->_($supplierscontactsData['email1']); ?>" title="Send E-Mail (<?php $this->_($supplierscontactsData['email1']); ?>)">
                                    <img src="images/actions/email.gif" width="16" height="16" alt="" class="absmiddle" border="0" />
                                </a>
                            <?php else: ?>
                                <img src="images/actions/email_no.gif" title="No E-Mail Address" width="16" height="16" alt="" class="absmiddle" border="0" />
                            <?php endif; ?>
                            <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT && $this->accessLevel!= 370 ): ?>
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=edit&amp;suppliercontactID=<?php $this->_($supplierscontactsData['suppliercontactID']) ?>">
                                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />
                                </a>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
               <?php endif; ?>

                <?php /* The following are hidden by default */ ?>
                <?php if (count($this->supplierscontactsRSWC) != count($this->supplierscontactsRS) && count($this->supplierscontactsRS) != 0) : ?>
                 <?php foreach ($this->supplierscontactsRS as $rowNumber => $supplierscontactsData): ?>
                    <tr id="ContactsFull<?php echo($rowNumber) ?>" class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>" style="display:none;">
                        <td valign="top" align="left">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=show&amp;suppliercontactID=<?php $this->_($supplierscontactsData['suppliercontactID']) ?>" class="<?php $this->_($supplierscontactsData['linkClass']); ?>">
                                <?php $this->_($supplierscontactsData['firstName']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=show&amp;suppliercontactID=<?php $this->_($supplierscontactsData['suppliercontactID']) ?>" class="<?php $this->_($supplierscontactsData['linkClass']); ?>">
                                <?php $this->_($supplierscontactsData['lastName']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['title']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['department']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['phoneWork']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['phoneCell']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['dateCreated']) ?></td>
                        <td valign="top" align="left"><?php $this->_($supplierscontactsData['ownerAbbrName']); ?></td>
                        <td valign="top" align="center">
                            <?php if (!empty($supplierscontactsData['email1'])): ?>
                                <a href="mailto:<?php $this->_($supplierscontactsData['email1']); ?>">
                                    <img src="images/actions/email.gif" width="16" height="16" alt="" class="absmiddle" border="0" title="Send E-Mail (<?php $this->_($supplierscontactsData['email1']); ?>)"/>
                                </a>
                            <?php else: ?>
                                <img src="images/actions/email_no.gif" title="No E-Mail Address" width="16" height="16" alt="" class="absmiddle" border="0" />
                            <?php endif; ?>
                            <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT && $this->accessLevel!= 370 ): ?>
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=edit&amp;suppliercontactID=<?php $this->_($supplierscontactsData['suppliercontactID']) ?>">
                                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />
                                </a>
                            <?php endif; ?>
                        </td>
                    </tr>
                 <?php endforeach; ?>
                <?php endif; ?>

            </table>

            <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT && $this->accessLevel!= 370 ): ?>
                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=supplierscontacts&amp;a=add&amp;selected_supplier_id=<?php echo($this->supplierID); ?>" title="Add Contact">
                    <img src="images/actions/add_contact.gif" width="16" height="16" class="absmiddle" alt="add contact" border="0" title="Add Contact"/>&nbsp;Add Contact
                </a>
            <?php endif; ?>
            <?php if (count($this->supplierscontactsRSWC) != count($this->supplierscontactsRS)) : ?>
                &nbsp;
                <a href="javascript:void(0)" id="linkShowAll" onclick="javascript:for (i = 0; i< <?php echo(count($this->supplierscontactsRSWC)); ?>; i++) document.getElementById('ContactsDefault'+i).style.display='none'; for (i = 0; i< <?php echo(count($this->supplierscontactsRS)); ?>; i++) document.getElementById('ContactsFull'+i).style.display=''; document.getElementById('linkShowAll').style.display='none'; document.getElementById('linkHideSome').style.display='';">
                    <img src="images/actions/add_contact.gif" width="16" height="16" class="absmiddle" alt="add contact" border="0" title="Show All"/>
                    &nbsp;Show supplierscontacts who have left (<?php echo(count($this->supplierscontactsRS) - count($this->supplierscontactsRSWC)); ?>)
                </a>
                <a href="javascript:void(0)" id="linkHideSome" style="display:none;" onclick="javascript:for (i = 0; i< <?php echo(count($this->supplierscontactsRSWC)); ?>; i++) document.getElementById('ContactsDefault'+i).style.display=''; for (i = 0; i< <?php echo(count($this->supplierscontactsRS)); ?>; i++) document.getElementById('ContactsFull'+i).style.display='none'; document.getElementById('linkShowAll').style.display=''; document.getElementById('linkHideSome').style.display='none';">
                    <img src="images/actions/add_contact.gif" width="16" height="16" class="absmiddle" alt="add contact" border="0" title="Hide Some"/>
                    &nbsp;Hide supplierscontacts who have left (<?php echo(count($this->supplierscontactsRS) - count($this->supplierscontactsRSWC)); ?>)
                </a>
            <?php endif; ?>
            <!-- /CONTACT INFO -->
        </div>
    </div>

<?php TemplateUtility::printFooter(); ?>
