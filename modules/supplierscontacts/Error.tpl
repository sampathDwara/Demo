<?php /* $Id: Error.tpl 1528 2007-01-22 00:51:45Z will $ */ ?>
<?php TemplateUtility::printHeader('SuppliersContacts'); ?>
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
                    <td><h2>SuppliersContacts: Error</h2></td>
                </tr>
            </table>

            <p class="fatalError">
                A fatal error has occurred.<br />
                <br />
                <?php echo($this->errorMessage); ?>
            </p>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
