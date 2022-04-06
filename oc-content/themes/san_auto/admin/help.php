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
 ?>
<?php if ( (!defined('ABS_PATH')) ) exit('ABS_PATH is not loaded. Direct access is not allowed.'); ?>
<?php if ( !OC_ADMIN ) exit('User access is not allowed.'); ?>
<div class="admin-content">
        <h2 class="admin-title"><i class="far fa-file"></i>  <?php _e('Setup assistance', 'san_auto'); ?></h2>
        <ul>
            <strong><?php _e('Control of the size of images', 'san_auto'); ?></strong>
            <li><a href="<?php echo osc_admin_base_url(true).'?page=settings&amp;action=media'; ?>" target="_blank" style="color: #018be3!important;"><?php _e('The panel of the administrator - Settings -> Media:', 'san_auto'); ?></a> </li>
        	 <li><?php _e('Disable - Force image aspect. No white background will be added to keep the size.', 'san_auto'); ?></li>
        	 <li><?php _e('Enable - Use ImageMagick instead of GD library', 'san_auto'); ?></li>
            <br />
            <br />
            <strong><?php _e('Plugins for theme', 'san_auto'); ?></strong>
        	 <li><?php _e('For the theme to work correctly, install all plugins in the theme file plugins.zip', 'san_auto'); ?></li>
             <br />
             <br />
             <strong><?php _e('Delete items', 'san_auto'); ?></strong>
        	 <li><?php _e('If you can not delete ads, use the plugin', 'san_auto'); ?> <a href="https://market.osclass.org/plugins/ad-management/ghostbuster_83" target="_blank" style="color: #018be3!important;"><?php _e('Ghostbuster', 'san_auto'); ?></a> </li>
             <br />
             <br />
             <strong><?php _e('Setting plugin Car-attributes', 'san_auto'); ?></strong>
         	 <li><?php _e('To install a car brand logo, you need to upload a png logo in the folder', 'san_auto'); ?>:<br />
             <i style="background:#eee; padding: 2px 5px;"><?= osc_current_web_theme_url(); ?>/images/makes/</i>
             <?php _e(' Name the logo with the brand number id', 'san_auto'); ?><br />
             <?php _e('Example: ', 'san_auto'); ?> <i style="background:#eee; padding: 2px 5px;"><?= osc_current_web_theme_url(); ?>/images/makes/1.png</i>
             <a href="<?php echo osc_admin_base_url(true).'?page=plugins&action=renderplugin&route=cars-admin-conf&section=makes';?>" style="color: #018be3!important;" target="_blank"><?php _e('view id', 'san_auto'); ?></a>  </li>
             <br />
             <br />
        </ul>
</div>
