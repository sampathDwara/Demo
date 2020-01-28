<?php /* $Id: Users.tpl 2452 2007-05-11 17:47:55Z brian $ */ ?>
<?php TemplateUtility::printHeader('Settings', 'js/sorttable.js'); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/settings.gif" width="24" height="24" alt="Settings" style="border: none; margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Settings: User Type Management</h2></td>
                </tr>
            </table>

            <p class="note">User Roles</p>                        <p>                        <?php if (AUTH_MODE != "ldap"): ?>                <a href="javascript:void(0);" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=addUserType&amp;operation=add', 600, 450, null);" style="">                    <img src="images/candidate_inline.gif" width="16" height="16" class="absmiddle" alt="add" style="border: none;" />&nbsp;Add User Type                </a>            <?php endif; ?>                        </p>

            <table class="sortable">
                <thead>
                    <tr>
                        <th align="center">Active</th>	                        						<th align="center" nowrap="nowrap">Action</th>						                        <th align="left" nowrap="nowrap">User Type</th>
                        <th align="left" nowrap="nowrap">Module Access</th>
                    </tr>
                </thead>

                <?php if (!empty($this->rs)): ?>
                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">                                                    <td valign="top" align="center">                            									<?php if (($data['isActive']) == '1'): ?>										<img src="images/actions/screen.gif" width="16" height="16" class="absmiddle" alt="UnBlock" border="0" />			                        <?php else: ?>			                                <img src="images/actions/screen_grey.gif" width="16" height="16" class="absmiddle" alt="Block" border="0" />			                        <?php endif; ?>                                                        </td>                        							<td valign="top" align="center">								<a href="javascript:void(0);" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=addUserType&amp;operation=edit&amp;usertypeID=<?php echo($data['roleId']); ?>', 600, 450, null);" style="">                                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />                                </a>																					</td>							
                            <td valign="top" align="left"><?php $this->_($data['userRole']); ?></td>
                            <td valign="top" align="left"><?php $this->_($data['moduleAccess']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </table>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
