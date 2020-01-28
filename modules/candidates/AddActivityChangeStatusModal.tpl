<?php /* $Id: AddActivityChangeStatusModal.tpl 3799 2007-12-04 17:54:36Z brian $ */ ?>
<?php if ($this->isJobOrdersMode): ?>
    <?php TemplateUtility::printModalHeader('Job Orders', array('modules/candidates/activityvalidator.js', 'js/activity.js'), 'Job Orders: Log Activity'); ?>
<?php elseif ($this->onlyScheduleEvent): ?>
    <?php TemplateUtility::printModalHeader('Candidates', array('modules/candidates/activityvalidator.js', 'js/activity.js'), 'Candidates: Schedule Event'); ?>
<?php else: ?>
    <?php TemplateUtility::printModalHeader('Candidates', array('modules/candidates/activityvalidator.js', 'js/activity.js'), 'Candidates: Log Activity'); ?>
<?php endif; ?>

<?php if (!$this->isFinishedMode): ?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> 
<script type="text/javascript">

    

    <?php if ($this->isJobOrdersMode): ?>
        statusesArray = new Array(1);
        jobOrdersArray = new Array(1);
        statusesArrayString = new Array(1);
        jobOrdersArrayStringTitle = new Array(1);
        jobOrdersArrayStringCompany = new Array(1);
        statusesArray[0] = <?php echo($this->pipelineData['statusID']); ?>;
        statusesArrayString[0] = '<?php echo($this->pipelineData['status']); ?>';
        jobOrdersArray[0] = <?php echo($this->pipelineData['jobOrderID']); ?>;
        jobOrdersArrayStringTitle[0] = '<?php echo(str_replace("'", "\\'", $this->pipelineData['title'])); ?>';
        jobOrdersArrayStringCompany[0] = '<?php echo(str_replace("'", "\\'", $this->pipelineData['companyName'])); ?>';
    <?php else: ?>
        <?php $count = count($this->pipelineRS); ?>
        statusesArray = new Array(<?php echo($count); ?>);
        jobOrdersArray = new Array(<?php echo($count); ?>);
        statusesArrayString = new Array(<?php echo($count); ?>);
        jobOrdersArrayStringTitle = new Array(<?php echo($count); ?>);
        jobOrdersArrayStringCompany = new Array(<?php echo($count); ?>);
        <?php for ($i = 0; $i < $count; ++$i): ?>
            statusesArray[<?php echo($i); ?>] = <?php echo($this->pipelineRS[$i]['statusID']); ?>;
            statusesArrayString[<?php echo($i); ?>] = '<?php echo($this->pipelineRS[$i]['status']); ?>';
            jobOrdersArray[<?php echo($i); ?>] = <?php echo($this->pipelineRS[$i]['jobOrderID']); ?>;
            jobOrdersArrayStringTitle[<?php echo($i); ?>] = '<?php echo(str_replace("'", "\\'", $this->pipelineRS[$i]['title'])); ?>';
            jobOrdersArrayStringCompany[<?php echo($i); ?>] = '<?php echo(str_replace("'", "\\'", $this->pipelineRS[$i]['companyName'])); ?>';
        <?php endfor; ?>
    <?php endif; ?>
    statusTriggersEmailArray = new Array(<?php echo(count($this->statusRS)); ?>);
    <?php foreach ($this->statusRS as $rowNumber => $statusData): ?>
       statusTriggersEmailArray[<?php echo($rowNumber); ?>] = <?php echo($statusData['triggersEmail']); ?>;
    <?php endforeach; ?>
</script>

    <form name="changePipelineStatusForm" id="changePipelineStatusForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=<?php if ($this->isJobOrdersMode): ?>joborders<?php else: ?>candidates<?php endif; ?>&amp;a=addActivityChangeStatus<?php if ($this->onlyScheduleEvent): ?>&amp;onlyScheduleEvent=true<?php endif; ?>" method="post" onsubmit="return checkActivityForm(document.changePipelineStatusForm);" autocomplete="off">
        <input type="hidden" name="postback" id="postback" value="postback" />
        <input type="hidden" id="candidateID" name="candidateID" value="<?php echo($this->candidateID); ?>" />
