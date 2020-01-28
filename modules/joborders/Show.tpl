<?php /* $Id: Show.tpl 3814 2007-12-06 17:54:28Z brian $ */ ?>
<?php if ($this->isPopup): ?>
    <?php TemplateUtility::printHeader('Job Order - '.$this->data['title'], array('js/sorttable.js', 'js/match.js', 'js/pipeline.js', 'js/attachment.js')); ?>
<?php else: ?>
    <?php TemplateUtility::printHeader('Job Order - '.$this->data['title'], array( 'js/sorttable.js', 'js/match.js', 'js/pipeline.js', 'js/attachment.js')); ?>
    <?php TemplateUtility::printHeaderBlock(); ?>
    <?php TemplateUtility::printTabs($this->active); ?>
        <div id="main">
            <?php TemplateUtility::printQuickSearch(); ?>
<?php endif; ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/job_orders.gif" width="24" height="24" border="0" alt="Job Orders" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Job Orders: Job Order Details</h2></td>
                </tr>
            </table>

            <p class="note">Job Order Details</p>

            <?php if ($this->data['isAdminHidden'] == 1): ?>
                <p class="warning">This Job Order is hidden.  Only CATS Administrators can view it or search for it.  To make it visible by the site users, click <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=administrativeHideShow&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;state=0" style="font-weight:bold;">Here.</a></p>
            <?php endif; ?>

            <?php if (isset($this->frozen)): ?>
                <table style="font-weight:bold; border: 1px solid #000; background-color: #ffed1a; padding:5px; margin-bottom:7px;" width="100%" id="candidateAlreadyInSystemTable">
                    <tr>
                        <td class="tdVertical">
                            This Job Order is <?php $this->_($this->data['status']); ?> and can not be modified.
                           <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT): ?>
                               <a id="edit_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=edit&amp;jobOrderID=<?php echo($this->jobOrderID); ?>">
                                   <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />&nbsp;Edit
                               </a>
                               the Job Order to make it Active.&nbsp;&nbsp;
                           <?php endif; ?>
                        </td>
                    </tr>
                </table>
            <?php endif; ?>

            <table class="detailsOutside" width="100%" height="<?php echo((count($this->extraFieldRS)/2 + 12) * 22); ?>">
                <tr style="vertical-align:top;">
                    <td width="50%" height="100%">
                        <table class="detailsInside" width="100%">
                            <tr>
                                <td class="vertical">Job ID:</td>
                                <td class="data"><?php $this->_($this->data['jobOrderID']); ?></td>
                            </tr>
                            <tr>
                                <td class="vertical">Job Group:</td>
                                <td class="data"><?php $this->_($this->data['jobgroup']); ?></td>
                            </tr>
                            <tr>
                                <td class="vertical">Title:</td>
                                <td class="data">
                                    <span class="<?php echo($this->data['titleClass']); ?>"><?php $this->_($this->data['title']); ?></span>
                                    <?php echo($this->data['public']) ?>
                                    <?php TemplateUtility::printSingleQuickActionMenu(DATA_ITEM_JOBORDER, $this->data['jobOrderID']); ?>
                                </td>
                            </tr>                            <tr>                                <td class="vertical">Client Ref.No:</td>                                <td class="data">                                	<?php $this->_($this->data['clientrefno']); ?>                                </td>                            </tr>
                            <tr>
                                <td class="vertical">Status:</td>
                                <td class="data"><?php $this->_($this->data['status']); ?></td>
                            </tr>
                             <tr>
                                <td class="vertical">Start Date:</td>
                                <td class="data"><?php $this->_($this->data['startDate']); ?></td>
                            </tr>
                            <tr>
                                <td class="vertical">Expiry Date:</td>
                                <td class="data"><?php $this->_($this->data['expirydate']); ?></td>
                            </tr>
                            

                            <tr>
                                <td class="vertical">Openings:</td>
                                <td class="data"><?php $this->_($this->data['openings']); if ($this->data['openingsAvailable'] != $this->data['openings']): ?> (<?php $this->_($this->data['openingsAvailable']); ?> Available)<?php endif; ?></td>
                            </tr>
                            <tr>
                                <td class="vertical">Location:</td>
                                <td class="data"><?php $this->_($this->data['cityAndState']); ?> <?php $this->_($this->data['country']); ?></td>
                            </tr>
                            

                            
                            <tr>
                                <td class="vertical">Type:</td>
                                <td class="data"><?php $this->_($this->data['typeDescription']); ?></td>
                            </tr>
                            <?php if($this->data['type']=="DH"){ ?>
							<tr>
                                <td class="vertical">Bill Rate:</td>
                                <td class="data"><b>Min $</b><?php $this->_($this->data['minRate']); ?>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><?php $this->_($this->data['maxRate']); ?></td>
                            </tr>
                            <tr>
                                <td class="vertical">Pay Rate:</td>
                                <td class="data"><br/>                                	<b>Min $</b><?php $this->_($this->data['minpayRate']); ?> / hourly&nbsp;&nbsp;-&nbsp;&nbsp;                                	<b>Max $</b><?php if(trim($this->data['maxRate'])) $this->_($this->data['maxRate']); else echo "0.00"; ?> / hourly<br/>                                	                                	<b>Min $</b><?php $this->_($this->data['minsalary']); ?><b> / Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;                                	<b>Max $</b><?php if(trim($this->data['salary']))  $this->_($this->data['salary']); else echo "0.00";  ?> <b> / Salary Yearly</b><br/>                                </td>
                            </tr>
                            <tr>
                                <td class="vertical">Duration:</td>
                                <td class="data"><?php $this->_($this->data['duration']); ?></td>
                            </tr>
                            
							<?php } else  if($this->data['type']=="C2H"){ ?>                       
							
							 <?php if ($this->accessLevel!= 370 ){ ?>
							<tr>
                                <td class="vertical">Bill Rate:</td>
                                <td class="data"><b>Min $</b><?php $this->_($this->data['minRate']); ?>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b>
                                <?php if(trim($this->data['maxRate'])) $this->_($this->data['maxRate']); else echo "0.00"; ?></td>
                            </tr>
                            <?php } ?>
                            <tr>
                                <td class="vertical">Pay Rate:</td>
                                <td class="data"><br/>	                                <b>Min $</b><?php $this->_($this->data['minpayRate']); ?> / hourly&nbsp;&nbsp;-&nbsp;&nbsp;                                	<b>Max $</b><?php if(trim($this->data['payRate'])) $this->_($this->data['payRate']); else echo "0.00";?> / hourly<br/>                                                                	<b>Min $</b><?php $this->_($this->data['minsalary']); ?> / <b>Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;                                	<b>Max $</b><?php if(trim($this->data['salary']))  $this->_($this->data['salary']); else echo "0.00";  ?>  / <b>Salary Yearly</b><br/>                                </td>
                            </tr>
                            <tr>
                                <td class="vertical">Benefits:</td>
                                <td class="data"><?php $this->_($this->data['benefits']); ?></td>
                            </tr>
                            <tr>
							<td class="vertical" colspan="2" style=" text-align: left;  color: #00BCD4;">Client Hireing Information</td>
							</tr>
                            <tr>
                                <td class="vertical">Pay Rate:</td>
                                <td class="data"><br/><b>Min $</b><?php $this->_($this->data['mincurrentpayRate']); ?> / hourly&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><?php if(trim($this->data['currentpayRate']))  $this->_($this->data['currentpayRate']); else echo "0.00";  ?> / hourly<br/>
                                <b>Min $</b><?php $this->_($this->data['mincurrentpayRateSal']); ?><b> / Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><?php if(trim($this->data['currentpayRateSal'])) $this->_($this->data['currentpayRateSal']); else echo "0.00"; ?> <b> / Salary Yearly</b><br/></td>
                            </tr>
                            <tr>
                                <td class="vertical">Duration:</td>
                                <td class="data"><?php $this->_($this->data['duration']); ?></td>
                            </tr>
                            
                            <tr>
                                <td class="vertical">Client Benefits:</td>
                                <td class="data"><?php $this->_($this->data['clientbenefits']); ?></td>
                            </tr>
                            <?php } else  if($this->data['type']=="C"){ ?>  
                             <!--tr>
                                <td class="vertical">Pay Rate:</td>
                                <td class="data"><br/><b>Min $</b><?php $this->_($this->data['mincurrentpayRate']); ?> / hourly&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><?php if(trim($this->data['currentpayRate']))  $this->_($this->data['currentpayRate']); else echo "0.00"; ?> / hourly<br/> <b>Min $</b><?php $this->_($this->data['mincurrentpayRateSal']); ?><b> / Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><?php if(trim($this->data['currentpayRateSal'])) $this->_($this->data['currentpayRateSal']); else echo "0.00";?> <b> / Salary Yearly</b><br/></td>
                            </tr-->
                            <tr>
                                <td class="vertical">Pay Rate:</td>
                                <td class="data"><br/><b>Min $</b><?php $this->_($this->data['minpayRate']); ?> / hourly&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><?php if(trim($this->data['payRate'])) $this->_($this->data['payRate']); else echo "0.00";?> / hourly<br/><b>Min $</b><?php $this->_($this->data['minsalary']); ?> / <b>Salary Yearly</b>&nbsp;&nbsp;-&nbsp;&nbsp;<b>Max $</b><?php if(trim($this->data['salary']))  $this->_($this->data['salary']); else echo "0.00";  ?>  / <b>Salary Yearly</b><br/></td>
                            </tr>
                            <tr>
                                <td class="vertical">Duration:</td>
                                <td class="data"><?php $this->_($this->data['duration']); ?></td>
                            </tr>
                            <tr>
                                <td class="vertical">Benefits:</td>
                                <td class="data"><?php $this->_($this->data['benefits']); ?></td>
                            </tr>
                            <tr>
                                <td class="vertical">Client Benefits:</td>
                                <td class="data"><?php $this->_($this->data['clientbenefits']); ?></td>
                            </tr>
                             <?php if ($this->accessLevel!= 370 ){ ?>
                            <tr>
                                <td class="vertical">Our fee:</td>
                                <td class="data"><?php if($this->data['ourfee_precent']) echo $this->_($this->data['ourfee'])."%";
                                else  if($this->data['ourfee'])  echo "$". $this->_($this->data['ourfee']); else echo "$0.00"; ?></td>
                            </tr>  <?php }?>
                            <?php } ?>
                             <tr>
                                <td class="vertical">Notes:</td>
                                <td class="data"><?php $this->_($this->data['hirenotes']); ?></td>
                            </tr>
                            <?php for ($i = 0; $i < intval(count($this->extraFieldRS)/2); $i++): ?>
                               <tr>
                                    <td class="vertical"><?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>
                                    <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>
                              </tr>
                            <?php endfor; ?>

                            <?php eval(Hooks::get('JO_TEMPLATE_SHOW_BOTTOM_OF_LEFT')); ?>

                        </table>
                    </td>

                    <td width="50%" height="100%" style="vertical-align:top;" id="MainTable">						 <table width ="100%" >						 	<tr>						 		<!-- Client Deatils of Job order -->						 		<td  width="50%" style="vertical-align:top;">							<p class="noteUnsized">Client / Implemenation Partner</p>	                        <table class="detailsInside" height="100%" border='0px'>		                           <tr>		                                <td class="vertical">Name:</td>		                                <td class="data">		                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=show&amp;companyID=<?php echo($this->data['companyID']); ?>">		                                        <?php echo($this->data['companyName']); ?>		                                    </a>		                                </td>		                            </tr>									    <tr>		                                <td class="vertical">Location:</td>		                                <td class="data"><?php echo($this->data['client_location']); ?></td>		                            </tr>                            	                            <!-- CONTACT INFO -->		                            <tr>		                                <td class="vertical">Primary Contact::</td>		                                <td class="data">		                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php echo($this->data['contactID']); ?>">		                                        <?php echo($this->data['contactFullName']); ?>		                                    </a>		                                </td>		                            </tr>	                            <!--<tr>		                                <td class="vertical">Contact Phone:</td>		                                <td class="data"><?php echo($this->data['contactWorkPhone']); ?></td>		                            </tr>-->	                            <tr>		                                <td class="vertical">Secondary  Contact::</td>		                                <td class="data">		                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php echo($this->data['contact_id2']); ?>">		                                        <?php echo($this->data['contact2FullName']); ?>		                                    </a>		                                </td>		                            </tr>									<!--	                            <tr>		                                <td class="vertical">Contact Email:</td>		                                <td class="data">		                                    <a href="mailto:<?php $this->_($this->data['contactEmail']); ?>"><?php $this->_($this->data['contactEmail']); ?></a>		                                </td>		                            </tr>-->		                            <!-- /CONTACT INFO -->	                            <tr>		                                <td class="vertical">Company Job ID:</td>		                                <td class="data"><?php echo($this->data['companyJobID']); ?></td>		                            </tr>	                            								</table>					 							 		</td>					 		<!-- EndClient Deatils of Job order -->					 		<td width="50%" style="vertical-align:top;">								<p class="noteUnsized">End Client</p>		                        <table class="detailsInside" height="100%" border='0px'>		                           <tr>				                                <td class="vertical">Company Name:</td>				                                <td class="data">				                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=show&amp;companyID=<?php echo($this->data['endclient_company_id']); ?>">				                                        <?php echo($this->data['endclient_company_name']); ?>				                                    </a>				                                </td>				                            </tr>												    <tr>				                                <td class="vertical">Work Location:</td>				                                <td class="data"><?php echo($this->data['endclient_location']); ?></td>				                            </tr>                            		                            <!-- CONTACT INFO -->				                            <tr>				                                <td class="vertical">Primary Contact::</td>				                                <td class="data">				                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php echo($this->data['endclient_contact_id']); ?>">				                                        <?php echo($this->data['endclient_contact_Name']); ?>				                                    </a>				                                </td>				                            </tr>		                            <!--<tr>				                                <td class="vertical">Contact Phone:</td>				                                <td class="data"><?php echo($this->data['contactWorkPhone']); ?></td>				                            </tr>-->		                            <tr>				                                <td class="vertical">Secondary  Contact::</td>				                                <td class="data">				                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php echo($this->data['endclient_contact_id2']); ?>">				                                        <?php echo($this->data['endclient_contact2_Name']); ?>				                                    </a>				                                </td>				                            </tr>											<!--		                            <tr>				                                <td class="vertical">Contact Email:</td>				                                <td class="data">				                                    <a href="mailto:<?php $this->_($this->data['contactEmail']); ?>"><?php $this->_($this->data['contactEmail']); ?></a>				                                </td>				                            </tr>-->				                            <!-- /CONTACT INFO -->		                            <tr>				                                <td class="vertical">&nbsp;</td>				                                <td class="data">&nbsp;</td>				                            </tr>		                            									</table>					 							 		</td>					 							    </tr>					 	<tr>					 		<!-- Other Deatils of Job order -->					 		<td colspan="2">						 		<table class="detailsInside" height="100%" border='0px'>		                            <tr>		                                <td class="vertical">Pipeline:</td>		                                <td class="data"><?php $this->_($this->data['pipeline']) ?></td>		                            </tr>				                            <tr>		                                <td class="vertical">Submitted:</td>		                                <td class="data"><?php $this->_($this->data['submitted']) ?></td>		                            </tr>				                            <tr>		                                <td class="vertical">Days Old:</td>		                                <td class="data"><?php $this->_($this->data['daysOld']); ?></td>		                            </tr>				                            <tr>		                                <td class="vertical">Created:</td>		                                <td class="data"><?php $this->_($this->data['dateCreated']); ?> (<?php $this->_($this->data['enteredByFullName']); ?>)</td>		                            </tr>		                            		                            <tr>		                                <td class="vertical">Account Manager:</td>		                                <td class="data"><?php $this->_($this->data['ownerFullName']); ?></td>		                            </tr>		                            		                            <tr>		                                <td class="vertical">Recruiter:</td>		                                <td class="data"><?php $this->_($this->data['recruiterFullName']); ?></td>		                            </tr>				                            		                             <tr style="display: none;">		                                <td class="vertical">Supplier:</td>		                                <td class="data"><?php $this->_($this->data['supplierFullName']); ?></td>		                            </tr>		                             <tr style="display: none;">		                                <td class="vertical">Supplier Contact:</td>		                                <td class="data"><?php echo $this->SupplierContact; ?></td>		                            </tr>		                            <?php for ($i = (intval(count($this->extraFieldRS))/2); $i < (count($this->extraFieldRS)); $i++): ?>		                                <tr>		                                    <td class="vertical"><?php 		                                    if($this->extraFieldRS[$i]['fieldName']=="Pay rate")		                                    echo "payrate as per old record";		                                    else		                                    $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>		                                    <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>		                                </tr>		                            <?php endfor; ?>				                            <?php eval(Hooks::get('JO_TEMPLATE_SHOW_BOTTOM_OF_RIGHT')); ?>		                        </table>					 		</td>					 		<!--Other Details of Job Order Ends -->					 	</tr>					 </table>
                    </td>
                </tr>
            </table>

            <?php if ($this->isPublic): ?>
            <div style="background-color: #E6EEFE; padding: 10px; margin: 5px 0 12px 0; border: 1px solid #728CC8;">
                <b>This job order is public<?php if ($this->careerPortalURL === false): ?>.</b><?php else: ?>
                    and will be shown on your
                    <?php if ($_SESSION['CATS']->getAccessLevel() >= ACCESS_LEVEL_SA): ?>
                        <a style="font-weight: bold;" href="<?php $this->_($this->careerPortalURL); ?>">Careers Website</a>.
                    <?php else: ?>
                        Careers Website.
                    <?php endif; ?></b>
                <?php endif; ?>

                <?php if ($this->questionnaireID !== false): ?>
                    <br />Applicants must complete the "<i><?php echo $this->questionnaireData['title']; ?></i>" (<a href="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalQuestionnaire&questionnaireID=<?php echo $this->questionnaireID; ?>">edit</a>) questionnaire when applying.
                <?php else: ?>
                    <br />You have not attached any
                    <?php if ($_SESSION['CATS']->getAccessLevel() >= ACCESS_LEVEL_SA): ?>
                        <a href="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalSettings">Questionnaires</a>.
                    <?php else: ?>
                        Questionnaires.
                    <?php endif; ?>
                <?php endif; ?>
            </div>
            <?php endif; ?>
            <table class="detailsOutside" width="100%">
                <tr>
                    <td>
                       <table class="detailsInside" width="99%">
                       <tr>
                        <td class="vertical">
                            <label id="titleLabe111" for="title">Public Title:</label>
                        </td>
                        <td class="Data"><?php $this->_($this->data['pubtitle']); ?>
                        </td></tr>
                        <tr>
                        <td class="vertical">
                            <label id="titleLabe111" for="title">Public Description:</label>
                        </td>
                        <td class="Data">
                         <?php if($this->data['pdescription'] != ''): ?>
                                    <div id="shortDescription" style="overflow: auto; height:170px; border: #AAA 1px solid; padding:5px;">
                                        <?php $this->_($this->data['pdescription']); ?>
                                    </div>
                                    <?php endif; ?>
                        
                        
                       
                        </td></tr>
                        
                        </table> 
                    </td>
                </tr>
            </table>
            
            <table class="detailsOutside" width="100%">
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
                                                    <?php if (!$this->isPopup): ?>
                                                        <?php if ($this->accessLevel >= ACCESS_LEVEL_DELETE): ?>
                                                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=deleteAttachment&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;attachmentID=<?php $this->_($attachmentsData['attachmentID']) ?>"  title="Delete" onclick="javascript:return confirm('Delete this attachment?');">
                                                                <img src="images/actions/delete.gif" alt="" width="16" height="16" border="0" />
                                                            </a>
                                                        <?php endif; ?>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </table>
                                    <?php if (!$this->isPopup): ?>
                                        <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT): ?>
                                            <?php if (isset($this->attachmentLinkHTML)): ?>
                                                <?php echo($this->attachmentLinkHTML); ?>
                                            <?php else: ?>
                                                <a href="#" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=createAttachment&amp;jobOrderID=<?php echo($this->jobOrderID); ?>', 400, 125, null); return false;">
                                            <?php endif; ?>
                                                <img src="images/paperclip_add.gif" width="16" height="16" border="0" alt="add attachment" class="absmiddle" />&nbsp;Add Attachment
                                            </a>
                                        <?php endif; ?>
                                    <?php endif; ?>
                                </td>
                            </tr>

                            <tr>
                                <td valign="top" class="vertical">Description:</td>

                                <td class="data" colspan="2">
                                    <?php if($this->data['description'] != ''): ?>
                                    <div id="shortDescription" style="overflow: auto; height:170px; border: #AAA 1px solid; padding:5px;">
                                        <?php echo($this->data['description']); ?>
                                    </div>
                                    <?php endif; ?>
                                </td>

                            </tr>

                            <tr>
                                <td valign="top" class="vertical">Internal Notes:</td>

                                <td class="data" style="width:320px;">
                                    <?php if($this->data['notes'] != ''): ?>
                                        <div id="shortDescription" style="overflow: auto; height:240px; border: #AAA 1px solid; padding:5px;">
                                            <?php echo($this->data['notes']); ?>
                                        </div>
                                    <?php endif; ?>
                                </td>

                                <td style="vertical-align:top;">
                                    <?php echo($this->pipelineGraph);  ?>
                                </td>

                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
