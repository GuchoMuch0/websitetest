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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="noindex, nofollow" />
        <meta name="googlebot" content="noindex, nofollow" />
    </head>
    <body>
        <?php osc_current_web_theme_path('header.php'); ?>
        <section class="full_h">
            <div class="wrapper">
                <div class="user-box">
                    <div class="search-sidebar">
                        <div class="search-box">
                            <div class="search-name">
                                <h2><?php _e('Profile', 'san_auto'); ?></h2>
                            </div>
                            <div class="user-sidebar">
                                <?php echo osc_private_user_menu_san_auto(get_user_menu()); ?>
                            </div>
                        </div>
                    </div>
                    <div class="search-items">
                        <div class="users-bar">
                            <h2><?php _e('Your alerts', 'san_auto'); ?></h2>
                        </div>
                        <div class="users-content">
                            <?php if(osc_count_alerts() == 0) { ?>
                                <p class="item-form-help"><?php _e('You do not have any alerts yet', 'san_auto'); ?>.</p>
                            <?php } else { ?>
                                <?php while(osc_has_alerts()) { ?>
                                    <div class="userItem" >
                                        <p class="item-form-help"><?php _e('Alert', 'san_auto'); ?> | <a onclick="javascript:return confirm('<?php echo osc_esc_js(__('This action can\'t be undone. Are you sure you want to continue?', 'san_auto')); ?>');" href="<?php echo osc_user_unsubscribe_alert_url(); ?>"><?php _e('Delete this alert', 'san_auto'); ?></a></p>
                                        <div class="item-list">
                                            <?php while(osc_has_items()) { ?>
                                                    <?php draw_item_san_auto('list'); ?>
                                            <?php } ?>
                                        </div>
                                        <?php if(osc_count_items() == 0) { ?>
                                                0 <?php _e('Listings', 'san_auto'); ?>
                                        <?php } ?>
                                        </div>
                                <?php } ?>
                            <?php  } ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