<?php if ($this->isJobOrdersMode): ?>
        <input type="hidden" id="regardingID" name="regardingID" value="<?php echo($this->selectedJobOrderID); ?>" />
<?php endif; ?>

        <table class="editTable" width="560">
            <tr id="visibleTR" <?php if ($this->onlyScheduleEvent): ?>style="display:none;"<?php endif; ?>>
                <td class="tdVertical">
                    <label id="regardingIDLabel" for="regardingID">Regarding:</label>
                </td>
                <td class="tdData">
<?php if ($this->isJobOrdersMode): ?>
                    <span><?php $this->_($this->pipelineData['title']); ?></span>
<?php else: ?>
                    <select id="regardingID" name="regardingID" class="inputbox" style="width: 150px;" onchange="AS_onRegardingChange(statusesArray, jobOrdersArray, 'regardingID', 'statusID', 'statusTR', 'sendEmailCheckTR', 'triggerEmail', 'triggerEmailSpan', 'changeStatus', 'changeStatusSpanA', 'changeStatusSpanB');">
                        <option value="-1">General</option>

                        <?php foreach ($this->pipelineRS as $rowNumber => $pipelinesData): ?>
                            <?php if ($this->selectedJobOrderID == $pipelinesData['jobOrderID']): ?>
                                <option selected="selected" value="<?php $this->_($pipelinesData['jobOrderID']) ?>"><?php $this->_($pipelinesData['title']) ?></option>
                            <?php else: ?>
                                <option value="<?php $this->_($pipelinesData['jobOrderID']) ?>"><?php $this->_($pipelinesData['title']) ?> (<?php $this->_($pipelinesData['companyName']) ?>)</option>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </select>
