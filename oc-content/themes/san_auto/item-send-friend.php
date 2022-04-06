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
                        <form id="sendfriend" name="sendfriend" action="<?php echo osc_base_url(true); ?>" method="post">
                            <input type="hidden" name="action" value="send_friend_post" />
                            <input type="hidden" name="page" value="item" />
                            <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
                            <fieldset>
                                <?php if(osc_is_web_user_logged_in()) { ?>
                                    <input type="hidden" name="yourName" value="<?php echo osc_esc_html( osc_logged_user_name() ); ?>" />
                                    <input type="hidden" name="yourEmail" value="<?php echo osc_esc_html(osc_logged_user_email());?>" />
                                <?php } else { ?>
                                    <div class="item-form-input">
                                        <?php SendFriendForm::your_name(); ?>
                                        <?php SendFriendForm::your_email(); ?>
                                    </div>
                                <?php }; ?>
                                <div class="item-form-input">
                                    <?php SendFriendForm::friend_name(); ?>
                                </div>
                                <div class="item-form-input message">
                                     <?php SendFriendForm::friend_email(); ?>
                                </div>
                                <div class="item-form-input">
                                    <?php SendFriendForm::your_message(); ?>
                                </div>

                                <?php if( osc_recaptcha_public_key() ) { ?>
                                    <div class="user-box">
                                        <?php $recapVers = osc_get_preference('recaptcha_version','osclass');
                                            if($recapVers !== '2') { ?>
                                            <script type="text/javascript">
                                                    var RecaptchaOptions = {
                                                        theme : 'custom',
                                                        custom_theme_widget: 'recaptcha_widget'
                                                    };
                                            </script>
                                            <style type="text/css">
                                                div#recaptcha_widget, div#recaptcha_image > img { width:250px; } #recaptcha_response_field{max-width:250px;}
                                            </style>
                                            <div align="center" id="recaptcha_widget">
                                                <div style="max-width:250px;" id="recaptcha_image"><img /></div>
                                                <a href="javascript:Recaptcha.reload()"><?php _e('Refresh', 'san_auto'); ?></a><br />
                                                <span class="recaptcha_only_if_image"><?php _e('Enter the words above','san_auto'); ?>:</span>
                                                <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                                            </div>
                                    </div>
                            <?php } } ?>
                            <?php osc_show_recaptcha(); ?>
                            <button type="submit" class="btn"><i class="flaticon-send"></i> <?php _e('Send', 'san_auto'); ?></button>
                            </fieldset>
                        </form>
                    </div>
                    <div class="contactus-help">
                        <div class="contactus-top">
                            <div class="contactus-ava">
                                <i class="contactus-svg sendfriend-svg"></i>
                            </div>
                            <div class="contactus-text">
                                <p><?php _e('Send an email with a link to the ad to your friend', 'san_auto'); ?>.</p>
                            </div>
                        </div>
                        <div class="contactus-bottom">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <?php SendFriendForm::js_validation(); ?>
        <script type="text/javascript">
            <?php if(!osc_is_web_user_logged_in()) { ?>
                $(".item-form-input #yourName").attr('placeholder', '<?php echo osc_esc_js(__('Your name  (optional)', 'san_auto')); ?>');
                $(".item-form-input #yourEmail").attr('placeholder', '<?php echo osc_esc_js(__('Your e-mail address', 'san_auto')); ?>');
            <?php } ?>
            $(".item-form-input #friendName").attr('placeholder', '<?php echo osc_esc_js(__('Friend name', 'san_auto')); ?>');
            $(".item-form-input #friendEmail").attr('placeholder', '<?php echo osc_esc_js(__('Friend e-mail', 'san_auto')); ?>');
            $(".item-form-input #message").attr('placeholder', '<?php echo osc_esc_js(__('Message', 'san_auto')); ?>');
        </script>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
