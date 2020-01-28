<?php /* $Id: SuppliersContacts.tpl 3430 2007-11-06 20:44:51Z will $ */ ?>
<?php TemplateUtility::printHeader('SuppliersContacts', array('js/highlightrows.js', 'js/export.js', 'js/dataGrid.js', 'js/dataGridFilters.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <style type="text/css">
    div.addSuppliersContactsButton { background: #4172E3 url(images/nodata/supplierscontactsButton.jpg); cursor: pointer; width: 337px; height: 67px; }
    div.addSuppliersContactsButton:hover { background: #4172E3 url(images/nodata/supplierscontactsButton-o.jpg); cursor: pointer; width: 337px; height: 67px; }
    </style>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents"<?php echo !$this->totalSuppliersContacts ? ' style="background-color: #E6EEFF; padding: 0px;"' : ''; ?>>
            <?php if ($this->totalSuppliersContacts): ?>
            <table width="100%">
                <tr>
                    <td width="3%">
                        <img src="images/supplierscontact.gif" width="24" height="24" border="0" alt="SuppliersContacts" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>SuppliersContacts: Home</h2></td>
                    <td align="right">
                        <form name="supplierscontactsViewSelectorForm" id="supplierscontactsViewSelectorForm" action="<?php echo(CATSUtility::getIndexName()); ?>" method="get">
                            <input type="hidden" name="m" value="supplierscontacts" />
                            <input type="hidden" name="a" value="listByView" />

                            <table class="viewSelector">
                                <tr>
                                    <td valign="top" align="right" nowrap="nowrap">
                                        <?php $this->dataGrid->printNavigation(false); ?>
                                    </td>
                                    <td valign="top" align="right" nowrap="nowrap">
                                        <input type="checkbox" name="onlyMyCompanies" id="onlyMySuppliersContacts" <?php if ($this->dataGrid->getFilterValue('OwnerID') ==  $this->userID): ?>checked<?php endif; ?> onclick="<?php echo $this->dataGrid->getJSAddRemoveFilterFromCheckbox('OwnerID', '==',  $this->userID); ?>" />
                                        <label for="onlyMySuppliersContacts">Only My SuppliersContacts</label>&nbsp;
                                    </td>
                                    <td valign="top" align="right" nowrap="nowrap">
                                        <input type="checkbox" name="onlyHotCompanies" id="onlyHotSuppliersContacts" <?php if ($this->dataGrid->getFilterValue('IsHot') == '1'): ?>checked<?php endif; ?> onclick="<?php echo $this->dataGrid->getJSAddRemoveFilterFromCheckbox('IsHot', '==', '\'1\''); ?>" />
                                        <label for="onlyHotSuppliersContacts">Only Hot SuppliersContacts</label>&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>

            <?php if ($this->errMessage != ''): ?>
            <div id="errorMessage" style="padding: 25px 0px 25px 0px; border-top: 1px solid #800000; border-bottom: 1px solid #800000; background-color: #f7f7f7;margin-bottom: 15px;">
            <table>
                <tr>
                    <td align="left" valign="center" style="padding-right: 5px;">
                        <img src="images/large_error.gif" align="left">
                    </td>
                    <td align="left" valign="center">
                        <span style="font-size: 12pt; font-weight: bold; color: #800000; line-height: 12pt;">There was a problem with your request:</span>
                        <div style="font-size: 10pt; font-weight: bold; padding: 3px 0px 0px 0px;"><?php echo $this->errMessage; ?></div>
                    </td>
                </tr>
            </table>
            </div>
            <?php endif; ?>

            <p class="note">
                <span style="float:left;">
                    SuppliersContacts - Page <?php echo($this->dataGrid->getCurrentPageHTML()); ?>
                    (<?php echo($this->dataGrid->getNumberOfRows()); ?> Items)
                    <?php if ($this->dataGrid->getFilterValue('OwnerID') ==  $this->userID): ?>(Only My SuppliersContacts)<?php endif; ?>
                    <?php if ($this->dataGrid->getFilterValue('IsHot') == '1'): ?>(Only Hot SuppliersContacts)<?php endif; ?>
                </span>
                <span style="float:right;">
                    <?php $this->dataGrid->drawRowsPerPageSelector(); ?>
                    <?php $this->dataGrid->drawShowFilterControl(); ?>
                </span>&nbsp;
            </p>

            <?php $this->dataGrid->drawFilterArea(); ?>
            <?php $this->dataGrid->draw();  ?>

            <div style="display:block;">
                <span style="float:left;">
                    <?php $this->dataGrid->printActionArea(); ?>
                </span>
                <span style="float:right;">
                    <?php $this->dataGrid->printNavigation(true); ?>
                </span>&nbsp;
            </div>

            <?php else: ?>

            <br /><br /><br /><br />
            <div style="height: 95px; background: #E6EEFF url(images/nodata/supplierscontactsTop.jpg);">
                &nbsp;
            </div>
            <br /><br />
                <?php if ($this->accessLevel >= ACCESS_LEVEL_EDIT): ?>
            <table cellpadding="0" cellspacing="0" border="0" width="956">
                <tr>
                <td style="padding-left: 62px;" align="center" valign="center">

                    <div style="text-align: center; width: 600px; line-height: 22px; font-size: 18px; font-weight: bold; color: #666666; padding-bottom: 20px;">
                    Add supplierscontacts to keep track of people you work with.
                    </div>

                    <a href="<?php echo CATSUtility::getIndexName(); ?>?m=supplierscontacts&amp;a=add">
                    <div class="addSuppliersContactsButton">&nbsp;</div>
                    </a>
                </td>

                </tr>
            </table>
                <?php endif; ?>

            <?php endif; ?>

        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