<?php endif; ?>
                </td>
            </tr>

            <tr id="statusTR" <?php if ($this->onlyScheduleEvent): ?>style="display:none;"<?php endif; ?>>
                <td class="tdVertical">
                    <label id="statusIDLabel" for="statusID">Status:</label>
                </td>
                <td class="tdData">
                    <input type="checkbox" name="changeStatus" id="changeStatus" style="margin-left: 0px" onclick="AS_onChangeStatusChange('changeStatus', 'statusID', 'changeStatusSpanB');"<?php if ($this->selectedJobOrderID == -1 || $this->onlyScheduleEvent): ?> disabled<?php endif; ?> />
                    <span id="changeStatusSpanA"<?php if ($this->selectedJobOrderID == -1): ?> style="color: #aaaaaa;"<?php endif;?>>Change Status</span><br />

                    <div id="changeStatusDiv" style="margin-top: 4px;">
                        <select id="statusID" name="statusID" class="inputbox" style="width: 150px;" onchange="AS_onStatusChange(statusesArray, jobOrdersArray, 'regardingID', 'statusID', 'sendEmailCheckTR', 'triggerEmailSpan', 'activityNote', 'activityTypeID', <?php if ($this->isJobOrdersMode): echo $this->selectedJobOrderID; else: ?>null<?php endif; ?>, 'customMessage', 'origionalCustomMessage', 'triggerEmail', statusesArrayString, jobOrdersArrayStringTitle, jobOrdersArrayStringCompany, statusTriggersEmailArray, 'emailIsDisabled');" disabled>
                            <option value="-1">(Select a Status)</option>

                            <?php if ($this->selectedStatusID == -1): ?>
                                <?php foreach ($this->statusRS as $rowNumber => $statusData): ?>
                                    <option value="<?php $this->_($statusData['statusID']) ?>"><?php $this->_($statusData['status']) ?></option>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <?php foreach ($this->statusRS as $rowNumber => $statusData): ?>
                                    <option <?php if ($this->selectedStatusID == $statusData['statusID']): ?>selected <?php endif; ?>value="<?php $this->_($statusData['statusID']) ?>"><?php $this->_($statusData['status']) ?></option>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </select>
                        <span id="changeStatusSpanB" style="color: #aaaaaa;">&nbsp;*</span>&nbsp;&nbsp;
                        <span id="triggerEmailSpan" style="display: none;"><input type="checkbox" name="triggerEmail" id="triggerEmail" onclick="AS_onSendEmailChange('triggerEmail', 'sendEmailCheckTR', 'visibleTR');" />Send E-Mail Notification to Candidate</span>
                    </div>
                </td>
            </tr>
            <tr id="sendEmailCheckTR" style="display: none;">
                <td class="tdVertical">
                    <label id="triggerEmailLabel" for="triggerEmail">E-Mail:</label>
                </td>
                <td class="tdData">
                    Custom Message<br />
                    <input type="hidden" id="origionalCustomMessage" value="<?php $this->_($this->statusChangeTemplate); ?>" />
                    <input type="hidden" id="emailIsDisabled" value="<?php echo($this->emailDisabled); ?>" />
                    <textarea style="height:135px; width:375px;" name="customMessage" id="customMessage" cols="50" class="inputbox"></textarea>
                </td>
            </tr>
            <tr id="contactedTR" class="additionaloptons">
                <td class="tdVertical">
                    <label id="triggerEmailLabel" for="triggerEmail">Contact Details:</label>
                </td>
                <td class="tdData">
                    Best time of day to contact you?<br />                    
                    <input type="text" id="contact_besttime" name="contact_besttime" value="<?php echo($this->contact_besttime); ?>" /><br /> 
                    Where are you located?<br />                    
                    <input type="text" id="contact_location" name="contact_location" value="<?php echo($this->contact_location); ?>" /><br /> 
                    How far are you willing to travel for work on a daily basis?<br />                    
                    <input type="text" id="contact_preferred_traveltime" name="contact_preferred_traveltime" value="<?php echo($this->contact_preferred_traveltime); ?>" /><br />                    Typing Speed?<br />                    
                    <input type="text" id="contact_typing_speed" name="contact_typing_speed" value="<?php echo($this->contact_typing_speed); ?>" /><br /> 
                    Current Pay?<br />                    
                    <input type="text" id="contact_pay_current" name="contact_pay_current" value="<?php echo($this->contact_pay_current); ?>" /><br /> 
                    Pay expectation?<br />                    
                    <input type="text" id="contact_pay_expectation" name="contact_pay_expectation" value="<?php echo($this->contact_pay_expectation); ?>" /><br /> 
                    How soon can you start?<br />                    
                    <input type="text" id="contact_howsoonstart" name="contact_howsoonstart" value="<?php echo($this->contact_howsoonstart); ?>" /><br /> 
                    Key Skills/Area of expertise?<br />                    
                    <input type="text" id="contact_keyskills" name="contact_keyskills" value="<?php echo($this->contact_keyskills); ?>" /><br /> 
                    Anything else we should know about you?<br />                    
                    <input type="text" id="contact_otherdetails" name="contact_otherdetails" value="<?php echo($this->contact_otherdetails); ?>" /><br /> 

                   
                </td>
            </tr>
            <tr id="SubmittedTR" class="additionaloptons">
                <td class="tdVertical">
                    <label id="confirmedpayratelabel" for="confirmedconfirmedpayrate">Cadidate Confirmed Pay Rate:</label>
                </td>
                <td class="tdData">
                                      
                    <input type="text" name="confirmedconfirmedpayrate" id="confirmedconfirmedpayrate" value="<?php echo($this->confirmedconfirmedpayrate); ?>" />
                   
                </td>
            </tr>
            <tr id="InterviewRequestedTR" class="additionaloptons">
                <td class="tdVertical">
                    <label id="interviewschedulelabel" for="interviewschedulerequested">Interview Requested Schedule:</label>
                </td>
                <td class="tdData">                
                    <input type="text" id="interviewschedulerequested" name="interviewschedulerequested" value="<?php echo($this->interviewschedulerequested); ?>" />
                   <textarea style="height:135px; width:375px;" name="interviewschedulecustomMessage" id="interviewschedulecustomMessage" cols="50" class="inputbox"></textarea>
                </td>
            </tr>
            <tr id="InterviewConfirmedTR" class="additionaloptons">
                <td class="tdVertical">
                    <label id="interviewdateLabel" for="interviewdate">Interview Confirmed Date & Time:</label>
                </td>
                <td class="tdData">                
                    <input type="text" id="interviewconfirmeddate" name="interviewconfirmeddate" value="<?php echo($this->interviewconfirmeddate); ?>" />  <input type="text" id="interviewtime" name="interviewtime" value="<?php echo($this->interviewtime); ?>" />
                   <textarea style="height:135px; width:375px;" name="interviewconfirmedcustomMessage" id="interviewconfirmedcustomMessage" cols="50" class="inputbox"></textarea>
                </td>
            </tr>
            <tr id="InterviewLostTR" class="additionaloptons">
                <td class="tdVertical">
                    <label id="insterviewLostReasonLabel" for="insterviewLostReason">Reasons Interview Lost:</label>
                </td>
                <td class="tdData">
                  <select id="insterviewLostReasonID" name="insterviewlostreason" class="inputbox" style="width: 150px; margin-bottom: 4px;">
                            <option selected="selected" value="">Selct Reason</option>
                            <option value="Candidate Unresponsive">Candidate Unresponsive</option>
                            <option value="Candidate Declined interview">Candidate declined interview</option>
                            <option value="Client Cancelled Interview">Client Cancelled Interview</option>
                            <option value="Client Chose Different Candidate">Client Chose Different Candidate</option>
                            
                        </select>  
                </td>
            </tr>
            <tr id="CandidateSelectedTR" class="additionaloptons">
                <td class="tdVertical">
                    <label id="candidateselectedLabel" for="candidateselected">Candidate Selected- Start Date:</label>
                </td>
                <td class="tdData">                
                    <input type="text" id="candidatestartdate" name="candidatestartdate" value="<?php echo($this->candidatestartdate); ?>" /> 
                </td>
            </tr>
            <tr id="CandidatePlacedTR" class="additionaloptons">
                <td class="tdVertical">
                    <label id="candidateplacedLabel" for="candidateplaced">Candidate Placed- Start Date:</label>
                </td>
                <td class="tdData">                
                    <input type="text" id="candidateplaceddate" name="candidateplaceddate" value="<?php echo($this->candidateplaceddate); ?>" />
                </td>
            </tr>
           
           
           
           <tr id="sendEmailCheckTR" style="display: none;">
                <td class="tdVertical">
                    <label id="triggerEmailLabel" for="triggerEmail">E-Mail:</label>
                </td>
                <td class="tdData">
                    Custom Message<br />
                    <input type="hidden" id="origionalCustomMessage" value="<?php $this->_($this->statusChangeTemplate); ?>" />
                    <input type="hidden" id="emailIsDisabled" value="<?php echo($this->emailDisabled); ?>" />
                    <textarea style="height:135px; width:375px;" name="customMessage" id="customMessage" cols="50" class="inputbox"></textarea>
                </td>
            </tr>
           <tr id="addActivityTR" <?php if ($this->onlyScheduleEvent): ?>style="display:none;"<?php endif; ?>>
                <td class="tdVertical">
                    <label id="addActivityLabel" for="addActivity">Activity:</label>
                </td>
                <td class="tdData">
                    <input type="checkbox" name="addActivity" id="addActivity" style="margin-left: 0px;"<?php if (!$this->onlyScheduleEvent): ?> checked="checked"<?php endif; ?> onclick="AS_onAddActivityChange('addActivity', 'activityTypeID', 'activityNote', 'addActivitySpanA', 'addActivitySpanB');" />Log an Activity<br />
                    <div id="activityNoteDiv" style="margin-top: 4px;">
                        <span id="addActivitySpanA">Activity Type</span><br />
                        <select id="activityTypeID" name="activityTypeID" class="inputbox" style="width: 150px; margin-bottom: 4px;">
                            <option selected="selected" value="<?php echo(ACTIVITY_CALL); ?>">Call</option>
                            <option value="<?php echo(ACTIVITY_CALL_TALKED); ?>">Call (Talked)</option>
                            <option value="<?php echo(ACTIVITY_CALL_LVM); ?>">Call (LVM)</option>
                            <option value="<?php echo(ACTIVITY_CALL_MISSED); ?>">Call (Missed)</option>
                            <option value="<?php echo(ACTIVITY_EMAIL); ?>">E-Mail</option>
                            <option value="<?php echo(ACTIVITY_MEETING); ?>">Meeting</option>
                            <option value="<?php echo(ACTIVITY_OTHER); ?>">Other</option>
                        </select><br />
                        <span id="addActivitySpanB">Activity Notes</span><br />
                        <textarea name="activityNote" id="activityNote" cols="50" style="margin-bottom: 4px;" class="inputbox"></textarea>
                    </div>
                </td>
            </tr>

            <tr id="scheduleEventTR">
                <td class="tdVertical">
                    <label id="scheduleEventLabel" for="scheduleEvent">Schedule Event:</label>
                </td>
                <td class="tdData">
                    <input type="checkbox" name="scheduleEvent" id="scheduleEvent" style="margin-left: 0px; <?php if ($this->onlyScheduleEvent): ?>display:none;<?php endif; ?>" onclick="AS_onScheduleEventChange('scheduleEvent', 'scheduleEventDiv');"<?php if ($this->onlyScheduleEvent): ?> checked="checked"<?php endif; ?> /><?php if (!$this->onlyScheduleEvent): ?>Schedule Event<?php endif; ?>
                    <div id="scheduleEventDiv" <?php if (!$this->onlyScheduleEvent): ?>style="display:none;"<?php endif; ?>>
                        <table style="border: none; margin: 0px; padding: 0px;">
                            <tr>
                                <td valign="top">
                                    <div style="margin-bottom: 4px;">
                                        <select id="eventTypeID" name="eventTypeID" class="inputbox" style="width: 150px;">
                                            <?php foreach ($this->calendarEventTypes as $eventType): ?>
                                                <option <?php if ($eventType['typeID'] == CALENDAR_EVENT_INTERVIEW): ?>selected="selected" <?php endif; ?>value="<?php echo($eventType['typeID']); ?>"><?php $this->_($eventType['description']); ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>

                                    <div style="margin-bottom: 4px;">
                                        <script type="text/javascript">DateInput('dateAdd', true, 'MM-DD-YY', '', -1);</script>
                                    </div>

                                    <div style="margin-bottom: 4px;">
                                        <input type="radio" name="allDay" id="allDay0" value="0" style="margin-left: 0px" checked="checked" onchange="AS_onEventAllDayChange('allDay1');" />
                                        <select id="hour" name="hour" class="inputbox" style="width: 40px;">
                                            <?php for ($i = 1; $i <= 12; ++$i): ?>
                                                <option value="<?php echo($i); ?>"><?php echo(sprintf('%02d', $i)); ?></option>
                                            <?php endfor; ?>
                                        </select>&nbsp;
                                        <select id="minute" name="minute" class="inputbox" style="width: 40px;">
                                            <?php for ($i = 0; $i <= 45; $i = $i + 15): ?>
                                                <option value="<?php echo(sprintf('%02d', $i)); ?>">
                                                    <?php echo(sprintf('%02d', $i)); ?>
                                                </option>
                                            <?php endfor; ?>
                                        </select>&nbsp;
                                        <select id="meridiem" name="meridiem" class="inputbox" style="width: 45px;">
                                            <option value="AM">AM</option>
                                            <option value="PM">PM</option>
                                        </select>
                                    </div>

                                    <div style="margin-bottom: 4px;">
                                        <input type="radio" name="allDay" id="allDay1" value="1" style="margin-left: 0px" onchange="AS_onEventAllDayChange('allDay1');" />All Day / No Specific Time<br />
                                    </div>

                                    <div style="margin-bottom: 4px;">
                                        <input type="checkBox" name="publicEntry" id="publicEntry" style="margin-left: 0px" />Public Entry
                                    </div>
                                </td>

                                <td valign="top">
                                    <div style="margin-bottom: 4px;">
                                        <label id="titleLabel" for="title">Title&nbsp;*</label><br />
                                        <input type="text" class="inputbox" name="title" id="title" style="width: 180px;" />
                                    </div>

                                    <div style="margin-bottom: 4px;">
                                        <label id="durationLabel" for="duration">Length:</label>
                                        <br />
                                        <select id="duration" name="duration" class="inputbox" style="width: 180px;">
                                            <option value="15">15 minutes</option>
                                            <option value="30">30 minutes</option>
                                            <option value="45">45 minutes</option>
                                            <option value="60" selected="selected">1 hour</option>
                                            <option value="90">1.5 hours</option>
                                            <option value="120">2 hours</option>
                                            <option value="180">3 hours</option>
                                            <option value="240">4 hours</option>
                                            <option value="300">More than 4 hours</option>
                                        </select>
                                    </div>
                                    
                                    <div style="margin-bottom: 4px;">
                                        <label id="descriptionLabel" for="description">Description</label><br />
                                        <textarea name="description" id="description" cols="20" class="inputbox" style="width: 180px; height:60px;"></textarea>
                                    </div>

                                    <div <?php if (!$this->allowEventReminders): ?>style="display:none;"<?php endif; ?>>
                                        <input type="checkbox" name="reminderToggle" onclick="if (this.checked) document.getElementById('reminderArea').style.display = ''; else document.getElementById('reminderArea').style.display = '';">&nbsp;<label>Set Reminder</label><br />
                                    </div>
                                    
                                    <div style="display:none;" id="reminderArea">
                                        <div>
                                            <label>E-Mail To:</label><br />
                                            <input type="text" id="sendEmail" name="sendEmail" class="inputbox" style="width: 150px" value="<?php $this->_($this->userEmail); ?>" />
                                        </div>
                                        <div>
                                            <label>Time:</label><br />
                                            <select id="reminderTime" name="reminderTime" style="width: 150px">
                                                <option value="15">15 min early</option>
                                                <option value="30">30 min early</option>
                                                <option value="45">45 min early</option>
                                                <option value="60">1 hour early</option>
                                                <option value="120">2 hours early</option>
                                                <option value="1440">1 day early</option>
                                            </select>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>

        </table>
        <p class="noteUnsized">Supplier Information</p>
                             <table class="editTable" width="100%" >
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
        <input type="submit" class="button" name="submit" id="submit" value="Save" />&nbsp;
