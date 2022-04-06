<?php

    /*
    *       San-Auto Osclass Themes
    *
    *       Copyright (C) 2019 https://san-osclass.com/
    *
    *       This is san_auto Osclass Themes with Single License
    *
    *       This program is a commercial software. Copying or distribution without a license is not allowed.
    *
    */

    if ( (!defined('ABS_PATH')) ) exit('ABS_PATH is not loaded. Direct access is not allowed.');
    if ( !OC_ADMIN ) exit('User access is not allowed.');
 ?>
 <?php if( is_writable( osc_uploads_path()) ) { ?>
 	<div class="admin-content">
 		<h2 class="admin-title"><i class="far fa-image"></i> <?php _e('Header logo preview', 'san_auto'); ?></h2>
 			<?php
 			    $logo_prefence = osc_get_preference('logo', 'san_auto');
 			?>
 		<?php if($logo_prefence) { ?>
 			<img border="0" class="logo-auto" alt="<?php echo osc_esc_html( osc_page_title() ); ?>" src="<?php echo san_auto_logo_url().'?'.filemtime(osc_uploads_path() . osc_get_preference('logo','san_auto'));?>" />
 			<form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/header-logo.php');?>" method="post" enctype="multipart/form-data" class="nocsrf">
 				<input type="hidden" name="action_specific" value="remove_header" />
 				<fieldset>
 					<div class="form-horizontal">
 						<div class="admin-actions">
 							<button id="button_remove" type="submit" class="red"><i class="delete-ico"></i> <?php echo osc_esc_html(__('Remove','san_auto')); ?></button>
 						</div>
 					</div>
 				</fieldset>
 			</form>
 		<?php } else { ?>
 			<div class="flashmessage flashmessage-warning flashmessage-inline">
 				<p><?php _e('No logo has been uploaded yet', 'san_auto'); ?></p>
 			</div>
 		<?php } ?>
 	</div>
 	<div class="admin-content">
 		<h2 class="admin-title"><i class="fas fa-upload"></i> <?php _e('Upload logo', 'san_auto') ?></h2>
 		<p> <?php _e('The preferred size of the logo is 200x80.', 'san_auto'); ?></p>
 		<p><?php _e('When new logo is uploaded, do not forget to clean your browser cache (CTRL + R or CTRL + F5)', 'san_auto'); ?></p>
 		<?php if( $logo_prefence ) { ?>
 			<div class="flashmessage flashmessage-inline flashmessage-warning">
 				<p>
 					<?php _e('<strong>Note:</strong> Uploading another logo will overwrite the current logo.', 'san_auto'); ?>
 				</p>
 			</div>
 		<?php } ?>
 			<form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/header-logo.php'); ?>" method="post" enctype="multipart/form-data" class="nocsrf">
 			<input type="hidden" name="action_specific" value="upload_logo_header" />
 				<fieldset>
 					<div class="form-horizontal">
 						<div class="form-row">
 							<div class="form-label">
 								<?php _e('Logo image (png,gif,jpg)','san_auto'); ?>
 							</div>
 							<div class="form-controls">
 								<input type="file" name="logo" id="package" />
 							</div>
 						</div>
 						<div class="admin-actions">
 							<button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Upload','san_auto')); ?></button>
 						</div>
 					</div>
 				</fieldset>
 			</form>
 	</div>
 <?php } else { ?>
 		<div class="flashmessage flashmessage-error">
 		  <p>
 		    <?php
                 $info  = sprintf(__('The images folder <strong>%s</strong> is not writable on your server', 'san_auto'), WebThemes::newInstance()->getCurrentThemePath() ."images/" ) .", ";
                 $info .= __("Osclass can't upload the logo image from the administration panel.", 'san_auto') . ' ';
                 $info .= __('Please make the aforementioned image folder writable.', 'san_auto') . ' ';
                 echo $info;
             ?>
 		  </p>
 		  <p>
 		    <?php _e('To make a directory writable under UNIX execute this command from the shell:','san_auto'); ?>
 		  </p>
 		  <p class="command"> chmod a+w <?php echo WebThemes::newInstance()->getCurrentThemePath() ."images/"; ?> </p>
 		</div>
 <?php } ?>
