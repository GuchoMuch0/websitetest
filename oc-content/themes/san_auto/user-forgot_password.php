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
                <div class="recover-page">
                    <div class="item-form-box">
                        <form action="<?php echo osc_base_url(true); ?>" method="post" >
                            <input type="hidden" name="page" value="login" />
                            <input type="hidden" name="action" value="forgot_post" />
                            <input type="hidden" name="userId" value="<?php echo osc_esc_html(Params::getParam('userId')); ?>" />
                            <input type="hidden" name="code" value="<?php echo osc_esc_html(Params::getParam('code')); ?>" />
                            <fieldset>
                                <div class="item-form-input">
                                    <input type="password" id="password" name="new_password" value="" />
                                </div>
                                <div class="item-form-input">
                                    <input type="password" id="password2" name="new_password2" value="" />
                                </div>
                                <button class="btn" type="submit"><?php _e('Change password', 'san_auto'); ?></button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script type="text/javascript">
            $(".item-form-input #password").attr('placeholder', '<?php echo osc_esc_js(__('New password', 'san_auto')); ?>');
            $(".item-form-input #password2").attr('placeholder', '<?php echo osc_esc_js(__('Repeat new password', 'san_auto')); ?>');
        </script>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
