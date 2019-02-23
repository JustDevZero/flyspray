<div>
<form action="index.php" method="post" name="database_form">
	<?php echo $message; ?>
	<h1><?php echo Filters::noXSS(L('administrationsetup')); ?></h1>
	<h2><?php echo Filters::noXSS(L('setupapplicationvalue')); ?></h2>
	<div class="installBlock">
<script type="text/javascript">
function ShowHidePassword(id) {
	if(document.getElementById(id).type=="text") {
		document.getElementById(id).type="password";
	} else {
		document.getElementById(id).type="text";
	}
}
</script>

	<p><?php echo L('adminsetuptip1'); ?></p>
	<p><?php echo L('adminsetuptip2'); ?></p>
	<p><?php echo L('adminsetuptip3'); ?></p>

	<table class="formBlock">
	<tr>
		<td style="text-align:right;vertical-align:top"><?= eL('adminusername') ?></td>
		<td style="text-align:left;vertical-align:top"><input class="inputbox" type="text" name="admin_username" value="<?php echo $admin_username; ?>" required="required" size="30" /></td>
		<td></td>
	</tr>
	<tr>
		<td style="text-align:right;vertical-align:top"><?= eL('adminrealname') ?></td>
		<td style="text-align:left;vertical-align:top"><input class="inputbox" type="text" name="admin_realname" value="<?php echo $admin_realname; ?>" size="30" /></td>
		<td></td>
	</tr>
	<tr>
		<td style="text-align:right;vertical-align:top"><?= eL('adminemail') ?></td>
		<td style="text-align:left;vertical-align:top"><input class="inputbox" type="text" name="admin_email" value="<?php echo $admin_email; ?>" required="required" size="30" /></td>
		<td></td>
	</tr>
	<tr>
		<td style="text-align:right;vertical-align:top"><?= eL('adminpassword') ?></td>
		<td style="text-align:left;vertical-align:top"><input class="inputbox" type="password" name="admin_password" id="admin_password" value="<?php echo $admin_password; ?>" required="required" size="30" /></td>
		<td style="text-align:left;vertical-align:top"><label for="showpassword"><?= eL('showpassword') ?></label><input type="checkbox" onclick="ShowHidePassword('admin_password')" id="showpassword"></td>
	</tr>
	<tr>
		<td style="text-align:right;vertical-align:top"><?= eL('syntax') ?></td>
		<td style="text-align:left;vertical-align:top">
			<select name="syntax_plugin">
			<option value="dokuwiki">Text/Dokuwiki</option>
			<option value="none">HTML/none</option>
			<option value="html">HTML/CKEditor</option>
			</select>
		</td>
		<td style="text-align:left;vertical-align:top"><?= L('syntaxtext') ?></td>
	</tr>
	<?php if ($daemonise): ?>
	<tr>
		<td style="text-align:right;vertical-align:top" title="<?= eL('scheduletitle') ?>"><?= eL('enablescheduling') ?></td>
		<td style="text-align:center;vertical-align:top"><?php echo $daemonise; ?></td>
	</tr>
	<?php endif; ?>
	</table>

	<input type="hidden" name="db_type" value="<?php echo Filters::noXSS($db_type); ?>" />
	<input type="hidden" name="db_hostname" value="<?php echo Filters::noXSS($db_hostname); ?>" />
	<input type="hidden" name="db_username" value="<?php echo Filters::noXSS($db_username); ?>" />
	<input type="hidden" name="db_password" value="<?php echo Filters::noXSS($db_password); ?>" />
	<input type="hidden" name="db_name" value="<?php echo Filters::noXSS($db_name); ?>" />
	<input type="hidden" name="db_prefix" value="<?php echo Filters::noXSS($db_prefix); ?>" />

	<p><?= eL('proceedtofinalsetuptext') ?></p>
	<input type="hidden" name="action" value="complete" />
	<button class="button" type="submit" name="next" value="<?= eL('next') ?> >>" ><?= eL('proceedtofinalsetup') ?></button>
		
	</div>
</form>
</div>
