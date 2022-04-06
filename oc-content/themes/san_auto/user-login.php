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
        <script type="text/javascript" src="<?php echo osc_current_web_theme_js_url('jquery.validate.min.js'); ?>"></script>
        <?php if (osc_get_preference('loc', 'san_auto') !== '0'): ?>
            <?php UserForm::location_javascript(); ?>
        <?php endif; ?>
    </head>
    <body class="login_page">
        <?php osc_current_web_theme_path('header.php'); ?>
        <?php UserForm::js_validation(); ?>
        <section class="full_h">
            <div class="wrapper user-wrapp">
                <div class="users">
                    <div class="users_login">
                        <div class="user_left">
                            <div class="user-form user-form-login">
                                <h1><?php _e('Sign in', 'san_auto'); ?></h1>
                                <form action="<?php echo osc_base_url(true); ?>" method="post" id="log-in">
                                    <input type="hidden" name="page" value="login" />
                                    <input type="hidden" name="action" value="login_post" />
                                    <div class="user-row user-input">
                                        <label for="email"><?php _e('E-mail', 'san_auto'); ?></label>
                                        <?php UserForm::email_login_text(); ?>
                                    </div>
                                    <div class="user-row user-input">
                                        <label for="password"><?php _e('Password', 'san_auto'); ?></label>
                                        <?php UserForm::password_login_text(); ?>
                                    </div>
                                    <div class="user-row user-help">
                                        <div class="user-col">
                                            <?php UserForm::rememberme_login_checkbox();?>
                                            <label for="remember"><?php _e('Remember me', 'san_auto'); ?></label>
                                        </div>
                                        <div class="user-col">
                                            <a href="<?php echo osc_recover_user_password_url(); ?>"><?php _e("Forgot password?", 'san_auto'); ?></a>
                                        </div>
                                    </div>
                                    <div class="user-row">
                                        <button type="submit"><?php _e("Sign in", 'san_auto');?></button>
                                    </div>
                                </form>
                            </div>
                            <div class="user-form user-form-reg">
                                <h1><?php _e('Регистрация', 'san_auto'); ?></h1>
                                <form name="register" action="<?php echo osc_base_url(true); ?>" method="post" >
                                    <input type="hidden" name="page" value="register" />
                                    <input type="hidden" name="action" value="register_post" />
                                    <?php if (osc_get_preference('user_type', 'san_auto') !== '0'): ?>
                                        <input type="hidden" name="b_company" class="sCompany" id="sCompany" value="">
                                    <?php endif; ?>

                                    <ul id="error_list"></ul>
                                    <?php if (osc_get_preference('user_type', 'san_auto') !== '0'): ?>
                                        <div class="user-row inside reg">
                                            <div class="user-box-type personal"><?php _e('Private', 'san_auto'); ?></div>
                                            <div class="user-box-type company"><?php _e('Dealers', 'san_auto'); ?></div>
                                        </div>
                                    <?php endif; ?>

                                    <div class="user-row user-input">
                                        <label for="name"><?php _e('Name', 'san_auto'); ?></label>
                                        <?php UserForm::name_text(); ?>
                                    </div>

                                    <?php if (osc_get_preference('phone', 'san_auto') !== '0'): ?>
                                        <div class="user-row user-input">
                                            <label for="mobile"><?php _e('Mobile', 'san_auto'); ?></label>
                                            <?php UserForm::mobile_text(); ?>
                                        </div>
                                    <?php endif; ?>

                                    <?php if (osc_get_preference('info', 'san_auto') !== '0'): ?>
                                        <div class="user-row user-input user-textarea">
                                            <label for="info"><?php _e('User info', 'san_auto'); ?></label>
                                            <?php UserForm::info_textarea('s_info', osc_locale_code(), @$osc_user['locale'][osc_locale_code()]['s_info']); ?>
                                        </div>
                                    <?php endif; ?>
                                    <?php if (osc_get_preference('loc', 'san_auto') !== '0'): ?>
                                        <div class="user-row user-select">
                                            <?php UserForm::country_select(osc_get_countries()); ?>
                                        </div>
                                        <div class="user-row user-select">
                                            <?php UserForm::region_select(osc_get_regions(), osc_user()); ?>
                                        </div>
                                        <div class="user-row user-select">
                                            <?php UserForm::city_select(osc_get_cities(), osc_user()); ?>
                                        </div>
                                    <?php endif; ?>
                                    <div class="user-row user-input">
                                        <label for="email"><?php _e('E-mail', 'san_auto'); ?></label>
                                        <?php UserForm::email_text(); ?>
                                    </div>

                                    <div class="user-row user-input">
                                        <label for="password"><?php _e('Password', 'san_auto'); ?></label>
                                        <?php UserForm::password_text(); ?>
                                    </div>
                                    <div class="user-row user-input">
                                        <label for="password"><?php _e('Re-type password', 'san_auto'); ?></label>
                                        <?php UserForm::check_password_text(); ?>
                                        <p id="password-error" style="display:none;"><?php _e('Passwords don\'t match', 'san_auto'); ?></p>
                                    </div>
                                    <?php if (osc_get_preference('agree2', 'san_auto') !== '0'): ?>
                                        <div class="step-row step-user step-check">
                                            <input id="agree2" type="checkbox" name="agree2" value="" required>
                                            <label for="agree2"><?php _e('I agree with the', 'san_auto'); ?> <a href="<?= osc_get_preference('agree_link2', 'san_auto'); ?>" target="_blank"><?php _e('rules of the site', 'san_auto'); ?></a> </label>
                                        </div>
                                    <?php endif; ?>
                                    <div class="user-row">
                                        <?php osc_run_hook('user_register_form'); ?>
                                        <?php if( osc_recaptcha_public_key() ) { ?>
                                        <?php $recapVers = osc_get_preference('recaptcha_version','osclass');
                                           if($recapVers !== '2') { ?>
                                        <script type="text/javascript">
                                            var RecaptchaOptions = {
                                                theme : 'custom',
                                                custom_theme_widget: 'recaptcha_widget'
                                            };
                                        </script>
                                        <div align="center" id="recaptcha_widget">
                                            <div style="max-width:100%" id="recaptcha_image"><img /></div>
                                            <a href="javascript:Recaptcha.reload()"><?php _e('Refresh', 'san_auto'); ?></a><br />
                                            <span class="recaptcha_only_if_image"><?php _e('Enter the words above','san_auto'); ?>:</span>
                                            <input style="max-width:100%" type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                                        </div>
                                        <?php } } ?>
                                        <div align="center">
                                          <?php osc_show_recaptcha('register'); ?>
                                        </div>
                                    </div>
                                    <div class="user-row">
                                        <button type="submit"><?php _e("Register", 'san_auto');?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="user-right">
                            <h1><?php _e("Hello Friend!", 'san_auto'); ?></h1>
                            <h5><?php _e("Enter you personal info", 'san_auto'); ?></h5>
                            <div class="user-btn">
                                <a id="register" href="#">
                                    <div class="text"><?php _e("Register", 'san_auto'); ?></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <?php if (osc_get_preference('loc', 'san_auto') !== '0'): ?>
            <script type="text/javascript">
                $(function() {
                    var customSelect = $('.user-select select');
                    jcf.setOptions('Select', {
                    wrapNative: false,
                    wrapNativeOnMobile: false,
                    maxVisibleItems: 7,
                    useCustomScroll: true,
                    alwaysPreventMouseWheel: true
                    });

                    jcf.replace(customSelect);

                });
            </script>
        <?php endif; ?>
        <?php if (osc_get_preference('user_type', 'san_auto') !== '0'): ?>
            <script type="text/javascript">
                $('.user-box-type').on('click touchend', function() {
                    if ($(this).hasClass('personal')) {
                        $('#sCompany').prop('value', '0');
                        $('.user-box-type').removeClass('active')
                        $(this).addClass('active');
                    } else {
                        $('#sCompany').prop('value', '1');
                        $('.user-box-type').removeClass('active')
                        $(this).addClass('active');
                    }
                });
            </script>
        <?php endif; ?>
        <script type="text/javascript">
            $('form#log-in').on('submit', function() {
               var subButton = $(this).find('button');
               subButton.prop('disabled', true);
               subButton.text('<?php echo osc_esc_js(__('Please, wait', 'san_auto')); ?>');
               subButton.addClass('animate');
            });
        </script>
    </body>
</html>