<?php if ($this->isJobOrdersMode): ?>
        <input type="button" class="button" name="close" value="Cancel" onclick="parentGoToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=show&amp;jobOrderID=<?php echo($this->selectedJobOrderID); ?>');" />
<?php else: ?>
        <input type="button" class="button" name="close" value="Cancel" onclick="parentGoToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=show&amp;candidateID=<?php echo($this->candidateID); ?>');" />
<?php endif; ?>
    </form>

    <script type="text/javascript">
        document.changePipelineStatusForm.activityNote.focus();
    </script>

<?php else: ?>
    <?php if (!$this->changesMade): ?>
        <p>No changes have been made.</p>
    <?php else: ?>
         <?php if (!$this->onlyScheduleEvent): ?>
            <?php //FIXME: E-mail stuff. ?>
            <?php if ($this->statusChanged): ?>
                <p>The candidate's status has been changed from <span class="bold"><?php $this->_($this->oldStatusDescription); ?></span> to <span class="bold"><?php $this->_($this->newStatusDescription); ?></span>.</p>
            <?php else: ?>
                <p>The candidate's status has not been changed.</p>
            <?php endif; ?>

            <?php if ($this->activityAdded): ?>
                <?php if (!empty($this->activityDescription)): ?>
                    <p>An activity entry of type <span class="bold"><?php $this->_($this->activityType); ?></span> has been added with the following note: &quot;<?php echo($this->activityDescription); ?>&quot;.</p>
                <?php else: ?>
                    <p>An activity entry of type <span class="bold"><?php $this->_($this->activityType); ?></span> has been added with no notes.</p>
                <?php endif; ?>
            <?php else: ?>
                <p>No activity entries have been added.</p>
            <?php endif; ?>
        <?php endif; ?>
    <?php endif; ?>

    <?php echo($this->eventHTML); ?>

    <?php echo($this->notificationHTML); ?>

    <form>
