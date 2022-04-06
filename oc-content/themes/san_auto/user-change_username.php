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
    $user = User::newInstance()->findByPrimaryKey(osc_logged_user_id());
    $username = $user['s_username'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="noindex, nofollow" />
        <meta name="googlebot" content="noindex, nofollow" />
        <script type="text/javascript">
            $(document).ready(function() {
                $('form#change-username').validate({
                    rules: {
                        s_username: {
                            required: true
                        }
                    },
                    messages: {
                        s_username: {
                            required: '<?php echo osc_esc_js(__("Username: this field is required", "san_auto")); ?>.'
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

                var cInterval;
                $("#s_username").keydown(function(event) {
                    if($("#s_username").attr("value")!='') {
                        clearInterval(cInterval);
                        cInterval = setInterval(function(){
                            $.getJSON(
                                "<?php echo osc_base_url(true); ?>?page=ajax&action=check_username_availability",
                                {"s_username": $("#s_username").attr("value")},
                                function(data){
                                    clearInterval(cInterval);
                                    if(data.exists==0) {
                                        $("#available").text('<?php echo osc_esc_js(__("The username is available", "san_auto")); ?>');
                                    } else {
                                        $("#available").text('<?php echo osc_esc_js(__("The username is NOT available", "san_auto")); ?>');
                                    }
                                }
                            );
                        }, 1000);
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
                            <h2><?php _e('Change your username', 'san_auto'); ?></h2>
                        </div>
                        <div class="users-content">
                            <ul id="error_list"></ul>
                            <div class="step user-step">
                                <form id="change-username" action="<?php echo osc_base_url(true); ?>" method="post">
                                    <input type="hidden" name="page" value="user" />
                                    <input type="hidden" name="action" value="change_username_post" />
                                    <fieldset>
                                        <div class="step-row">
                                            <label for="email"><?php _e('Current username', 'san_auto'); ?></label>
                                            <span class="update"><?php echo $username; ?></span>
                                        </div>
                                        <div class="step-row">
                                            <label for="s_username"><?php _e('Username', 'san_auto'); ?></label>
                                            <input type="text" name="s_username" id="s_username" value="" />
                                        </div>
                                        <div class="step-row">
                                            <span class="help-box" ><?php _e('WARNING: Once set, you will not be able to change your username again. Choose wisely.', 'san_auto'); ?></span>
                                        </div>
                                        <div id="available"></div>
                                        <button type="submit" class="btn"><?php _e('Update', 'san_auto'); ?></button>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
