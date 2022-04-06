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

        <?php
            ItemForm::location_javascript();

            if(osc_images_enabled_at_items() && !san_auto_is_fineuploader()) {
                ItemForm::photos_javascript();
            }
        ?>

    </head>
    <body>
        <?php osc_current_web_theme_path('header.php'); ?>
        <section class="add full_h">
        <div class="wrapper add-wrapper">
            <ul id="error_list"></ul>
            <form name="item" action="<?php echo osc_base_url(true);?>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="item_add_post" />
                <input type="hidden" name="page" value="item" />

                <!--  STEP 1 -->
                <div class="step">
                    <div class="step-left">
                        <div class="step-help">
                            <div class="step-img">
                                <i class="step-img step-img-cat"></i>
                            </div>
                            <div class="step-help-title"><?php _e('Select category', 'san_auto'); ?></div></div>
                            <div class="step-help-desc">
                                <small></small>
                            </div>
                    </div>
                    <div class="step-right">
                        <div class="step-content">
                            <div class="step-title">
                                <h2><?php _e('Category & Attributes car', 'san_auto'); ?></h2>
                            </div>
                            <div class="step-info">
                                <div class="step-row step-categoty">
                                    <label class="control-label" for="country"><?php _e('Category', 'san_auto'); ?> <span class="req">*</span></label>
                                    <?php ItemForm::category_multiple_selects(null, null, __('Select a category', 'san_auto')); ?>
                                    <?php /* ItemForm::category_select(null, null, __('Select a category', 'san_auto'));*/ ?>
                                </div>
                                <div class="ster-row">
                                    <?php ItemForm::plugin_post_item(); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--  STEP 2 -->

                <div class="step">
                    <div class="step-left">
                        <div class="step-help">
                            <div class="step-img">
                                <i class="step-img step-img-tit"></i>
                            </div>
                            <div class="step-help-title"><?php _e('Enter the title and description', 'san_auto'); ?></div></div>
                            <div class="step-help-decc">
                                <small></small>
                            </div>
                    </div>
                    <div class="step-right">
                        <div class="step-content">
                            <div class="step-title">
                                <h2><?php _e('Title & Description', 'san_auto'); ?></h2>
                            </div>
                            <div class="step-info">
                                <div class="step-row step-desc">
                                    <?php ItemForm::multilanguage_title_description(); ?>
                                </div>
                                <?php if( osc_price_enabled_at_items() ) { ?>
                                    <div class="step-row step-price">
                                        <label class="control-label" for="country"><?php _e('Price', 'san_auto'); ?><?php if (osc_get_preference('price_req', 'san_auto') !== '0'): ?><span class="req"> *</span><?php endif;?></label>
                                        <div class="step-pricing">
                                            <?php ItemForm::price_input_text(); ?>
                                            <span class="step-currency">
                                                <?php ItemForm::currency_select(); ?>
                                                <?php if (count(osc_get_currencies()) > 1): ?>
                                                    <script type="text/javascript">
                                                    $(function() {
                                                          var customSelect = $('#currency');
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
                                            </span>
                                        </div>
                                    </div>
                                <?php } ?>
                                </div>
                            </div>
                    </div>
                </div>
                <!--  STEP 3 -->
                <?php if( osc_images_enabled_at_items() ) { ?>
                    <div class="step">
                        <div class="step-left">
                            <div class="step-help">
                                <div class="step-img">
                                    <i class="step-img step-img-cam"></i>
                                </div>
                                <div class="step-help-title"><?php _e('Add photo', 'san_auto'); ?></div>
                                <div class="step-help-decc">
                                    <small><?php _e('You can upload up to', 'san_auto'); ?> <?php echo osc_max_images_per_item(); ?> <?php _e('pictures', 'san_auto'); ?></small>
                                    <small><?php _e('Max size', 'san_auto'); ?> <?php echo intval(osc_max_size_kb()/1000); ?> MB</small>
                                    <small><?php _e('Valid format png,gif,jpg,jpeg', 'san_auto'); ?></small>
                                </div>
                                <?php if (function_exists('youtube_form')): ?>
                                    <div class="step-img">
                                        <i class="step-img step-img-you"></i>
                                    </div>
                                    <div class="step-help-title"><?php _e('Add video', 'san_auto'); ?></div>
                                    <div class="step-help-decc">
                                        <small><?php printf( __( 'Enter the youtube url, i.e.: <i>%s</i>', 'youtube' ), 'http://www.youtube.com/watch?v=ojqWclLQOxk') ; ?></small>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="step-right">
                            <div class="step-content">
                                <div class="step-title">
                                    <h2><?php _e('Upload photo', 'san_auto'); ?> <?php if (function_exists('youtube_form')): _e('& Video', 'san_auto'); endif; ?></h2>
                                </div>
                                <div class="step-info">
                                    <div class="step-row step-photo <?= function_exists('youtube_form') ? "and_video" : ""; ?>">
                                        <?php ItemForm::ajax_photos(); ?>
                                    </div>
                                    <?php if (function_exists('youtube_form')): ?>
                                        <div class="step-row step-video">
                                                <?php youtube_form(); ?>
                                        </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>

                <!--  STEP 4 -->
                <div class="step">
                    <div class="step-left">
                        <div class="step-help">
                            <div class="step-img">
                                <i class="step-img step-img-sell"></i>
                            </div>
                            <div class="step-help-title"><?php _e('Add seller info', 'san_auto'); ?></div></div>
                            <div class="step-help-decc">
                                <small></small>
                            </div>
                    </div>
                    <div class="step-right">
                        <div class="step-content">
                            <div class="step-title">
                                <h2><?php _e('Seller info', 'san_auto'); ?></h2>
                            </div>
                            <div class="step-info">
                                <?php $aCountries = Country::newInstance()->listAll(); ?>
                                <?php $TwoCountry = false ; if(count($aCountries) > 1 ) { $TwoCountry = true ; ?>
                                    <div class="step-row step-loc">
                                        <label class="control-label" for="country"><?php _e('Country', 'san_auto'); ?><?php if (osc_get_preference('loc_req', 'san_auto') !== '0'): ?><span class="req"> *</span><?php endif;?></label>
                                        <?php ItemForm::country_select(osc_get_countries(), osc_user()); ?>
                                    </div>
                                <?php } else { ?>
                                    <input type="hidden" name="countryId" id="countryId" value="<?php echo san_auto_country_id(); ?>" />
                                <?php } ?>
                                    <div class="step-row step-loc">
                                        <label class="control-label" for="country"><?php _e('Region', 'san_auto'); ?><?php if (osc_get_preference('loc_req', 'san_auto') !== '0'): ?><span class="req"> *</span><?php endif;?></label>
                                        <?php
                                            ItemForm::region_select(osc_get_regions(osc_user_field('fk_c_country_code')), osc_user());
                                         ?>
                                    </div>

                                    <div class="step-row step-loc">
                                        <label class="control-label" for="country"><?php _e('City', 'san_auto'); ?><?php if (osc_get_preference('loc_req', 'san_auto') !== '0'): ?><span class="req"> *</span><?php endif;?></label>
                                        <?php
                                            ItemForm::city_select(osc_get_cities(osc_user_region_id()), osc_user());
                                        ?>
                                    </div>
                                    <div class="step-row step-user">
                                        <label for="address"><?php _e('Address', 'san_auto'); ?><?php if (osc_get_preference('address_req', 'san_auto') !== '0'): ?><span class="req"> *</span><?php endif;?></label>
                                        <?php ItemForm::address_text(); ?>
                                    </div>
                                        <?php if(!osc_is_web_user_logged_in() ) { ?>
                                            <div class="step-row step-user">
                                                <label for="contactName"><?php _e('Name', 'san_auto'); ?><?php if (osc_get_preference('name_req', 'san_auto') !== '0'): ?><span class="req"> *</span><?php endif;?></label>
                                                <?php ItemForm::contact_name_text(); ?>
                                            </div>
                                            <div class="step-row step-user">
                                                <label for="contactEmail"><?php _e('E-mail', 'san_auto'); ?> <span class="req">*</span></label>
                                                <?php ItemForm::contact_email_text(); ?>
                                            </div>
                                        <?php }; ?>
                                        <div class="step-row step-user">
                                            <label for="cityarea">
                                                <?= osc_get_preference('cityarea', 'san_auto') !== '0' ? _e('Phone', 'san_auto') : _e('City area', 'san_auto'); ?>
                                                  <?php if (osc_get_preference('cityarea_req', 'san_auto') !== '0'): ?><span class="req">*</span><?php endif;  ?>
                                            </label>
                                            <?php ItemForm::city_area_text(); ?>
                                        </div>
                                        <div class="step-row step-user step-check">
                                            <?php ItemForm::show_email_checkbox(); ?>
                                            <label for="showEmail"><?php _e('Show e-mail on the listing page', 'san_auto'); ?></label>
                                        </div>
                                        <?php if(class_exists('ModelGdpr')): ?>
                                            <div class="step-row step-user step-check step-gdpr">
                                                <?php osc_run_hook('gdpr'); ?>
                                            </div>
                                        <?php endif; ?>
                                        <?php if (osc_get_preference('agree', 'san_auto') !== '0'): ?>
                                            <div class="step-row step-user step-check">
                                                <input id="agree2" type="checkbox" name="agree2" value="" required>
                                                <label for="agree2"><?php _e('I agree with the', 'san_auto'); ?> <a href="<?= osc_get_preference('agree_link', 'san_auto'); ?>" target="_blank"><?php _e('rules of the site', 'san_auto'); ?></a> </label>
                                            </div>
                                        <?php endif; ?>

                                        <?php if( osc_recaptcha_items_enabled() ) { ?>
                                                <?php $recapVers = osc_get_preference('recaptcha_version','osclass');
                                                if($recapVers !== '2') { ?>
                                                    <div class="post-rowing">
                                                    <script type="text/javascript">
                                                        var RecaptchaOptions = {
                                                            theme : 'custom',
                                                            custom_theme_widget: 'recaptcha_widget'
                                                    };
                                                    </script>
                                                        <div id="recaptcha_widget">
                                                            <div style="max-width:250px;" id="recaptcha_image"><img /></div>
                                                            <a href="javascript:Recaptcha.reload()"><?php _e('Refresh', 'san_auto'); ?></a>
                                                            <span class="recaptcha_only_if_image"><?php _e('Enter the words above','san_auto'); ?><span class="req"> *</span>: </span>
                                                            <input style="max-width:240px" type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <?php if($recapVers == '2') { ?>
                                                    <div class="post-rowing" align="center"><?php osc_show_recaptcha(); ?>
                                                        <?php } else { osc_show_recaptcha(); }?>
                                                    </div>
                                        <?php };?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="step-expl">
                    <span class="req"> *</span> — <?php _e('required ', 'san_auto'); ?>
                </div>
                <div class="main-more">
                    <button class="btn" type="submit"><?php _e('Publish', 'san_auto'); ?></button>
                </div>
            </form>
        </div>
        </section>
        <?php osc_current_web_theme_path('footer.php'); ?>

        <script type="text/javascript">



    		<?php if (osc_count_web_enabled_locales() == 1): ?>
            /* add req title & description */
                function fixTLabel(text) {
                    var $str = $(text).text();
                    var $length = $str.length - 1;
                    var $req = $str.substr($length);
                    var $text= $str.substr(0, $length);
                    return $(text).html($text+ "<span class='req'>" + $req + "</span>");
                }

                fixTLabel('label[for="title"]');
                fixTLabel('label[for="description"]');
            <?php endif; ?>


            function customSelect() {
              var customSelect = $('.step-categoty select, .step-loc select');
              jcf.setOptions('Select', {
                wrapNative: false,
                wrapNativeOnMobile: false,
                maxVisibleItems: 7,
                useCustomScroll: true,
                alwaysPreventMouseWheel: true
              });

              jcf.replace(customSelect);
            }

            $(document).ready(function(){

                var title_max = <?php echo osc_max_characters_per_title(); ?>;
                var check_input = $('.step-row .title input');

                check_input.attr('maxlength', title_max);
                check_input.after('<div class="title-max-char"></div>');
                $('.title-max-char').html(title_max);

                $('ul.tabbernav li a').on('click touchend', function(){
                  var title_length = 0;

                  check_input.each(function(){
                    if( $(this).val().length > title_length ) {
                      title_length = $(this).val().length;
                    }
                  });

                  var title_remaining = title_max - title_length;

                  $('.title-max-char').html(title_remaining);
                });

                check_input.keyup(function() {
                  var title_length = $(this).val().length;
                  var title_remaining = title_max - title_length;

                  $('.title-max-char').html(title_remaining);
                });

                var desc_max = <?php echo osc_max_characters_per_description(); ?>;
                var check_textarea = $('.step-row .description textarea');

                check_textarea.attr('maxlength', desc_max);
                check_textarea.after('<div class="desc-max-char"></div>');
                $('.desc-max-char').html(desc_max);

                $('ul.tabbernav li a').on('click touchend', function(){
                  var desc_length = 0;

                  check_textarea.each(function(){
                    if( $(this).val().length > desc_length ) {
                      desc_length = $(this).val().length;
                    }
                  });

                  var desc_remaining = desc_max - desc_length;
                  $('.desc-max-char').html(desc_remaining);
                });

                check_textarea.keyup(function() {
                  var desc_length = $(this).val().length;
                  var desc_remaining = desc_max - desc_length;

                  $('.desc-max-char').html(desc_remaining);
                });



                var $qq = $(document).find('.qq-upload-button > div');
                $qq.text('<?php echo osc_esc_js(__('Upload Photos or just drag and drop', 'san_auto')); ?>');
                customSelect();

                $(document).on('change', '#select_1, #select_2, #select_3', function () {
                    customSelect();
                });

                <?php if (osc_count_web_enabled_locales() > 1): ?>
                tabberAutomatic();
                <?php endif; ?>


                $( function() {
                    $('.qq-upload-list').sortable({
                        placeholder: 'highlight-grey',
                        cancel: '.item-post .qq-upload-delete'
                    });
                    $('.qq-upload-list').disableSelection();

                });




                  // Code for form validation
                  $("form[name=item]").validate({
                    rules: {
                      "title[<?php echo osc_current_user_locale(); ?>]": {
                        required: true,
                        minlength: 5
                      },

                      "description[<?php echo osc_current_user_locale(); ?>]": {
                        required: true,
                        minlength: 10
                      },
                      <?php if (osc_get_preference('price_req', 'san_auto') !== '0'): ?>
                      price: {
                        required: true
                      },
                      <?php endif; ?>
                      <?php if (osc_get_preference('loc_req', 'san_auto') !== '0'): ?>
                      countryId: {
                        required: true
                      },

                      regionId: {
                        required: true
                      },

                      cityId: {
                        required: true
                      },
                      <?php endif; ?>
                      <?php if (osc_get_preference('address_req', 'san_auto') !== '0'): ?>
                      address: {
                        required: true
                      },
                      <?php endif; ?>
                      catId: {
                        required: true,
                        digits: true
                      },

                      "photos[]": {
                        accept: "png,gif,jpg,jpeg"
                      },
                      <?php if (osc_get_preference('name_req', 'san_auto') !== '0'): ?>
                      contactName: {
                        required: true,
                        minlength: 3
                      },
                      <?php endif; ?>
                      contactEmail: {
                        required: true,
                        email: true
                      },
                      <?php if (osc_get_preference('cityarea_req', 'san_auto') !== '0'): ?>
                      cityArea: {
                          required: true
                      }
                      <?php endif; ?>
                    },

                    messages: {
                      "title[<?php echo osc_current_user_locale(); ?>]": {
                        required: '<?php echo osc_esc_js(__('Title: this field is required.', 'san_auto')); ?>',
                        minlength: '<?php echo osc_esc_js(__('Title: enter at least 5 characters.', 'san_auto')); ?>'
                      },

                      "description[<?php echo osc_current_user_locale(); ?>]": {
                        required: '<?php echo osc_esc_js(__('Description: this field is required.', 'san_auto')); ?>',
                        minlength: '<?php echo osc_esc_js(__('Description: enter at least 10 characters.', 'san_auto')); ?>'
                      },
                      <?php if (osc_get_preference('price_req', 'san_auto') !== '0'): ?>
                          price: {
                            required: '<?php echo osc_esc_js(__('Price: this field is required.', 'san_auto')); ?>'
                          },
                      <?php endif; ?>
                      <?php if (osc_get_preference('loc_req', 'san_auto') !== '0'): ?>
                      countryId: {
                        required: '<?php echo osc_esc_js(__('Location: select country from location field.', 'san_auto')); ?>'
                      },

                      regionId: {
                        required: '<?php echo osc_esc_js(__('Location: select region from location field.', 'san_auto')); ?>'
                      },

                      cityId: {
                        required: '<?php echo osc_esc_js(__('Location: select city from location field.', 'san_auto')); ?>'
                      },
                      <?php endif; ?>
                      <?php if (osc_get_preference('address_req', 'san_auto') !== '0'): ?>
                          address: {
                            required: '<?php echo osc_esc_js(__('Address: this field is required.', 'san_auto')); ?>'
                          },
                      <?php endif;?>
                      catId: '<?php echo osc_esc_js(__('Category: this field is required.', 'san_auto')); ?>',

                      "photos[]": {
                         accept: '<?php echo osc_esc_js(__('Photo: must be png,gif,jpg,jpeg.', 'san_auto')); ?>'
                      },

                      <?php if (osc_get_preference('name_req', 'san_auto') !== '0'): ?>
                      contactName: {
                        required: '<?php echo osc_esc_js(__('Your Name: this field is required.', 'san_auto')); ?>',
                        minlength: '<?php echo osc_esc_js(__('Your Name: enter at least 3 characters.', 'san_auto')); ?>'
                      },
                      <?php endif; ?>
                      contactEmail: {
                        required: '<?php echo osc_esc_js(__('Email: this field is required.', 'san_auto')); ?>',
                        email: '<?php echo osc_esc_js(__('Email: invalid format of email address.', 'san_auto')); ?>'
                      },
                      <?php if (osc_get_preference('cityarea_req', 'san_auto') !== '0'): ?>
                          <?php if (osc_get_preference('cityarea', 'san_auto') !== '0'): ?>
                              cityArea: {
                                required: '<?php echo osc_esc_js(__('Phone: enter your contact number.', 'san_auto')); ?>'
                              }
                          <?php else: ?>
                              cityArea: {
                                required: '<?php echo osc_esc_js(__('Cityarea: this field is required.', 'san_auto')); ?>'
                              }
                          <?php endif; ?>
                      <?php endif; ?>
                    },

                    highlight: function(element, errorClass, validClass) {
                        if ($(element).is('select') || $(element).is('input#catId')) {
                            $( element ).parent('div').find('.jcf-select').addClass(errorClass).removeClass(validClass);
                        }
                        else {
                            $( element ).addClass(errorClass).removeClass(validClass);
                        }

                    },
                    unhighlight: function(element, errorClass, validClass) {
                        if ($(element).is('select') || $(element).is('input#catId')) {
                            $( element ).parent('div').find('.jcf-select').addClass(validClass).removeClass(errorClass);
                        } else{
                            $( element ).addClass(validClass).removeClass(errorClass);
                        }


                    },

                    ignore: ":disabled",
                    ignoreTitle: false,
                    errorLabelContainer: "#error_list",
                    wrapper: "li",
                    invalidHandler: function(form, validator) {
                      $('html,body').animate({ scrollTop: $('h1').offset().top }, { duration: 350, easing: 'swing'});
                    },
                    submitHandler: function(form){
                       var subButton = form.find('button');
                       subButton.prop('disabled', true);
                       subButton.text('<?php echo osc_esc_js(__('Please, wait', 'san_auto')); ?>');
                       subButton.addClass('animate');
                      form.submit();
                    }
                  });
              });
              </script>
        </script>
    </body>
</html>
