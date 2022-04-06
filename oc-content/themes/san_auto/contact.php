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
    </head>
    <body class="different-page">
        <?php osc_current_web_theme_path('header.php'); ?>
        <section class="full_h">
            <div class="wrapper">
                <div class="contactus-page">
                    <div class="item-form-box">
                        <ul id="error_list"></ul>
                        <form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact">
                            <input type="hidden" name="page" value="contact" />
                            <input type="hidden" name="action" value="contact_post" />
                            <fieldset>
                                <div class="item-form-input">
                                    <?php ContactForm::the_subject(); ?>
                                </div>
                                <div class="item-form-input message">
                                    <?php ContactForm::your_message(); ?>
                                </div>
                                <div class="item-form-input">
                                    <?php ContactForm::your_name(); ?>
                                </div>
                                <div class="item-form-input">
                                    </label> <?php ContactForm::your_email(); ?>
                                </div>
                                <?php osc_run_hook('contact_form'); ?>
                                <?php osc_show_recaptcha(); ?>
                                <button type="submit" class="btn"><i class="flaticon-send"></i> <?php _e('Send', 'san_auto'); ?></button>
                                <?php osc_run_hook('admin_contact_form'); ?>
                            </fieldset>
                        </form>
                    </div>
                    <div class="contactus-help">
                        <div class="contactus-top">
                            <div class="contactus-ava">
                                <i class="contactus-svg"></i>
                            </div>
                            <div class="contactus-text">
                                <p><?php _e('Fill the forms bellow and we will get you back', 'san_auto'); ?>.</p>
                            </div>
                        </div>
                        <div class="contactus-bottom">
                            <h3><?php _e('Follow us', 'san_auto'); ?></h3>
                            <div class="contactus-social">
                                <?php if (osc_get_preference('fc_text', 'san_auto') <> ""): ?>
                                    <a class="fac" target="_blank" href="<?= osc_get_preference('fc_text', 'san_auto'); ?>"><i class="fab fa-facebook-f"></i></a>
                                <?php endif; ?>
                                <?php if (osc_get_preference('tw_text', 'san_auto') <> ""): ?>
                                    <a class="telegram"  target="_blank" href="<?= osc_get_preference('tw_text', 'san_auto'); ?>"><i class="fab fa-twitter"></i></a>
                                <?php endif; ?>
                                <?php if (osc_get_preference('tg_text', 'san_auto') <> ""): ?>
                                    <a class="telegram" target="_blank" href="<?= osc_get_preference('tg_text', 'san_auto'); ?>"><i class="fab fa-telegram-plane"></i></a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <?php ContactForm::js_validation(); ?>
        <script type="text/javascript">
            $(".item-form-input #yourName").attr('placeholder', '<?php echo osc_esc_js(__('Your name  (optional)', 'san_auto')); ?>');
            $(".item-form-input #yourEmail").attr('placeholder', '<?php echo osc_esc_js(__('Your e-mail address', 'san_auto')); ?>');
            $(".item-form-input #subject").attr('placeholder', '<?php echo osc_esc_js(__('Subject (optional)', 'san_auto')); ?>');
            $(".item-form-input #message").attr('placeholder', '<?php echo osc_esc_js(__('Message', 'san_auto')); ?>');
        </script>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
