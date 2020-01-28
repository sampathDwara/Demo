<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js', 'js/sorttable.js')); ?>
<div id="main">
        <div id="contents">
            <table width= "100%">
                <tr>
                    <td width="3%" valign="bottom">
                        <img src="images/settings.gif" width="24" height="24" border="0" alt="Settings" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td valign="bottom"><h2>Settings: Add User Type</h2></td>
                </tr>
            </table>

            <p class="note">Add User Type</p>

            <form name="addUserForm" id="addUserForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=addUserType" method="post" onsubmit="return checkAddUserForm(document.addUserForm);" autocomplete="off">
                <input type="hidden" name="postback" id="postback" value="postback" />				<input type="hidden" name="operation" id="operation" value="<?php echo($this->operation);?>" />				<input type="hidden" name="usertypeID" id="usertypeID" value="<?php echo($this->usertypeID);?>" />
                <table width="100%">
                    <tr>
                        <td align="left" valign="top">
                            <table class="editTable" width="100%">                                                            <tr>                                	<td class="tdVertical">&nbsp;</td>                                	<td class="tdData">&nbsp;</td>                                </tr>
                                <tr>
                                    <td class="tdVertical">
                                        <label id="firstNameLabel" for="firstName">User Type :</label>
                                    </td>
                                    <td class="tdData">                                        <input type="text" class="inputbox" id="userType" name="userType" style="width: 150px;" value="<?php echo($this->datas[0]['roleName']);?>" />&nbsp;*                                    </td>
                                </tr>                                <tr>                                    <td class="tdVertical">Active:</td>                                    <td class="tdData">										<select tabindex="10" id="isActive" name="isActive" class="inputbox" style="width: 150px;" onchange="disableAccessLevel();">										<?php if($this->datas[0]['isActive']==1):?>																					<option selected value="1">Active</option>											<option value="0">InActive</option>										<?php else:?>											<option value="1">Active</option>											<option selected value="0">InActive</option>																				<?php endif?>											</select>&nbsp;*                                    </td>                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="moduleLabel" for="module">Modules:</label>
                                    </td>
                                    <td class="tdData">										<?php $cnt=1?>
										<?php foreach ($this->ModuleList as $rowNumber => $ModuleListData): ?>											<input type='checkbox' name="module[]" id="<?php $this->_($ModuleListData['module_schema_id']) ?>" value='<?php $this->_($ModuleListData['module_schema_id']); ?>'><?php $this->_($ModuleListData['module_name']); ?>											<?php if($cnt % 3 == 0): {echo "</br>";} endif?>										<?php $cnt= $cnt+1; ?>										<?php endforeach; ?>                                    </td>
                                </tr>                                <tr>                                	<td class="tdVertical">&nbsp;</td>                                	<td class="tdData">&nbsp;</td>                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <input type="submit" class="button" id="submit"   value="Save" onclick="parentGoToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=manageUserType');"/>                <input type="button" class="button" name="close" value="Close" onclick="parentHidePopWin();" />
            </form>
        </div>
    </div><script language="javascript"><?php if($this->operation == "edit"): ?>	<?php foreach ($this->userlistModule as $rowNumber => $userlistModuleData): ?>	<?php //"module".$this->_($userlistModuleData['module_schema_id']) ?>				var option_str = document.getElementById('<?php "module".$this->_($userlistModuleData['module_schema_id']) ?>');		option_str.checked = true;						<?php endforeach; ?><?php endif?></script>