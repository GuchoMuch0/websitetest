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
    <body class="different-page">
        <?php osc_current_web_theme_path('header.php'); ?>
        <section class="full_h">
            <div class="wrapper">
                <div class="recover-page">
                    <div class="item-form-box">
                        <form action="<?php echo osc_base_url(true); ?>" method="post" >
                            <input type="hidden" name="page" value="login" />
                            <input type="hidden" name="action" value="recover_post" />
                            <fieldset>
                                <div class="item-form-input">
                                    <?php UserForm::email_text(); ?>
                                </div>
                                <?php osc_show_recaptcha('recover_password'); ?>
                                <button class="btn" type="submit"><?php _e('Send me a new password', 'san_auto'); ?></button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script type="text/javascript">
            $(".item-form-input #s_email").attr('placeholder', '<?php echo osc_esc_js(__('Your e-mail address', 'san_auto')); ?>');
        </script>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
