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

    $address = '';
    if(osc_user_address()!='') {
        if(osc_user_city_area()!='') {
            $address = osc_user_address().", ".osc_user_city_area();
        } else {
            $address = osc_user_address();
        }
    } else {
        $address = osc_user_city_area();
    }
    $location_array = array();
    $aCountries = Country::newInstance()->listAll();
    if (count($aCountries) >= 1) {
        if(osc_user_country()!='') {
            $location_array[] = osc_user_country();
        }
    }
    if(osc_user_region()!='') {
        $location_array[] = osc_user_region();
    }
    if(trim(osc_user_city()." ".osc_user_zip())!='') {
        $location_array[] = trim(osc_user_city()." ".osc_user_zip());
    }

    $location = implode(", ", $location_array);
    unset($location_array);

    osc_enqueue_script('jquery-validate');

    $itemUser = User::newInstance()->findByPrimaryKey(osc_user_id());
    $date = date_create($itemUser['dt_access_date']);
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
                    <div class="user-sidebar userpubl-sidebar">
                        <div class="user-publ-box">
                            <div class="user-publava">
                                <?php user_avatar_show(osc_user_id(), false, false, false); ?>
                            </div>
                        </div>
                        <div class="user-publcol">
                            <div class="user-publtext">
                                <?php _e('Last access', 'san_auto'); ?>: <?= date_format($date,"H:i m-d-Y"); ?>
                            </div>
                            <div class="user-publtext">
                                <?php _e('Full name', 'san_auto'); ?>: <?php echo osc_user_name(); ?>
                            </div>
                            <?php if (osc_user_phone_land() <> ""): ?>
                            <div class="user-publtext">
                                <?php _e('Mobile phone', 'san_auto'); ?>: <a class="user-phone" data-count="0" href="#" onclick="return false;"><?= hideText($itemUser['s_phone_land']);?><span class="item-display-cont"><i class="fas fa-eye"></i></span></a>
                            </div>
                            <?php endif; ?>
                            <?php if (osc_user_phone_mobile() <> ""): ?>
                            <div class="user-publtext">
                                <?php _e('Cell phone', 'san_auto'); ?>:<a class="user-phone" data-count="1" href="#" onclick="return false;"><?= hideText($itemUser['s_phone_mobile']);?> <span class="item-display-cont"><i class="fas fa-eye"></i></span></a>
                            </div>
                            <?php endif; ?>
                            <div class="user-publtext">
                                <?php _e('Address', 'san_auto'); ?>: <?php echo $address; ?>
                            </div>
                            <div class="user-publtext">
                                <?php _e('Location', 'san_auto'); ?>: <?php echo $location; ?>
                            </div>
                            <div class="user-publtext">
                                <?php _e('Website', 'san_auto'); ?>: <?php echo osc_user_website(); ?>
                            </div>
                            <div class="user-publtext">
                                <?php _e('User Description', 'san_auto'); ?>: <?php echo nl2br(osc_user_info()); ?>
                            </div>
                            <div class="item-contact">
                                <a href="#contact"> <i class="flaticon-envelope"></i> <?php _e('Contact seller', 'san_auto'); ?>r</a>
                            </div>
                        </div>
                    </div>
                    <div class="item-contact-user">
                    <div id="contact">
                        <?php if(osc_logged_user_id()!=  osc_user_id()) { ?>
                        <?php if(osc_reg_user_can_contact() && osc_is_web_user_logged_in() || !osc_reg_user_can_contact() ) { ?>
                        <div id="contact">
                            <ul id="error_list"></ul>
                            <form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact_form">
                                <input type="hidden" name="action" value="contact_post" />
                                <input type="hidden" name="page" value="user" />
                                <input type="hidden" name="id" value="<?php echo osc_user_id();?>" />
                                <?php osc_prepare_user_info(); ?>
                                <div class="item-form-box">
                                    <fieldset>
                                        <div class="item-form-input">
                                            <?php ContactForm::your_name(); ?>
                                        </div>
                                        <div class="item-form-input">
                                            <?php ContactForm::your_email(); ?>
                                        </div>
                                        <div class="item-form-input">
                                             <?php ContactForm::your_phone_number(); ?>
                                        </div>

                                        <div class="item-form-input">
                                            <?php ContactForm::your_message(); ?>
                                        </div>
                                        <?php osc_run_hook('item_contact_form', osc_item_id()); ?>
                                            <?php if( osc_recaptcha_public_key() ) { ?>
                                            <script type="text/javascript">
                                                var RecaptchaOptions = {
                                                    theme : 'custom',
                                                    custom_theme_widget: 'recaptcha_widget'
                                                };
                                            </script>
                                            <style type="text/css"> div#recaptcha_widget, div#recaptcha_image > img { width:280px; } </style>
                                            <div id="recaptcha_widget">
                                                <div id="recaptcha_image"><img /></div>
                                                <span class="recaptcha_only_if_image"><?php _e('Enter the words above','san_auto'); ?>:</span>
                                                <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                                                <div><a href="javascript:Recaptcha.showhelp()"><?php _e('Help', 'san_auto'); ?></a></div>
                                            </div>
                                            <?php } ?>
                                            <?php osc_show_recaptcha(); ?>
                                        <button type="submit" class="btn"><i class="flaticon-send"></i> <?php _e('Send', 'san_auto'); ?></button>
                                    </fieldset>
                                </div>
                            </form>
                        </div>
                        <?php } ?>
                        <?php } ?>
                    </div>
                </div>
                </div>
            </div>
            <div class="search-items">
                    <div class="users-bar">
                        <h2><?php _e('Latest listings', 'san_auto'); ?></h2>
                    </div>
                    <div class="users-content">
                        <div class="item-gallery">
                            <?php while(osc_has_items()) { ?>
                                <?php draw_item_san_auto('gallery', false); ?>
                            <?php } ?>
                            <?php if(osc_search_total_pages() > osc_max_results_per_page_at_search() ) { ?>
                                <div class="main-more">
                                    <a  class="btn" href="<?php echo osc_base_url(true).'&page=search&sUser[]='.osc_user_id(); ?>"><?php _e('See all offers ', 'san_auto'); ?></a>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
            </div>
        </div>
        </div>
        </section>
        <?php ContactForm::js_validation(); ?>
        <script type="text/javascript">
            // SHOW CONTACT FORM
            $(document).on('click touchend', '.item-contact a', function() {
                 $(".item-contact-user").slideToggle();
                return false;
            });

            $(".item-form-input #yourName").attr('placeholder', '<?php echo osc_esc_js(__('Your name', 'san_auto')); ?>');
            $(".item-form-input #yourEmail").attr('placeholder', '<?php echo osc_esc_js(__('Your e-mail', 'san_auto')); ?>');
            $(".item-form-input #phoneNumber").attr('placeholder', '<?php echo osc_esc_js(__('Phone number (optional)', 'san_auto')); ?>');
            $(".item-form-input #message").attr('placeholder', '<?php echo osc_esc_js(__('Message ', 'san_auto')); ?>');

            $(document).ready(function () {
                $countLand =  '<?= osc_esc_js($itemUser['s_phone_land']); ?>';
                $countMobile = '<?= osc_esc_js($itemUser['s_phone_mobile']); ?>';
                $(document).on('click touchend', '.item-display-cont', function(){
                    var $data = $(this).parent().data('count');
                        if ($data == 0) {
                            $(this).parent().text($countLand).attr({
                                'href':'tel:'+ $countLand +'',
                                'onclick': 'return true;'
                            });
                        } else if ($data == 1) {
                            $(this).parent().text($countMobile).attr({
                                'href': 'mailto:'+ $countMobile +'',
                                'onclick': 'return true;'
                            });
                        }
                });
            });

        </script>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
