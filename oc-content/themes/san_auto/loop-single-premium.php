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

    if(class_exists('ModelCars')) {
        $attr  = ModelCars::newInstance()->getCarAttr(osc_premium_id());
        if( !empty($attr) && array_key_exists('fk_i_make_id', $attr) ) {
            $make  = ModelCars::newInstance()->getCarMakeById( $attr['fk_i_make_id'] );
        }
        $model = array() ;
        if(!empty($attr) &&  array_key_exists('fk_i_model_id', $attr) ) {
            $model = ModelCars::newInstance()->getCarModelById( $attr['fk_i_model_id'] );
        }
        $locale = osc_current_user_locale();
        if( !empty($attr) && array_key_exists('fk_vehicle_type_id', $attr) ) {
            $car_type = ModelCars::newInstance()->getVehicleTypeById($attr['fk_vehicle_type_id']);
        }
    }

    if (function_exists('youtube_update')) {
        $youtube = youtube_get_row(osc_premium_id());
    }



?>
<?php if( $view == 'gallery' ) { ?>
    <div class="item">
        <div class="item-wrap">
            <div class="item-flip">
                <div class="item-front">
                    <div class="item-photos">
                        <?php if (class_exists('ModelCars')): ?>
                            <a href="#" class="item-more-attr">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                                <div><?php _e("View Details", 'san_auto'); ?></div>
                            </a>
                         <?php endif; ?>
                        <div class="item-mark">
                            <?php
                                $now = date("Y-m-d H:i:s");
                                $pub_date = osc_premium_pub_date();
                                $hourdiff = round((strtotime($now) - strtotime($pub_date))/3600, 0);
                             ?>
                             <?php if ($hourdiff < 24): ?>
                                 <div class="item-time"> <span class="item-time"><i class="item-new"></i> </span></div>
                             <?php endif; ?>
                            <?php if(osc_item_is_premium()){?>
                                <div class="item-premium"><i class="star-check"></i> </div>
                            <?php }; ?>
                            <?php if (function_exists('watchlist')): ?>
                                <?php watchlist(); ?>
                            <?php endif; ?>
                        </div>
                        <?php if( osc_images_enabled_at_items() ) { ?>
                            <?php if(osc_count_premium_resources()) {
                                $lazytag = "";
                                    if ($lazy) {
                                        $lazytag = 'data-lazy="' . osc_resource_preview_url() . '"';
                                    } else {
                                        $lazytag = 'src="' . osc_resource_preview_url() . '"';
                                    }

                                ?>
                                <figure class="item-photo">
                                    <a href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>">
                                        <img title="<?php echo osc_esc_html(osc_premium_title()) ; ?> " alt="<?php echo osc_esc_html(osc_premium_title()) ; ?>" <?php echo $lazytag ;?>>
                                    </a>
                                </figure>
                            <?php } else { ?>
                                <figure class="item-photo not">
                                    <a href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>">
                                        <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="<?php echo osc_esc_html(osc_premium_title()) ; ?>">
                                    </a>
                                </figure>
                            <?php } }; ?>
                            <div class="item-atribut-bottom">
                                <div class="item-atribut-row">
                                    <div class="item-price">
                                        <?php if( osc_price_enabled_at_items() ) { ?>
                                            <div class="item-count"><?php echo osc_format_price(osc_premium_price(),osc_premium_currency_symbol()); ?></div>
                                        <?php } ?>
                                    </div>
                                    <div class="item-media">
                                        <?php if (function_exists('youtube_update')): ?>
                                            <?php if (isset($youtube['s_id']) && !empty($youtube['s_id'])): ?>
                                                <div class="item-you">
                                                    <i class="flaticon-youtube"></i>
                                                </div>
                                            <?php endif; ?>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="item-descp">
                        <?php if (!empty($make['s_name']) && !empty($model['s_name']) && !empty($attr['i_year'] )): ?>
                            <?php
                                $titleCar = $make['s_name'];
                                $titleCar .=  ' '. $model['s_name'];
                                $titleCar .= ', '. $attr['i_year'];
                            ?>
                            <a href="<?php echo osc_premium_url() ; ?>" class="item-title" title="<?php echo osc_esc_html($titleCar) ; ?>"><?= $titleCar; ?></a>
                        <?php else: ?>
                            <a href="<?php echo osc_premium_url() ; ?>" class="item-title" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>"><?php echo ucfirst(osc_highlight(osc_premium_title(), 100)) ; ?></a>
                        <?php endif; ?>

                        <div class="item-details-main">
                            <?php
                                $attr['locale']  = array() ;
                                if (isset($car_type)) {
                                    foreach($car_type as $c) {
                                        $attr['locale'][$c['fk_c_locale_code']]['s_car_type'] = $c['s_name'] ;
                                    }
                                }
                             ?>
                            <span class="item-det-label"><?= @$attr['locale'][$locale]['s_car_type']; ?></span>
                            <?php if (isset($attr['b_new'])): ?>
                                <span class="item-det-label"><?= $attr['b_new'] ? _e("New Car", 'san_auto') : _e("Used Car", 'san_auto'); ?></span>
                            <?php endif; ?>
                        </div>
                        <div class="item-details">
                            <div class="item-details-row">
                                <div class="item-detail-label"><?php _e("Location", 'san_auto'); ?>:</div>
                                <div class="item-detail-count"><?= osc_premium_city(); ?></div>
                            </div>
                            <?php if (class_exists('ModelCars')): ?>
                                <?php if (!empty($attr['i_mileage']) ): ?>
                                    <div class="item-details-row">
                                        <div class="item-detail-label"><?php _e("Kilometers", 'san_auto'); ?>:</div>
                                        <div class="item-detail-count"><?= number_format($attr['i_mileage'], 0, '', ' ' ); ?> km</div>
                                    </div>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                        <?php /*
                        <div class="item-details-row item-details-row-img">
                            <div class="item-detail-label">Seller:</div>
                            <div class="item-detail-ava">
                                <?php if(osc_item_user_id() <> 0) { ?>
                                    <div class="item-autor-photo">
                                        <a href="<?= osc_user_public_profile_url(osc_item_user_id()) ; ?>" ><?php user_avatar_show(osc_item_user_id(), true, false); ?></a>
                                    </div>
                                  <a href="<?php echo osc_user_public_profile_url(osc_item_user_id()); ?>"><?php echo osc_item_contact_name(); ?></a>
                                <?php } else { ?>
                                  <?php echo (osc_item_contact_name() <> '' ? osc_item_contact_name() : __('Anonymous', 'san_auto')); ?>
                                <?php } ?>
                            </div>
                        </div>
                        */?>
                    </div>
                </div>
                <?php if(class_exists('ModelCars')): ?>
                    <div class="item-back">
                        <div class="item-back-close">
                            <a class="close" href="#"><i class="ion ion-md-close"></i></a>
                        </div>
                        <div class="item-back-list">
                            <?php osc_current_web_theme_path('attributes-premium.php'); ?>
                        </div>
                        <div class="item-back-btn">
                            <a href="<?php echo osc_premium_url() ; ?>"><?php _e("View more", 'san_auto'); ?></a>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
<?php } else { ?>
    <div class="item">
        <div class="item-photos">
            <?php if( osc_images_enabled_at_items() ) { ?>
                <?php if(osc_count_premium_resources()) { ?>
                    <figure class="item-photo">
                        <a href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>">
                            <img src="<?php echo osc_resource_preview_url(); ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?> " alt="<?php echo osc_esc_html(osc_premium_title()) ; ?>">
                        </a>
                    </figure>
                <?php } else { ?>
                    <figure class="item-photo not">
                        <a href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>">
                            <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="<?php echo osc_esc_html(osc_premium_title()) ; ?>">
                        </a>
                    </figure>
                <?php } }; ?>

                <div class="item-attr-top">
                    <?php if(osc_premium_is_premium()){?>
                        <div class="item-premium">
                            <i class="star-check"></i>
                        </div>
                    <?php }; ?>
                        <div class="item-whatch">
                              <?php watchlist(); ?>
                        </div>
                </div>
                <div class="item-attr-bottom">
                    <div class="item-count-res"><i class="flaticon-photo"></i> <?= osc_count_premium_resources(); ?></div>
                </div>
        </div>
        <div class="item-property">
            <div class="item-descp">
                <?php if (!empty($make['s_name']) && !empty($model['s_name']) && !empty($attr['i_year'] )): ?>
                    <?php
                        $titleCar = $make['s_name'];
                        $titleCar .=  ' '. $model['s_name'];
                        $titleCar .= ', '. $attr['i_year'];
                    ?>
                    <a href="<?php echo osc_premium_url() ; ?>" class="item-title" title="<?php echo osc_esc_html($titleCar) ; ?>"><?= $titleCar; ?></a>
                <?php else: ?>
                    <a href="<?php echo osc_premium_url() ; ?>" class="item-title" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>"><?php echo osc_highlight(osc_premium_title(), 100) ; ?></a>
                <?php endif; ?>
                <div class="item-details-main">
                    <?php if (isset($attr['b_new'])): ?>
                        <span class="item-det-label"><?= $attr['b_new'] ? _e("New Vehicle", 'san_auto') : _e("Used Car", 'san_auto'); ?></span>
                    <?php endif; ?>
                    <?php
                        $attr['locale']  = array() ;
                        if (isset($car_type)) {
                            foreach($car_type as $c) {
                                $attr['locale'][$c['fk_c_locale_code']]['s_car_type'] = $c['s_name'] ;
                            }
                        }
                     ?>
                    <span class="item-det-label"><?= @$attr['locale'][$locale]['s_car_type']; ?></span>
                </div>
                <div class="item-details-all">
                    <div class="item-details-row">
                        <div class="item-detail-box">
                            <div class="item-detail-label"><?php _e("Kilometers", 'san_auto'); ?>:</div>
                            <?php if (!empty($attr['i_mileage']) ): ?>
                                <div class="item-detail-count"><?= number_format($attr['i_mileage'], 0, '', ' ' ); ?> <?php _e("km", 'san_auto'); ?></div>
                            <?php endif; ?>
                        </div>
                        <div class="item-detail-box">
                            <div class="item-detail-label"><?php _e("Transmission", 'san_auto'); ?>:</div>
                            <?php $transmission = array('MANUAL' => __('Manual', 'cars_attributes'), 'AUTO' => __('Auto', 'cars_attributes')); ?>
                            <?php if (!empty($attr['e_transmission']) ): ?>
                                <div class="item-detail-count"> <?= $transmission[$attr['e_transmission']]; ?></div>
                            <?php endif; ?>
                        </div>
                        <div class="item-detail-box">
                            <div class="item-detail-label"><?php _e("Power", 'san_auto'); ?>:</div>
                            <?php if (!empty($attr['i_power']) ): ?>
                                <div class="item-detail-count"><?= $attr['i_power'].' '. $attr['e_power_unit']; ?></div>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="item-details-row">
                        <div class="item-detail-box">
                            <div class="item-detail-label"><?php _e("Location", 'san_auto'); ?>:</div>
                            <div class="item-detail-count"><?= osc_premium_city(); ?></div>
                        </div>
                        <div class="item-detail-box">
                            <div class="item-detail-label"><?php _e("Fuel", 'san_auto'); ?>:</div>
                            <?php
                            $fuel = array('DIESEL' => __('Diesel', 'cars_attributes')
                                        ,'GASOLINE' => __('Gasoline', 'cars_attributes')
                                        ,'ELECTRIC-HIBRID' => __('Electric-hibrid', 'cars_attributes')
                                        ,'OTHER' => __('Other', 'cars_attributes'));
                            ?>
                            <?php if (!empty($fuel) ): ?>
                                <?php if (!empty($attr['e_fuel'])): ?>
                                    <div class="item-detail-count"><?= $fuel[$attr['e_fuel']]; ?></div>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                        <div class="item-detail-box">
                            <div class="item-detail-label"><?php _e("Doors", 'san_auto'); ?>:</div>
                            <?php if (!empty($attr['i_doors']) ): ?>
                                <div class="item-detail-count"><?= $attr['i_doors']; ?></div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php if (!osc_is_ad_page()): ?>
                <div class="item-btn">
                    <div class="item-autor">
                        <div class="item-more">
                            <a href="<?php echo osc_premium_url() ; ?>"><?php _e("View more", 'san_auto'); ?></a>
                        </div>
                        <?php if( osc_price_enabled_at_items() ) { ?>
                            <div class="item-price"><?php echo osc_format_price(osc_premium_price(),osc_premium_currency_symbol()); ?></div>
                        <?php } ?>
                        <div class="item-autor-photo">
                            <a href="<?= osc_user_public_profile_url(osc_premium_user_id()) ; ?>" ><?php user_avatar_show(osc_premium_user_id(), true, false); ?></a>
                        </div>
                        <div class="premium-autor-name">
                            <?php if(osc_premium_user_id() <> 0) { ?>
                              <a href="<?php echo osc_user_public_profile_url(osc_premium_user_id()); ?>"><?php echo osc_premium_contact_name(); ?></a>
                            <?php } else { ?>
                              <?php echo (osc_premium_contact_name() <> '' ? osc_premium_contact_name() : __('Anonymous', 'san_auto')); ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>
<?php } ?>