<?php if (!$this->isPopup): ?>
            <div id="actionbar">
                <span style="float:left;">
                    <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT && $this->accessLevel!= 370 ): ?>
                        <a id="edit_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=edit&amp;jobOrderID=<?php echo($this->jobOrderID); ?>">
                            <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />&nbsp;Edit
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <?php endif; ?>
                    <?php if ($this->accessLevel >= ACCESS_LEVEL_DELETE && $this->accessLevel!= 370 ): ?>
                        <a id="delete_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=delete&amp;jobOrderID=<?php echo($this->jobOrderID); ?>" onclick="javascript:return confirm('Delete this job order?');">
                            <img src="images/actions/delete.gif" width="16" height="16" class="absmiddle" alt="delete" border="0" />&nbsp;Delete
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <?php endif; ?>
                    <?php if ($this->accessLevel >= ACCESS_LEVEL_MULTI_SA): ?>
                        <?php if ($this->data['isAdminHidden'] == 1): ?>
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=administrativeHideShow&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;state=0">
                                <img src="images/resume_preview_inline.gif" width="16" height="16" class="absmiddle" alt="delete" border="0" />&nbsp;Administrative Show
                            </a>
                            <?php else: ?>
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=administrativeHideShow&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;state=1">
                                <img src="images/resume_preview_inline.gif" width="16" height="16" class="absmiddle" alt="delete" border="0" />&nbsp;Administrative Hide
                            </a>
                        <?php endif; ?>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <?php endif; ?>
                </span>
                <span style="float:right;">
                    <?php if (!empty($this->data['public']) && $this->careerPortalEnabled): ?>
                        <a id="public_link" href="<?php echo(CATSUtility::getAbsoluteURI()); ?>careers/<?php echo(CATSUtility::getIndexName()); ?>?p=showJob&amp;ID=<?php echo($this->jobOrderID); ?>">
                            <img src="images/public.gif" width="16" height="16" class="absmiddle" alt="Online Application" border="0" />&nbsp;Online Application
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <?php endif; ?>
                    <?php /* TODO: Make report available for every site. */ ?>
                    <a id="report_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=reports&amp;a=customizeJobOrderReport&amp;jobOrderID=<?php echo($this->jobOrderID); ?>">
                        <img src="images/reportsSmall.gif" width="16" height="16" class="absmiddle" alt="report" border="0" />&nbsp;Generate Report
                    </a>
                    <?php if ($this->privledgedUser): ?>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a id="history_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=viewItemHistory&amp;dataItemType=400&amp;dataItemID=<?php echo($this->jobOrderID); ?>">
                            <img src="images/icon_clock.gif" width="16" height="16" class="absmiddle"  border="0" />&nbsp;View History
                        </a>
                    <?php endif; ?>
                </span>
            </div>
