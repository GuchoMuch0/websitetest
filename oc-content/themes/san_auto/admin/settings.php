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
<link rel="stylesheet" href="//use.fontawesome.com/releases/v5.6.3/css/all.css" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i&display=swap&subset=latin-ext" rel="stylesheet">
	<div class="realty">
	    <div class="head">
	        <?php include 'head.php'; ?>
	    </div>
	    <div id="tabContainer">
	        <ul>
	            <li><a href="#general" ><?php _e('Basic settings','san_auto'); ?></a></li>
	            <li><a href="#theme-settings"><?php _e('Customize theme pages','san_auto'); ?></a></li>
	            <li><a href="#ads-menagement"><?php _e('Ads/banner management', 'san_auto'); ?></a></li>
	            <li><a href="#related"><?php _e('Related', 'san_auto'); ?></a></li>
	            <li><a href="#help"><?php _e('Help', 'san_auto'); ?></a></li>
	        </ul>
	        <div id="general">
	            <?php include 'general.php'; ?>
	        </div>
	        <div id="theme-settings">
	            <?php include 'theme-settings.php'; ?>
	        </div>
	        <div id="ads-menagement">
	            <?php include 'ads-menagement.php'; ?>
	        </div>
	        <div id="related">
	            <?php include 'related.php'; ?>
	        </div>
			<div id="help">
				<?php include 'help.php'; ?>
			</div>
	    </div>
	</div>
