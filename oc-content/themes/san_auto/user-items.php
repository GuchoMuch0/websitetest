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
                        <h2><?php _e('Your listings', 'san_auto'); ?></h2>
                    </div>
                    <div class="users-content">
                            <?php if(osc_count_items() == 0) { ?>
                                <p class="item-form-help"><?php _e("You don't have any listings yet", 'san_auto'); ?></h3>
                            <?php } else { ?>
                                <div class="item-gallery">
                                <?php while(osc_has_items()) {
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
                                    }
                                    ?>
                                    <div class="item">
                                        <div class="item-wrap">
                                            <div class="item-flip">
                                                <div class="item-front">
                                                    <div class="item-photos">
                                                        <div class="item-mark">
                                                             <div class="item-time">
                                                                 <?php if(osc_item_is_active()) { echo '<span class="itemu itemu-active">'.__('Active', 'san_auto').'</span>'; } else { echo '<span class="itemu-inactive">'.__('Inactive', 'san_auto').'</span>'; }; ?>
                                                                 <?php if(osc_item_is_premium()) { echo '<span class="itemu itemu-premium">'.__('Premium', 'san_auto').'</span>'; }; ?>
                                                                 <?php if(osc_item_is_spam()) { echo '<span class="itemu itemu-spam">'.__('Spam', 'san_auto').'</span>'; }; ?>
                                                             </div>
                                                        </div>
                                                        <?php if( osc_images_enabled_at_items() ) { ?>
                                                            <?php if(osc_count_item_resources()) { ?>
                                                                <figure class="item-photo">
                                                                    <a href="<?php echo osc_item_url() ; ?>" title="<?php echo osc_esc_html(osc_item_title()) ; ?>">
                                                                        <img src="<?php echo osc_resource_preview_url(); ?>" title="<?php echo osc_esc_html(osc_item_title()) ; ?> " alt="<?php echo osc_esc_html(osc_item_title()) ; ?>">
                                                                    </a>
                                                                </figure>
                                                            <?php } else { ?>
                                                                <figure class="item-photo not">
                                                                    <a href="<?php echo osc_item_url() ; ?>" title="<?php echo osc_esc_html(osc_item_title()) ; ?>">
                                                                        <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="<?php echo osc_esc_html(osc_item_title()) ; ?>">
                                                                    </a>
                                                                </figure>
                                                            <?php } }; ?>
                                                            <div class="item-atribut-bottom">
                                                                <div class="item-atribut-row">
                                                                    <div class="item-price">
                                                                        <?php if( osc_price_enabled_at_items() ) { ?>
                                                                            <div class="item-count"><?php echo osc_item_formatted_price(); ?></div>
                                                                        <?php } ?>
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
                                                            <a href="<?php echo osc_item_url() ; ?>" class="item-title" title="<?php echo osc_esc_html($titleCar) ; ?>"><?= $titleCar; ?></a>
                                                        <?php else: ?>
                                                            <a href="<?php echo osc_item_url() ; ?>" class="item-title" title="<?php echo osc_esc_html(osc_item_title()) ; ?>"><?php echo ucfirst(osc_highlight(osc_item_title(), 100)) ; ?></a>
                                                        <?php endif; ?>

                                                        <div class="item-details">
                                                            <div class="item-details-views">
                                                                    <i class="ion ion-md-eye"></i> <span><?php echo osc_item_views(); ?> <?php _e('views', 'san_auto'); ?></span>
                                                            </div>
                                                            <div class="item-details-row">
                                                                <a class="item-edit-btn" target="_blank" href="<?php echo osc_item_edit_url(); ?>"><i class="ion ion-md-create"></i> <?php _e('Edit', 'san_auto'); ?></a>
                                                                <a class="item-edit-btn" target="_blank" href="<?php echo osc_item_delete_url(); ?>"><i class="ion ion-md-trash"></i> <?php _e('Delete', 'san_auto'); ?></a>
                                                                <?php if(osc_item_is_inactive()) { ?>
                                                                    <a class="item-edit-btn" target="_blank" href="<?php echo osc_item_activate_url(); ?>"><i class="ion ion-md-checkmark-circle-outline"></i> <?php _e('Validate', 'san_auto'); ?></a>
                                                                 <?php } ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                            <?php } ?>
                        </div>
                        <div class="paginate" >
                        <?php for($i = 0; $i < osc_list_total_pages(); $i++) {
                            if($i == osc_list_page()) {
                                printf('<a class="searchPaginationSelected" href="%s">%d</a>', osc_user_list_items_url($i+1), ($i + 1));
                            } else {
                                printf('<a class="searchPaginationNonSelected" href="%s">%d</a>', osc_user_list_items_url($i+1), ($i + 1));
                            }
                        } ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
