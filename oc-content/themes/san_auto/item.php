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

    if(class_exists('ModelCars')) {
        $attr  = ModelCars::newInstance()->getCarAttr(osc_item_id());
        if( !empty($attr) && array_key_exists('fk_i_make_id', $attr) ) {
            $make = ModelCars::newInstance()->getCarMakeById( $attr['fk_i_make_id'] );
        }
        $model = array();
        if( !empty($attr) && array_key_exists('fk_i_model_id', $attr) ) {
            $model = ModelCars::newInstance()->getCarModelById( $attr['fk_i_model_id'] );
        }

        $locale = osc_current_user_locale();
        if( !empty($attr) && array_key_exists('fk_vehicle_type_id', $attr) ) {
            $car_type = ModelCars::newInstance()->getVehicleTypeById($attr['fk_vehicle_type_id']);
        }

        if( count($attr) == 0 ) {
            return ;
        }

        $attr['locale']  = array() ;
        foreach($car_type as $c) {
            $attr['locale'][$c['fk_c_locale_code']]['s_car_type'] = $c['s_name'] ;
        }

        /* Title for social */
        $title_fc ="";
        if (!empty($make['s_name']) && !empty($model['s_name']) && !empty($attr['i_year'] )){
                $titleCar = $make['s_name'];
                $titleCar .=  ' '. $model['s_name'];
                $titleCar .= ', '. $attr['i_year'];
                $title_fc = $titleCar;
        } else {
             $title_fc = ucfirst(osc_item_title()) ;
        }
    }

    if(osc_item_price() == '') {
        $fcprice = __('Check with seller', 'san_auto');
    } else if(osc_item_price() == 0) {
        $fcprice = __('Free', 'san_auto');
    } else {
        $fcprice = osc_item_price();
    }


    $location = array();
    $aCountries = Country::newInstance()->listAll();
    if (count($aCountries) >= 0) {
        if( osc_item_country() !== '' ) {
            $location[] = osc_item_country();
        }
    }
    if( osc_item_region() !== '' ) {
        $location[] = osc_item_region();
    }
    if( osc_item_city() !== '' ) {
        $location[] = osc_item_city();
    }

    $user = User::newInstance()->findByPrimaryKey(osc_item_user_id());
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index, follow" />

        <?php osc_get_item_resources(); ?>
        <meta property="og:title" content="<?php echo osc_esc_html($title_fc); ?>" />
        <?php if(osc_count_item_resources() > 0) { ?><meta property="og:image" content="<?php echo osc_resource_url(); ?>" /><?php } ?>
        <meta property="og:site_name" content="<?php echo osc_esc_html(osc_page_title()); ?>"/>
        <meta property="og:url" content="<?php echo osc_item_url(); ?>" />
        <meta property="og:description" content="<?php echo osc_esc_html(osc_highlight(osc_item_description(), 500)); ?>" />
        <meta property="og:type" content="article" />
        <meta property="og:locale" content="<?php echo osc_current_user_locale(); ?>" />
        <meta property="product:retailer_item_id" content="<?php echo osc_item_id(); ?>" />
        <meta property="product:price:amount" content="<?php echo $fcprice; ?>" />
        <?php if(osc_item_price() <> '' and osc_item_price() <> 0) { ?><meta property="product:price:currency" content="<?php echo osc_item_currency(); ?>" /><?php } ?>

        <span itemscope itemtype="http://schema.org/Product">
          <meta itemprop="name" content="<?php echo osc_esc_html($title_fc); ?>" />
          <meta itemprop="description" content="<?php echo osc_esc_html(osc_highlight(osc_item_description(), 500)); ?>" />
          <?php if(osc_count_item_resources() > 0) { ?><meta itemprop="image" content="<?php echo osc_resource_url(); ?>" /><?php } ?>
        </span>
    </head>
    <body class="item-page">
        <?php osc_current_web_theme_path('header.php'); ?>
        <div class="item">
            <div class="wrapper">
                <div class="item-status-mark">
                    <?php if(osc_is_web_user_logged_in() && osc_logged_user_id()==osc_item_user_id()) { ?>
                        <a href="<?php echo osc_item_edit_url(); ?>" rel="nofollow"><?php _e('Edit item', 'san_auto'); ?></a>
                    <?php } else { ?>
                        <?php if (osc_get_preference('mark', 'san_auto') !== '0'): ?>
                            <div class="item-report">
                                <div class="item-report-label"><?php _e('Mark as', 'san_auto'); ?></div>
                                <div class="item-report-select">
                                    <a id="item_spam" href="<?php echo osc_item_link_spam(); ?>" rel="nofollow"><?php _e('spam', 'san_auto'); ?></a>
                                    <a id="item_bad_category" href="<?php echo osc_item_link_bad_category(); ?>" rel="nofollow"><?php _e('misclassified', 'san_auto'); ?></a>
                                    <a id="item_repeated" href="<?php echo osc_item_link_repeated(); ?>" rel="nofollow"><?php _e('duplicated', 'san_auto'); ?></a>
                                    <a id="item_expired" href="<?php echo osc_item_link_expired(); ?>" rel="nofollow"><?php _e('expired', 'san_auto'); ?></a>
                                    <a id="item_offensive" href="<?php echo osc_item_link_offensive(); ?>" rel="nofollow"><?php _e('offensive', 'san_auto'); ?></a>
                                </div>
                            </div>
                        <?php endif; ?>
                    <?php }; ?>
                </div>
                <div class="item-box<?= osc_get_preference('rtl2', 'san_auto') == '0' ? " item-reserve" : "" ;?>">
                    <div class="item-content">
                        <div class="item-image">
                            <div class="item-mark">
                                <?php if (class_exists('ModelCars')): ?>
                                    <?php if (isset($attr['b_new'])): ?>
                                        <span class="item-det-label"><?= $attr['b_new'] ? _e("New Car", 'san_auto') : _e("Used Car", 'san_auto'); ?></span>
                                    <?php endif; ?>
                                <?php endif; ?>
                                <?php if (function_exists('watchlist')): ?>
                                    <?php watchlist(); ?>
                                <?php endif; ?>
                            </div>
                            <?php if( osc_images_enabled_at_items() ) { ?>
                                <div class="item-photos">
                                    <?php if( osc_count_item_resources() > 0 ) { ?>
                                        <div class="item-prew-box">
                                            <a href="#" class="item-left-img"><i class="flaticon-down-arrow"></i></a>
                                            <a href="#" class="item-right-img"><i class="flaticon-down-arrow"></i></a>
                                            <div class="item-prev">
                                                <?php for ( $i = 0; osc_has_item_resources(); $i++ ) {
                                                    ?>
                                                    <a data-fancybox="images" data-caption="<?php _e('Image', 'san_auto'); ?> <?php echo $i+1;?> / <?php echo osc_count_item_resources();?>" href="<?php echo osc_resource_url(); ?>"  title="<?php _e('Image', 'san_auto'); ?> <?php echo $i+1;?> / <?php echo osc_count_item_resources();?>">
                                                        <span style="background-image: url('<?php echo osc_resource_url(); ?>');"></span>
                                                        <img src="<?php echo osc_resource_url(); ?>" alt="<?php echo osc_esc_html(osc_item_title()); ?>" title="<?php echo osc_esc_html(osc_item_title()); ?>" />
                                                    </a>
                                                <?php } ?>
                                            </div>
                                            <?php if( osc_count_item_resources() > 1 ) { ?>
                                                <div class="item-count-photo">
                                                    <i class="flaticon-photo"></i>
                                                    <span class="count-ph"></span>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    <?php } else {?>
                                        <div class="item-prev">
                                            <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" width="100%" alt="<?php echo osc_esc_html(osc_item_title()); ?>" title="<?php echo osc_esc_html(osc_item_title()); ?>" />
                                        </div>
                                    <?php } ?>
                                    <?php osc_reset_resources(); ?>
                                    <?php if( osc_count_item_resources() > 1 ) { ?>
                                        <div class="item-image-nav">
                                            <?php for ( $i = 0; osc_has_item_resources(); $i++ ) { ?>
                                                <figure>
                                                    <img src="<?php echo osc_resource_thumbnail_url(); ?>" width="auto" height="auto" alt="<?php echo osc_esc_html(osc_item_title()); ?>" title="<?php echo osc_esc_html(osc_item_title()); ?>" />
                                                </figure>
                                            <?php } ?>
                                        </div>
                                        <script type="text/javascript">
                                            $('.item-prev').on('init reInit afterChange', function(event, slick, currentSlide, nextSlide){
                                                var i = (currentSlide ? currentSlide : 0) + 1;
                                                $('.count-ph').text(i + ' <?php echo osc_esc_js(__('of', 'san_auto')); ?> ' + slick.slideCount);
                                            });
                                        </script>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="item-content-box">
                            <div class="item-detail">
                                <?php if( osc_count_item_meta() >= 1 ) { ?>
                                    <div class="item-meta">
                                        <?php while ( osc_has_item_meta() ) { ?>
                                            <?php if(osc_item_meta_value()!='') { ?>
                                                <div class="meta">
                                                    <strong><?php echo osc_item_meta_name(); ?>:</strong> <?php echo osc_item_meta_value(); ?>
                                                </div>
                                            <?php } ?>
                                        <?php } ?>
                                    </div>
                                <?php } ?>

                                <div class="item-description">
                                    <h2><?php _e('Description', 'san_auto'); ?></h2>
                                    <p><?php echo osc_item_description(); ?></p>
                                </div>

                                <?php if(class_exists('ModelCars')): ?>
                                    <h2><?php _e('Car details', 'san_auto'); ?></h2>
                                    <div class="item-car-attr">
                                        <div class="item-car-coll">
                                            <?php if( !empty($attr['locale'][$locale]['s_car_type']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Car type', 'san_auto'); ?>:</div>
                                                    <div><?php echo @$attr['locale'][$locale]['s_car_type']; ?></div>
                                                </div>
                                            <?php } ?>
                                            <?php if( !empty($attr['i_year']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Year', 'san_auto'); ?>:</div>
                                                    <div><?php echo $attr['i_year']; ?></div>
                                                </div>
                                            <?php } ?>
                                            <?php if( !empty($attr['i_doors']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Doors', 'san_auto'); ?>:</div>
                                                    <div><?php echo @$attr['i_doors']; ?></div>
                                                </div>
                                            <?php } ?>
                                            <?php if( !empty($attr['i_seats']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Seats', 'san_auto'); ?>:</div>
                                                    <div><?php echo @$attr['i_seats']; ?></div>
                                                </div>
                                            <?php } ?>
                                            <?php if( !empty($attr['i_mileage']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Mileage', 'san_auto'); ?>:</div>
                                                    <div><?= number_format(@$attr['i_mileage'], 0, '', ' ' ); ?> km</div>
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="item-car-coll">

                                            <?php if( !empty($attr['i_engine_size']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Engine size (cc)', 'san_auto'); ?>:</div>
                                                    <div><?= number_format(@$attr['i_engine_size'], 0, '', ' ' ); ?></div>
                                                </div>
                                            <?php } ?>
                                            <?php if( !empty($attr['i_num_airbags']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Num. Airbags', 'san_auto'); ?>:</div>
                                                    <div><?php echo @$attr['i_num_airbags']; ?></div>
                                                </div>
                                            <?php } ?>
                                            <?php if( !empty($attr['e_transmission']) ) { ?>
                                                <div class="item-car-row">
                                                    <?php $transmission = array('MANUAL' => __('Manual', 'san_auto'), 'AUTO' => __('Auto', 'san_auto')); ?>
                                                    <div><?php _e('Transmission', 'san_auto'); ?>:</div>
                                                    <div><?php echo $transmission[$attr['e_transmission']]; ?></div>
                                                </div>
                                            <?php } ?>
                                            <?php if( !empty($attr['e_fuel']) ) { ?>
                                                <div class="item-car-row">
                                                    <?php $fuel = array('DIESEL'          => __('Diesel', 'san_auto')
                                                                       ,'GASOLINE'        => __('Gasoline', 'san_auto')
                                                                       ,'ELECTRIC-HIBRID' => __('Electric-hibrid', 'san_auto')
                                                                       ,'OTHER'           => __('Other', 'san_auto'));
                                                    ?>
                                                    <div><?php _e('Fuel', 'san_auto'); ?>:</div>
                                                    <div><?php echo $fuel[$attr['e_fuel']]; ?></div>
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="item-car-coll">
                                            <?php if( !empty($attr['e_seller']) ) { ?>
                                                <div class="item-car-row">
                                                    <?php $seller = array('DEALER' => __('Dealer', 'san_auto'), 'OWNER' => __('Owner', 'san_auto')); ?>
                                                    <div><?php _e('Seller', 'san_auto'); ?>:</div>
                                                    <div><?php echo $seller[$attr['e_seller']]; ?></div>
                                                </div>
                                            <?php } ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Warranty', 'san_auto'); ?>: </div>
                                                    <div><?php echo @$attr['b_warranty'] ? '<strong>' . __('Yes', 'san_auto') . '</strong>' : __('No', 'san_auto'); ?></div>
                                                </div>

                                            <?php if( !empty($attr['i_power']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Power', 'san_auto'); ?>:</div>
                                                    <div><?php echo @$attr['i_power']; ?> <?php echo @$attr['e_power_unit']; ?></div>
                                                </div>
                                            <?php } ?>
                                            <?php if( !empty($attr['i_gears']) ) { ?>
                                                <div class="item-car-row">
                                                    <div><?php _e('Gears', 'san_auto'); ?>:</div>
                                                    <div><?php echo @$attr['i_gears']; ?></div>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                <?php endif; ?>

                                <div class="item-deatail-hook">
                                    <?php osc_run_hook('item_detail', osc_item() ); ?>
                                </div>
                            </div>
                        </div>

                        <?php if (function_exists('youtube_item_detail')):
                                $youtube = youtube_get_row(osc_item_id());
                             ?>
                            <?php if( isset($youtube['s_id']) && !empty($youtube['s_id']) ): ?>
                            <div class="item-content-box">
                                <div class="item-video">
                                    <h2><?php _e('Video review', 'san_auto'); ?></h2>
                                    <?php youtube_item_detail(); ?>
                                </div>
                            </div>
                            <?php endif; ?>
                        <?php endif; ?>
                        <?php if (osc_get_preference('useful', 'san_auto') !== '0'): ?>
                            <div class="item-content-box">
                                <h2><?php _e('Useful information', 'san_auto'); ?></h2>
                                <ul class="item-useful">
                                    <li><?php _e('Avoid scams by acting locally or paying with PayPal', 'san_auto'); ?></li>
                                    <li><?php _e('Never pay with Western Union, Moneygram or other anonymous payment services', 'san_auto'); ?></li>
                                    <li><?php _e('Don\'t buy or sell outside of your country. Don\'t accept cashier cheques from outside your country', 'san_auto'); ?></li>
                                    <li><?php _e('This site is never involved in any transaction, and does not handle payments, shipping, guarantee transactions, provide escrow services, or offer "buyer protection" or "seller certification"', 'san_auto'); ?></li>
                                </ul>
                            </div>
                        <?php endif; ?>
                        <?php if (osc_comments_enabled()): ?>
                            <?php if (osc_reg_user_post_comments () && osc_is_web_user_logged_in() || !osc_reg_user_post_comments() ): ?>
                                <div class="item-comment">
                                    <div class="item-content-box">
                                        <h2><?php _e('Comments', 'san_auto'); ?></h2>
                                        <?php CommentForm::js_validation(); ?>
                                        <?php if( osc_count_item_comments() >= 1 ) { ?>
                                            <div class="item-comments">
                                                <?php while ( osc_has_item_comments() ) { ?>
                                                    <div class="item-comment-user">
                                                        <div class="user-commenta-ava">
                                                            <a href="<?= osc_user_public_profile_url(osc_comment_user_id()) ; ?>" ><?php user_avatar_show(osc_comment_user_id(), true, false, true); ?></a>
                                                        </div>
                                                        <div class="user-commenta-text">
                                                            <h3><?php echo osc_comment_title(); ?> <?php _e("by", 'san_auto'); ?> <span<?= osc_comment_user_id() && (osc_comment_user_id() == osc_logged_user_id()) ? ' class="color"' : '';?>><?php echo osc_comment_author_name(); ?></span>:</h3>
                                                            <p><?php echo nl2br( osc_comment_body() ); ?></p>
                                                            <?php if ( osc_comment_user_id() && (osc_comment_user_id() == osc_logged_user_id()) ) { ?>
                                                                <p class="coment-delete">
                                                                    <a rel="nofollow" href="<?php echo osc_delete_comment_url(); ?>" title="<?php _e('Delete your comment', 'san_auto'); ?>"><i class="flaticon-cross-out"></i> </a>
                                                                </p>
                                                            <?php } ?>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <div class="paginate">
                                                    <?php echo osc_comments_pagination(); ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <div class="item-form">
                                            <form action="<?php echo osc_base_url(true); ?>" method="post" name="comment_form">
                                                <div class="item-form-box">
                                                    <fieldset>
                                                        <h3 class="item-form-help"><?php _e('Leave your comment (spam and offensive messages will be removed)', 'san_auto'); ?></h3>
                                                        <ul id="comment_error_list"></ul>
                                                        <input type="hidden" name="action" value="add_comment" />
                                                        <input type="hidden" name="page" value="item" />
                                                        <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
                                                        <div class="item-form-elements">
                                                            <?php if(osc_is_web_user_logged_in()) { ?>
                                                                <input type="hidden" name="authorName" value="<?php echo osc_esc_html( osc_logged_user_name() ); ?>" />
                                                                <input type="hidden" name="authorEmail" value="<?php echo osc_logged_user_email();?>" />
                                                            <?php } else { ?>
                                                                <div class="item-form-input">
                                                                    <?php CommentForm::author_input_text(); ?>
                                                                </div>
                                                                <div class="item-form-input">
                                                                    </label> <?php CommentForm::email_input_text(); ?>
                                                                </div>
                                                            <?php }; ?>
                                                            <div class="item-form-input">
                                                                <?php CommentForm::title_input_text(); ?>
                                                            </div>
                                                            <div class="item-form-input">
                                                                <?php CommentForm::body_input_textarea(); ?>
                                                            </div>
                                                            <?php if(class_exists('ModelGdpr')): ?>
                                                                <div class="item-form-input">
                                                                    <?php osc_run_hook('gdpr'); ?>
                                                                </div>
                                                            <?php endif; ?>
                                                            <button class="btn" type="submit"><i class="flaticon-send"></i> <?php _e('Send', 'san_auto'); ?></button>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            <?php endif; ?>
                        <?php endif; ?>
                        <div class="item-related">
                            <div class="item-content-box">
                                <h2><?php _e('Related cars', 'san_auto'); ?></h2>
                                <?php if (function_exists('related_san_auto')): ?>
                                    <?php related_san_auto(); ?>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                    <div class="item-sidebar">
                        <div class="item-sidebar-box">
                            <div class="item-title">
                                <?php if (!empty($make['s_name']) && !empty($model['s_name']) && !empty($attr['i_year'] )): ?>
                                    <?php
                                        $titleCar = $make['s_name'];
                                        $titleCar .=  ' '. $model['s_name'];
                                        $titleCar .= ', '. $attr['i_year'];
                                    ?>
                                    <h1><?= $titleCar; ?></h1>
                                <?php else: ?>
                                    <h1><?php echo ucfirst(osc_item_title()) ; ?></h1>
                                <?php endif; ?>
                                <?php if(osc_item_is_premium()){?>
                                    <div class="itempage-premium"><i class="star-check"></i></div>
                                <?php }; ?>
                            </div>
                            <div class="item-attr-data">
                                <div class="item-det-label"><?= osc_item_category(); ?></div>
                                <?php if (osc_item_mod_date() == '') { ?>
                                    <div class="item-det-label"><?php _e('Published', 'san_auto'); ?>: <?php echo osc_format_date( osc_item_pub_date()); ?></div>
                                <?php } else { ?>
                                    <div class="item-det-label"><?php _e('Edited', 'san_auto'); ?>: <?php echo osc_format_date( osc_item_mod_date()); ?></div>
                                <?php } ?>
                                <div class="item-det-label"><?php _e('ID', 'san_auto'); ?> #<?php echo osc_item_id(); ?></div>
                                <div class="item-det-label"><?php _e('View', 'san_auto'); ?>: <?php echo osc_item_views(); ?></div>
                            </div>
                            <?php if( !osc_item_is_expired () ) { ?>
                                <?php if( !( ( osc_logged_user_id() == osc_item_user_id() ) && osc_logged_user_id() != 0 ) ) { ?>
                                    <?php  if(osc_reg_user_can_contact() && osc_is_web_user_logged_in() || !osc_reg_user_can_contact() ) { ?>
                                        <div class="item-contact">
                                            <a href="#contact"> <i class="flaticon-envelope"></i> <?php _e('Contact seller', 'san_auto'); ?></a>
                                        </div>
                                    <?php }  ?>
                                <?php }  ?>
                            <?php }  ?>
                            <?php if( osc_price_enabled_at_items() && osc_item_category_price_enabled() ) { ?>
                                <div class="item-price">
                                    <span><?php echo osc_item_formated_price(); ?></span>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="item-sidebar-box">
                            <div class="item-author">
                                <div class="item-photo-user">
                                    <?php if(!osc_item_user_id() <> 0): ?>
                                        <?php user_avatar_show("", true, false); ?>
                                    <?php else: ?>
                                        <a href="<?= osc_user_public_profile_url(osc_item_user_id()) ; ?>" ><?php user_avatar_show(osc_item_user_id(), true, false); ?></a>
                                    <?php endif; ?>
                                </div>
                                <div class="item-name">
                                    <?php if(osc_item_user_id() <> 0) { ?>
                                            <a class="item-name-link" href="<?php echo osc_user_public_profile_url(osc_item_user_id()); ?>"><?php echo osc_item_contact_name(); ?></a>
                                            <span class="item-more"><?php seller_post(); ?></span>
                                    <?php } else { ?>
                                        <?php echo (osc_item_contact_name() <> '' ? osc_item_contact_name() : __('Anonymous', 'san_auto')); ?>
                                    <?php } ?>
                                </div>
                                <div class="item-contact-us">
                                    <a class="item-tel" data-count="0" href="#" onclick="return false;">
                                        <?php if (osc_get_preference('cityarea', 'san_auto') == 1): ?>
                                            <?= hideText(osc_item_city_area());?>
                                        <?php else: ?>
                                            <?= hideText($user['s_phone_mobile']);?>
                                        <?php endif; ?>
                                        <span class="item-display-cont"><i class="fas fa-eye"></i></span></a>
                                    <?php if (osc_item_show_email()): ?>
                                        <a class="item-email" data-count="1" href="#" onclick="return false;"><?php echo hideText(osc_item_contact_email()); ?> <span class="item-display-cont"><i class="fas fa-eye"></i></span></a>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="item-contact-user">
                                <?php if( osc_item_is_expired () ) { ?>
                                    <p class="item-form-help"><?php _e("The listing is expired. You can't contact the publisher.", 'san_auto'); ?></p>
                                <?php } else if( ( osc_logged_user_id() == osc_item_user_id() ) && osc_logged_user_id() != 0 ) { ?>
                                    <p class="item-form-help"><?php _e("It's your own listing, you can't contact the publisher.", 'san_auto'); ?></p>
                                <?php } else if( osc_reg_user_can_contact() && !osc_is_web_user_logged_in() ) { ?>
                                    <p class="item-form-help"><?php _e("You must log in or register a new account in order to contact the advertiser", 'san_auto'); ?></p>
                                    <p class="contact_button">
                                        <a href="<?php echo osc_user_login_url(); ?>"><?php _e('Login', 'san_auto'); ?></a>
                                        <a href="<?php echo osc_register_account_url(); ?>"><?php _e('Register', 'san_auto'); ?></a>
                                    </p>
                                <?php } else { ?>
                                    <div class="item-form">
                                        <ul id="error_list"></ul>
                                        <?php ContactForm::js_validation(); ?>
                                        <form <?php if( osc_item_attachment() ) { ?>enctype="multipart/form-data"<?php } ?> action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact_form">
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
                                                    <?php if( osc_item_attachment() ) { ?>
                                                        <div class="item-form-input">
                                                            <div class="item-form-attachment">
                                                                <?php ContactForm::your_attachment() ; ?>
                                                            </div>
                                                        </div>
                                                    <?php } ?>
                                                    <?php osc_run_hook('item_contact_form', osc_item_id()); ?>
                                                    <div class="item-form-input">
                                                        <?php ContactForm::your_message(); ?>
                                                    </div>
                                                    <input type="hidden" name="action" value="contact_post" />
                                                    <input type="hidden" name="page" value="item" />
                                                    <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
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
                                                    <button class="btn" type="submit"><i class="flaticon-send"></i> <?php _e('Send', 'san_auto'); ?></button>
                                                </fieldset>
                                            </div>
                                        </form>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="item-sidebar-box">
                            <h3><?php echo implode(' - ', $location); ?></h3>
                            <?php
                                if( osc_item_address() !== '' ) { ?>
                                    <h3><?=  osc_item_address(); ?></h3>
                                <?php }  ?>
                            <?php osc_run_hook('location'); ?>
                        </div>

                        <div class="item-sidebar-box">
                            <div class="share-list">
                                <a class="share share-facebook" title="<?php echo osc_esc_html(__('Share on Facebook', 'san_auto')); ?>" rel="nofollow" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo osc_item_url(); ?>"><i class="fab fa-facebook-f"></i></a>
                                <a class="share share-twitter" title="<?php echo osc_esc_html(__('Share on Twitter', 'san_auto')); ?>" rel="nofollow" target="_blank" href="https://twitter.com/intent/tweet?text=<?php echo urlencode($title_fc); ?>&url=<?php echo urlencode(osc_item_url()); ?>"><i class="fab fa-twitter"></i></a>
                                <a class="share share-telegram" title="<?php echo osc_esc_html(__('Share on Telegram', 'san_auto')); ?>" rel="nofollow" target="_blank" href="https://telegram.me/share/url?url=<?php echo urlencode(osc_item_url()); ?>&text=<?php echo urlencode($title_fc); ?>"><i class="fab fa-telegram-plane"></i></a>
                                <a class="share share-vk" title="<?php echo osc_esc_html(__('Share on Vkontakte', 'san_auto')); ?>" rel="nofollow" target="_blank" href="https://vk.com/share.php?url=<?php echo urlencode(osc_item_url()); ?>"><i class="fab fa-vk"></i></a>
                                <a class="share share-whatsapp only-mobile" title="<?php echo osc_esc_html(__('Share on Whatsapp', 'san_auto')); ?>" rel="nofollow" target="_blank" href="https://api.whatsapp.com/send?text=<?php echo urlencode($title_fc); ?>" data-action="share/whatsapp/share"><i class="fab fa-whatsapp"></i></a>
                                <a class="share share-viber only-mobile" title="<?php echo osc_esc_html(__('Share on Viber', 'san_auto')); ?>" rel="nofollow" target="_blank" href="viber://forward?text=<?php echo urlencode($title_fc); ?>"><i class="fab fa-viber"></i></a>
                                <a class="share share-friend" href="<?php echo osc_item_send_friend_url(); ?>" title="<?php echo osc_esc_html(__('Send to a friend', 'san_auto')); ?>" target="_blank" rel="nofollow"><i class="fas fa-user-friends"></i></a>
                            </div>
                        </div>

                        <?php if(osc_get_preference('hide_ads', 'san_auto') !== '0') { ?>
                            <?php if( osc_get_preference('sidebar-300x250', 'san_auto') != '') {?>
                                <div class="seidebar-infouser">
                                    <?php echo osc_get_preference('sidebar-300x250', 'san_auto'); ?>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
        <?php osc_current_web_theme_path('footer.php'); ?>
        <script type="text/javascript">
                $(document).ready(function(){
                    <?php if( osc_images_enabled_at_items() ) : ?>
                        // SLIDER IMAGE ITEM
                        $('.item-prev').slick({
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            arrows: true,
                            fade: true,
                            dots: false,
                            asNavFor: '.item-image-nav',
                            prevArrow: $('.item-left-img'),
                            nextArrow: $('.item-right-img'),
                        });

                        $('.item-image-nav').slick({
                             slidesToShow: 4,
                             slidesToScroll: 1,
                             infinite: true,
                             asNavFor: '.item-prev',
                             dots: false,
                             centerMode: false,
                             focusOnSelect: true,
                             arrows: false,
                             responsive: [
                                  {
                                    breakpoint: 768,
                                    settings: {
                                      slidesToShow: 2,
                                      slidesToScroll: 1,
                                    }
                                }]
                        });
                    <?php endif; ?>

                    <?php if (osc_comments_enabled()): ?>
                        // REMOVE PLACEHOLDER COMMENTS
                        <?php if(!osc_is_web_user_logged_in()) : ?>
                            $(".item-form-input #authorName").attr('placeholder', '<?php echo osc_esc_js(__('Your name', 'san_auto')); ?>');
                            $(".item-form-input #authorEmail").attr('placeholder', '<?php echo osc_esc_js(__('Your e-mail', 'san_auto')); ?>');
                        <?php endif; ?>
    		              $(".item-form-input #title").attr('placeholder', '<?php echo osc_esc_js(__('Title', 'san_auto')); ?>');
    		              $(".item-form-input #body").attr('placeholder', '<?php echo osc_esc_js(__('Comment', 'san_auto')); ?>');
                    <?php endif; ?>



                    <?php if( osc_item_attachment() ) : ?>
                        // REMOVE TYPE FILE
                        $(function() {
                          var customFile = $('[type="file"]');
                          jcf.setOptions('File', {
                            buttonText: '<?php echo osc_esc_js(__('Choose file', 'san_auto')); ?>',
                            placeholderText: '<?php echo osc_esc_js(__('No file chosen', 'san_auto')); ?>'

                          });
                          jcf.replace(customFile);
                        });
                    <?php endif; ?>


                    <?php if( !osc_item_is_expired () ) : ?>
                        <?php if( !( ( osc_logged_user_id() == osc_item_user_id() ) && osc_logged_user_id() != 0 ) ) : ?>
                            <?php  if(osc_reg_user_can_contact() && osc_is_web_user_logged_in() || !osc_reg_user_can_contact() ) : ?>
                                // SHOW CONTACT FORM
                                $(document).on('click', '.item-contact a', function() {
                                     $(".item-contact-user").slideToggle();
                                    return false;
                                });

                                $(".item-form-input #yourName").attr('placeholder', '<?php echo osc_esc_js(__('Your name', 'san_auto')); ?>');
                                $(".item-form-input #yourEmail").attr('placeholder', '<?php echo osc_esc_js(__('Your e-mail', 'san_auto')); ?>');
                                $(".item-form-input #phoneNumber").attr('placeholder', '<?php echo osc_esc_js(__('Phone number (optional)', 'san_auto')); ?>');
                                $(".item-form-input #message").attr('placeholder', '<?php echo osc_esc_js(__('Message ', 'san_auto')); ?>');
                            <?php endif; ?>
                        <?php endif; ?>
                    <?php endif; ?>




                    // SHOW EMAIL/PHONE
                    $(document).on('click touchend', '.item-display-cont', function(){
                        var $count = "";
                        var $data = $(this).parent().data('count');
                            if ($data == 0) {
                                <?php if (osc_get_preference('cityarea', 'san_auto') == 1): ?>
                                    $count = '<?= osc_item_city_area(); ?>';
                                <?php else: ?>
                                    $count =  '<?= $user['s_phone_mobile']; ?>';
                                <?php endif; ?>
                                $(this).parent().text($count).attr({
                                    'href':'tel:'+ $count +'',
                                    'onclick': 'return true;'
                                });
                            }
                        <?php if (osc_item_show_email()): ?>
                            else if ($data == 1) {
                                $count = '<?= osc_item_contact_email(); ?>';
                                $(this).parent().text($count).attr({
                                    'href': 'mailto:'+ $count +'',
                                    'onclick': 'return true;'
                                });
                            }
                        <?php endif; ?>
                    });

                    // LOAD VIDEO oN CLICK
                    <?php if (function_exists('youtube_item_detail')): ?>
                        <?php if( isset($youtube['s_id']) && !empty($youtube['s_id']) ): ?>
                            $(document).on('click', '.item-content-box .video-link', function() {
                                $iframe= $(this).parent().find('iframe');
                                $src = $iframe.attr('src');
                                $iframe.attr({
                                    'src': $src + '?autoplay=1&mute=0&enablejsapi=1',
                                    'allow' : 'autoplay'
                                });
                                $(this).addClass('hide');
                                return false;
                            });
                        <?php endif; ?>
                    <?php endif; ?>
                });
        </script>
    </body>
</html>
