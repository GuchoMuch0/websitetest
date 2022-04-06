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
 <div id="tabContainer2">
     <ul>
         <li><a href="#main"><?php _e('Home page', 'san_auto'); ?></a></li>
         <li><a href="#register"><?php _e('Register page', 'san_auto'); ?></a></li>
         <li><a href="#post"><?php _e('Item-post page', 'san_auto'); ?></a></li>
         <li><a href="#search"><?php _e('Search page', 'san_auto'); ?></a></li>
         <li><a href="#item"><?php _e('Item page', 'san_auto'); ?></a></li>
         <li><a href="#footer-auto"><?php _e('Footer','san_auto'); ?></a></li>
     </ul>
     <div id="footer-auto">
        <?php include 'footer.php'; ?>
     </div>
     <div id="main">
        <?php include 'home.php'; ?>
     </div>
     <div id="register">
        <?php include 'register.php'; ?>
     </div>
     <div id="post">
         <?php include 'post.php'; ?>
     </div>
     <div id="search">
         <?php include 'search.php'; ?>
     </div>
     <div id="item">
        <?php include 'item.php'; ?>
     </div>
 </div>