<?php if ($this->isJobOrdersMode): ?>
        <input type="button" name="close" class="button" value="Close" onclick="parentGoToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=show&amp;jobOrderID=<?php echo($this->regardingID); ?>');" />
<?php else: ?>
        <input type="button" name="close" class="button" value="Close" onclick="parentGoToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=show&amp;candidateID=<?php echo($this->candidateID); ?>');" />
<?php endif; ?>
    </form>
<?php endif; ?><script type="text/javascript">
 $(document).ready(function(){
        	$(".additionaloptons").hide();
   <?php if($this->selectedStatusID =='200'){ ?>
   	    $("#contactedTR").show(); 
   <?php }else if($this->selectedStatusID =='400'){ ?>    
        $("#SubmittedTR").show();    
   <?php }else if($this->selectedStatusID =='450'){ ?>    
	  	$("#InterviewRequestedTR").show();   
   <?php }else if($this->selectedStatusID =='500'){ ?>
	  	$("#InterviewConfirmedTR").show();   
   <?php }else if($this->selectedStatusID =='550'){ ?>
	  	$("#InterviewLostTR").show();    
   <?php }else if($this->selectedStatusID =='600'){ ?>
        $("#CandidateSelectedTR").show();
   <?php }else if($this->selectedStatusID =='650'){ ?>
        $("#CandidateSelectedTR").show();
   <?php }else if($this->selectedStatusID =='700'){ ?>
        $("#InterviewLostTR").show();
   <?php }else if($this->selectedStatusID =='750'){ ?>  
        $("#InterviewLostTR").show();
   <?php }else if($this->selectedStatusID =='800'){ ?>  
        $("#CandidatePlacedTR").show();
   <?php } ?>                                	
   $( "#statusID" ).change(function() {
	  $(".additionaloptons").hide();
	  var statustext = $('#statusID').find(":selected").text();
	  if(statustext=="Contacted"){
	  	$("#contactedTR").show();
	  }else if(statustext=="Submitted"){
	  	$("#SubmittedTR").show();
	  }else if(statustext=="Interview Requested"){
	  	$("#InterviewRequestedTR").show();
	  }else if(statustext=="Interview Confirmed"){
	  	$("#InterviewConfirmedTR").show();
	  }else if(statustext=="Interview Lost"){
	  	$("#InterviewLostTR").show();
	  }else if(statustext=="Candidate Selected"){
	  	$("#CandidateSelectedTR").show();
	  }else if(statustext=="Candidate Accepted/On boarding process"){
	  	$("#CandidateSelectedTR").show();
	  }else if(statustext=="Closure Lost - Candidate Declined"){
	  	$("#InterviewLostTR").show();
	  }else if(statustext=="Closure Lost - Client Declined"){
	  	$("#InterviewLostTR").show();
	  }else if(statustext=="Closure Won - Candidate Placed"){
	  	$("#CandidatePlacedTR").show();
	  }
	});
  
 });
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

    </body>
</html>
