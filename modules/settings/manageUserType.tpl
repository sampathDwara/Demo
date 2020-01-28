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

            <p class="note">User Roles</p>

            <table class="sortable">
                <thead>
                    <tr>
                        <th align="center">Active</th>	
                        <th align="left" nowrap="nowrap">Module Access</th>
                    </tr>
                </thead>

                <?php if (!empty($this->rs)): ?>
                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                            <td valign="top" align="left"><?php $this->_($data['userRole']); ?></td>
                            <td valign="top" align="left"><?php $this->_($data['moduleAccess']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </table>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>