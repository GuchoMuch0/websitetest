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

    osc_enqueue_script('jquery-validate');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="noindex, nofollow" />
        <meta name="googlebot" content="noindex, nofollow" />
        <script type="text/javascript">
            $(document).ready(function() {
                $('form#change-email').validate({
                    rules: {
                        new_email: {
                            required: true,
                            email: true
                        }
                    },
                    messages: {
                        new_email: {
                            required: '<?php echo osc_esc_js(__("Email: this field is required", "san_auto")); ?>.',
                            email: '<?php echo osc_esc_js(__("Invalid email address", "san_auto")); ?>.'
                        }
                    },
                    errorLabelContainer: "#error_list",
                    wrapper: "li",
                    invalidHandler: function(form, validator) {
                        $('html,body').animate({ scrollTop: $('h1').offset().top }, { duration: 250, easing: 'swing'});
                    },
                    submitHandler: function(form){
                        $('button[type=submit], input[type=submit]').attr('disabled', 'disabled');
                        form.submit();
                    }
                });
            });
        </script>
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
                            <h2><?php _e('Change your e-mail', 'san_auto'); ?></h2>
                        </div>
                        <div class="users-content">
                            <div id="main" class="modify_profile">
                                <ul id="error_list"></ul>
                                <div class="step user-step">
                                    <form id="change-email" action="<?php echo osc_base_url(true); ?>" method="post">
                                        <input type="hidden" name="page" value="user" />
                                        <input type="hidden" name="action" value="change_email_post" />
                                        <fieldset>
                                            <div class="step-row">
                                                <label for="email"><?php _e('Current e-mail', 'san_auto'); ?></label>
                                                <span class="update"><?php echo osc_logged_user_email(); ?></span>
                                            </div>
                                            <div class="step-row">
                                                <label for="new_email"><?php _e('New e-mail', 'san_auto'); ?> *</label>
                                                <input type="text" name="new_email" id="new_email" value="" />
                                            </div>
                                            <button type="submit" class="btn"><?php _e('Update', 'san_auto'); ?></button>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