<?php endif; ?>
            <br clear="all" />
            <br />

            <p class="note">Candidate Pipeline</p>

            <p id="ajaxPipelineControl">
                Number of visible entries:&nbsp;&nbsp;
                <select id="numberOfEntriesSelect" onchange="PipelineJobOrder_changeLimit(<?php $this->_($this->data['jobOrderID']); ?>, this.value, <?php if ($this->isPopup) echo(1); else echo(0); ?>, 'ajaxPipelineTable', '<?php echo($this->sessionCookie); ?>', 'ajaxPipelineTableIndicator', '<?php echo(CATSUtility::getIndexName()); ?>');" class="selectBox">
                    <option value="15" <?php if ($this->pipelineEntriesPerPage == 15): ?>selected<?php endif; ?>>15 entries</option>
                    <option value="30" <?php if ($this->pipelineEntriesPerPage == 30): ?>selected<?php endif; ?>>30 entries</option>
                    <option value="50" <?php if ($this->pipelineEntriesPerPage == 50): ?>selected<?php endif; ?>>50 entries</option>
                    <option value="99999" <?php if ($this->pipelineEntriesPerPage == 99999): ?>selected<?php endif; ?>>All entries</option>
                </select>&nbsp;
                <span id="ajaxPipelineNavigation">
                </span>&nbsp;
                <img src="images/indicator.gif" alt="" id="ajaxPipelineTableIndicator" />
            </p>

            <div id="ajaxPipelineTable"></div>
            <input type="checkbox" name="select_all" onclick="selectAll_candidates(this)" title="Select all candidates" /> <a href="javascript:void(0);" onclick="exportFromPipeline()" title="Export selected candidates">Export</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <script type="text/javascript">
            	function exportFromPipeline(){
<?php
	$params = array(
			'sortBy' => 'dateModifiedSort',
			'sortDirection' => 'DESC',
	        'filterVisible' => false,
	        'rangeStart' => 0,
	        'maxResults' => 100000000,
	        'exportIDs' => '<dynamic>',
	        'noSaveParameters' => true);

	$instance_name = 'candidates:candidatesListByViewDataGrid';
	$instance_md5 = md5($instance_name);
?>
					var exportArray<?= $instance_md5 ?> = getSelected_candidates();
            		if (exportArray<?= $instance_md5 ?>.length>0) {
                		window.location.href='<?= CATSUtility::getIndexName()?>?m=export&a=exportByDataGrid&i=<?= urlencode($instance_name); ?>&p=<?= urlencode(serialize($params)) ?>&dynamicArgument<?= $instance_md5 ?>=' + urlEncode(serializeArray(exportArray<?= $instance_md5 ?>));
            		} else {
                		alert('No data selected');
            		}
            	}


            </script>
            <script type="text/javascript">
                PipelineJobOrder_populate(<?php $this->_($this->data['jobOrderID']); ?>, 0, <?php $this->_($this->pipelineEntriesPerPage); ?>, 'dateCreatedInt', 'desc', <?php if ($this->isPopup) echo(1); else echo(0); ?>, 'ajaxPipelineTable', '<?php echo($this->sessionCookie); ?>', 'ajaxPipelineTableIndicator', '<?php echo(CATSUtility::getIndexName()); ?>');
            </script>

<?php if (!$this->isPopup): ?>
            <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT  && $this->accessLevel!= 370  && !isset($this->frozen)): ?>
                <a href="#" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=considerCandidateSearch&amp;jobOrderID=<?php echo($this->jobOrderID); ?>', 820, 550, null); return false;">
                    <img src="images/consider.gif" width="16" height="16" class="absmiddle" alt="add candidate" border="0" />&nbsp;Add Candidate to This Job Order Pipeline
                </a>
            <?php endif; ?>
            
            <?php if( $_SESSION['CATS']->getUserID()== $this->data['recruiter'] && $this->accessLevel== 370 ) {?>
			
			 <a href="#" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=considerCandidateSearch&amp;jobOrderID=<?php echo($this->jobOrderID); ?>', 820, 550, null); return false;">
                    <img src="images/consider.gif" width="16" height="16" class="absmiddle" alt="add candidate" border="0" />&nbsp;Add Candidate to This Job Order Pipeline
                </a>	
			<?php } ?>
        </div>
    </div>

<?php endif; ?>
<?php TemplateUtility::printFooter(); ?>
