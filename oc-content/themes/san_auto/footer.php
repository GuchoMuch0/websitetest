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
     $countPageSize = "";
     if (Params::getParam('iPagesize') == '' or Params::getParam('iPagesize') == null) {
         $countPageSize = "";
     } else {
         $countPageSize = intval(Params::getParam('iPagesize'));
     }

    $make_global  = Params::getParam('make') ;
    $model_global = Params::getParam('model') ;
    $type_global  = Params::getParam('type') ;
    $transmission_global = Params::getParam('transmission') ;
    $makes_global  = ModelCars::newInstance()->getCarMakes();
        $models_global = array();
        if($make_global != '') {
            $models_global = ModelCars::newInstance()->getCarModels($make_global);
        }
    $types_global = ModelCars::newInstance()->getVehiclesType(osc_current_user_locale());
?>

<footer>
    <?php if (!osc_is_home_page()): ?>
        <?php if(osc_get_preference('hide_ads', 'san_auto') !== '0') { ?>
            <?php if(osc_get_preference('footer-728x90', 'san_auto')!="") { ?>
                    <div class="figure-rek">
                        <div class="i728-90">
                            <?php echo osc_get_preference('footer-728x90', 'san_auto'); ?>
                        </div>
                    </div>
            <?php } ?>
        <?php } ?>
    <?php endif; ?>
    <div class="wrapper">
        <?php osc_show_widgets('footer'); ?>
        <div class="footer-box">
            <?php if (osc_get_preference('logo_footer', 'san_auto') !== '0'): ?>
                <div class="footer-logo">
                    <figure>
                        <a id="logo2" href="<?php echo osc_base_url(); ?>"><?php echo logo_footer(); ?></a>
                    </figure>
                    <span class="copyright">© <?= date('Y');?></span>
                    <?php if(osc_get_preference('footer_link', 'san_auto') !== '0') {
                        echo '<div class="san-osclass">' . sprintf(__('This website is proudly using the <a href="%s" target="_blank">theme</a> by <strong>San-Osclass</strong>'), 'https://san-osclass.com/') . '</div>';
                    }
                    ?>
                </div>
            <?php endif; ?>
            <?php if (osc_get_preference('cust', 'san_auto') !== '0'): ?>
                <div class="footer-menu">
                    <h4><?php _e('Customers', 'san_auto'); ?></h4>
                    <a href="<?= osc_search_url(array('sCompany' => 0)); ?>"><?php _e('Private', 'san_auto'); ?></a>
                    <a href="<?= osc_search_url(array('sCompany' => 1)); ?>"><?php _e('Dealers', 'san_auto'); ?></a>
                </div>
            <?php endif; ?>
            <?php if (osc_get_preference('cat', 'san_auto') !== '0'): ?>
                <?php
                    $countCat = osc_get_preference('cat_count', 'san_auto');
                 ?>
            <div class="footer-menu">
                <h4><?php _e('Category', 'san_auto'); ?></h4>
                <?php osc_goto_first_category(); ?>
                <?php $b = 1; while (osc_has_categories() )  {  ?>
                  <?php if ($b <= $countCat): ?>
                        <a class="b<?= $b ?>" href="<?php echo osc_search_category_url() ; ?>" ><?php echo osc_category_name() ; ?></a>
                      <?php endif; ?>
                  <?php $b++; } ?>
            </div>
            <?php endif; ?>
            <?php if (osc_get_preference('about', 'san_auto') !== '0'): ?>
                <div class="footer-menu">
                    <h4><?php _e('About', 'san_auto'); ?></h4>
                    <?php osc_reset_static_pages(); ?>
                    <?php while( osc_has_static_pages() ) { ?>
                        <a href="<?php echo osc_static_page_url(); ?>"><?php echo osc_static_page_title(); ?></a>
                    <?php } ?>
                </div>
            <?php endif; ?>
            <?php if (osc_get_preference('follow', 'san_auto') !== '0'): ?>
            <div class="footer-menu">
                <h4><?php _e('Follow us', 'san_auto'); ?></h4>
                <div class="footer-follow">
            		<?php if (osc_get_preference('fc_text', 'san_auto') <> ""): ?>
                        <a href="<?= osc_get_preference('fc_text', 'san_auto');?>"><i class="fab fa-facebook-f"></i></a>
                    <?php endif; ?>
                    <?php if (osc_get_preference('tw_text', 'san_auto') <> ""): ?>
                        <a href="<?= osc_get_preference('tw_text', 'san_auto');?>"><i class="fab fa-twitter"></i></a>
                    <?php endif; ?>
                    <?php if (osc_get_preference('tg_text', 'san_auto') <> ""): ?>
                        <a href="<?= osc_get_preference('tg_text', 'san_auto');?>"><i class="fab fa-telegram-plane"></i></a>
                    <?php endif; ?>
                    <?php if (osc_get_preference('vk_text', 'san_auto') <> ""): ?>
                        <a href="<?= osc_get_preference('vk_text', 'san_auto');?>"><i class="fab fa-vk"></i></a>
                    <?php endif; ?>
                </div>
            </div>
            <?php endif; ?>
            <?php if(class_exists('ModelGdpr')): ?>
                <div class="footer-gdpr">
                    <div class="gdpr-img">
                        <img src="<?= osc_current_web_theme_url('images/gdpr.png'); ?>" height="60" width="60" alt="<?php _e('GDPR', 'san_auto'); ?>" />
                    </div>
                    <div class="gdpr-text">
                        <div class="gdpr-title"><?php _e('GDPR', 'san_auto'); ?></div>
                        <div class="gdpr-about"><?php _e('Compliant', 'san_auto'); ?></div>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>
    <a href="#" class="back-to-top"><i class="ion ion-ios-arrow-round-up"></i></a>
</footer>

<div id="mobile-left" class="only-mobile">
    <i class="ion ion-md-close"></i>
    <div class="mobile__user">
        <?php if (osc_users_enabled()): ?>
            <div class="search-name">
                <h2><?php _e('Menu', 'san_auto'); ?></h2>
            </div>
            <?php if (osc_is_web_user_logged_in()): ?>
                <div class="mobile__user-menu">
                    <a href="<?php echo osc_user_dashboard_url(); ?>" class="header-user">
                        <div class="mobile__user-avatar">
                            <?php user_avatar_show(osc_logged_user_id()); ?>
                        </div>
                        <div class="mobile__user-name"><?= osc_logged_user_name(); ?></div>
                    </a>

                    <div class="mobile__user-list">
                        <div class="mobile__user-nav">
                          <a class="mobile__user-btns" href="<?php echo osc_user_list_items_url(); ?>"><i class="ion ion-ios-list"></i> <?php _e('My listings', 'san_auto'); ?></a>
                          <a class="mobile__user-btns" href="<?php echo osc_user_alerts_url(); ?>"><i class="ion ion-ios-notifications-outline"></i> <?php _e('My alerts', 'san_auto'); ?></a>
                          <?php if (function_exists('watchlist')): ?>
                              <a class="mobile__user-btns" href="<?= osc_route_url('watchlist-user', array('iPage' => null));?>"><i class="ion ion-ios-heart"></i> <?php _e('Favorite', 'san_auto'); ?></a>
                          <?php endif; ?>
                          <a class="mobile__user-btns" href="<?php echo osc_user_profile_url(); ?>"><i class="ion ion-ios-settings"></i> <?php _e('Setting', 'san_auto'); ?></a>
                          <a class="mobile__user-btns" href="<?php echo osc_change_user_password_url(); ?>"><i class="ion ion-ios-key"></i><?php _e('Change password', 'san_auto'); ?></a>
                          <a class="mobile__user-btns" href="<?php echo osc_change_user_email_url(); ?>"><i class="ion ion-ios-at"></i> <?php _e('Change email', 'san_auto'); ?></a>
                          <a class="mobile__user-btns logout" href="<?php echo osc_user_logout_url(); ?>"><i class="ion ion-md-power"></i> <?php _e('Logout', 'san_auto'); ?></a>
                        </div>
                    </div>
                </div>
            <?php else: ?>
                <div class="header-menu">
                    <a class="header-link" href="<?php echo osc_user_login_url(); ?>"><i class="flaticon-login"></i> <?php _e('Log In', 'san_auto'); ?> </a>
                </div>
            <?php endif; ?>
        <?php endif; ?>
    </div>
</div>



<div id="mobile-right" class="only-mobile">
    <i class="ion ion-md-close"></i>
    <div class="search-sidebar only-mobile">
        <div class="search-box">
            <div class="search-name">
                <h2><?php _e('Search', 'san_auto'); ?></h2>
            </div>
            <?php if (osc_is_search_page()): ?>
            <div class="search_barright">
                <div class="search-grid">
                    <?php
                        $def_view = osc_get_preference('def_view', 'san_auto') == 0 ? 'gallery' : 'list';
                        $old_show = Params::getParam('sShowAs') == '' ? $def_view : Params::getParam('sShowAs');
                    ?>
                    <?php $params['sShowAs'] = 'list'; ?>
                    <a href="<?php echo osc_update_search_url($params); ?>" title="<?php echo osc_esc_html(__('Switch to list view', 'san_auto')); ?>" <?php echo ($old_show == $params['sShowAs'] ? 'class="active"' : ''); ?>><i class="flaticon-list-with-dots"></i></a>
                    <?php $params['sShowAs'] = 'gallery'; ?>
                    <a href="<?php echo osc_update_search_url($params); ?>" title="<?php echo osc_esc_html(__('Switch to grid view', 'san_auto')); ?>" <?php echo ($old_show == $params['sShowAs'] ? 'class="active"' : ''); ?>><i class="flaticon-menu-2"></i></a>
                </div>
                <div class="search-pagesize">
                    <div class="search-sort">
                        <div class="search-sort-label">
                            <span class="search-sort-title"><?= title_type_user(); ?>
                        </div>
                        <div class="search-sort-box">
                            <div class="search-all"><span><?php _e('All vehicles', 'san_auto'); ?></span></div>
                            <div class="search-private"><span><?php _e('Private Sellers', 'san_auto'); ?></span></div>
                            <div class="search-companyes"><span><?php _e('Auto Dealers', 'san_auto'); ?></span></div>
                        </div>
                    </div>
                </div>
                <div class="search-company">
                    <div class="search-sort">
                        <div class="search-sort-label">
                            <span class="search-sort-title"><?= osc_default_results_per_page_at_search()?> <?php _e('Per Page', 'san_auto'); ?>
                        </div>
                        <?php
                            $itemCount = osc_default_results_per_page_at_search() * 2;
                            $itemCountTree = osc_default_results_per_page_at_search() * 3;
                         ?>
                        <div class="search-sort-box">
                            <div data-val="" class="pagesize"><span><?= osc_default_results_per_page_at_search(); ?> <?php _e('Per Page', 'san_auto'); ?></span></div>
                            <div data-val="<?= osc_esc_html($itemCount) ;?>"  class="pagesize"><span><?= $itemCount ;?> <?php _e('Per Page', 'san_auto'); ?></span></div>
                            <div data-val="<?= osc_esc_html($itemCountTree); ?>" class="pagesize"><span><?= $itemCountTree; ?> <?php _e('Per Page', 'san_auto'); ?></span></div>
                        </div>
                    </div>
                </div>
                <div class="search-order">
                    <div class="search-sort">
                        <div class="search-sort-label">
                          <?php $orders = osc_list_orders();?>
                          <?php $current_order = osc_search_order(); ?>
                          <?php foreach($orders as $label => $params) { ?>
                            <?php $orderType = ($params['iOrderType'] == 'asc') ? '0' : '1';
                             ?>
                            <?php if(osc_search_order() == $params['sOrder'] && osc_search_order_type() == $orderType) { ?>
                                <span class="search-sort-title"><?php echo $label; ?></span>
                            <?php } ?>
                          <?php } ?>
                        </div>
                        <div class="search-sort-box">
                            <?php $i = 0;
                            foreach($orders as $label => $params) {
                                $orderType = ($params['iOrderType'] == 'asc') ? '0' : '1'; ?>
                                <?php if(osc_search_order() == $params['sOrder'] && osc_search_order_type() == $orderType) { ?>
                                    <a class="current" href="<?php echo osc_esc_html(osc_update_search_url($params)); ?>"><?php echo $label; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo osc_esc_html(osc_update_search_url($params)); ?>"><?php echo $label; ?></a>
                                <?php }
                                    $i++;
                                } ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="search-page-form">
                <form action="<?php echo osc_base_url(true); ?>" method="get" class="nocsrf" id="search_form">
                    <input type="hidden" name="page" value="search" />
                    <input type="hidden" name="sOrder" value="<?php echo osc_esc_html(osc_search_order()); ?>" />
                    <input type="hidden" name="iPagesize" value="<?php echo osc_esc_html($countPageSize); ?>" />
                    <input type="hidden" name="bPremium" value="<?php echo osc_esc_html(Params::getParam('bPremium')); ?>" />


                    <input type="hidden" name="iOrderType" value="<?php $allowedTypesForSorting = Search::getAllowedTypesForSorting() ; echo isset($allowedTypesForSorting[osc_search_order_type()]) ? $allowedTypesForSorting[osc_search_order_type()] : ''; ?>" />
                    <?php foreach(osc_search_user() as $userId) { ?>
                        <input type="hidden" name="sUser[]" value="<?php echo osc_esc_html($userId); ?>" />
                    <?php } ?>
                    <input type="hidden" name="sCompany" class="sCompany" id="sCompany" value="<?php echo osc_esc_html(Params::getParam('sCompany')); ?>" />

                        <div class="search-rowing">
                            <div class="search-on">
                                <h3><?php _e('Your search', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-input">
                                <input type="text" name="sPattern" id="query" value="<?php echo osc_esc_html( osc_search_pattern() ); ?>" placeholder="<?php echo osc_esc_html(__(osc_get_preference('keyword_placeholder', 'san_auto'), 'san_auto')); ?>"/>
                            </div>
                        </div>

                        <div class="search-rowing">
                            <div class="search-on">
                                <h3><?php _e('Category', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-select">
                                <?php
                                $sCategoryArray = osc_search_category_id();
                                $sCategory=false;
                                if($sCategoryArray){
                                $sCategory = $sCategoryArray['0'];
                                }

                                    if(isset($sCategory)) {
                                      $category = array("pk_i_id" => $sCategory);
                                    } else {
                                        if(osc_is_home_page() && osc_is_search_page()){
                                             $category = 'null';
                                        } else {$category = array("pk_i_id" => '0');}
                                    }
                                    osc_categories_select('sCategory', $category , __('All category', 'san_auto')) ; ?>
                            </div>
                        </div>


                        <div class="search-rowing">
                            <div class="search-on">
                                <h3><?php _e('City', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-input">
                                <input type="text" id="sCity" name="sCity" value="<?php echo osc_esc_html( osc_search_city() ); ?>" placeholder="<?php echo osc_esc_html(_e('Start typing city name...', 'san_auto')); ?>"/>
                                <input type="hidden" id="sRegion" name="sRegion" value="" />
                            </div>
                        </div>

                        <div class="search-rowing">
                            <div class="search-on">
                                <h3><?php _e('Car type', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-radio">
                                <?php foreach($types_global as $p) { ?>
                                    <div class="atributes-type <?php if($type_global == $p['pk_i_id']) { echo 'checked'; } ?>">
                                        <input id="type<?= $p['pk_i_id']; ?>"type="radio" name="type" value="<?= osc_esc_html($p['pk_i_id']); ?>"  <?php if($type_global == $p['pk_i_id']) { echo 'checked'; } ?>/>
                                        <label for="type<?= $p['pk_i_id']; ?>">
                                            <?= type_auto($p['pk_i_id']);?>
                                            <span class="atributes-title"><?= osc_esc_html($p['s_name']); ?></span>
                                        </label>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="search-rowing">
                            <div class="search-on">
                                <h3><?php _e('Make', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-select">
                                <select name="make" id="make" >
                                    <option value=""><?php  _e('Select a make', 'san_auto'); ?></option>
                                    <?php foreach($makes_global as $m) { ?>
                                        <option value="<?php echo osc_esc_html($m['pk_i_id']); ?>" <?php if($make_global == $m['pk_i_id']) { echo 'selected'; } ?>><?php echo $m['s_name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div class="search-rowing">
                            <div class="search-on">
                                <h3><?php _e('Model', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-select">
                                <select name="model" id="model">
                                    <option value=""><?php _e('Select a model', 'san_auto'); ?></option>
                                    <?php foreach($models_global as $m) { ?>
                                        <option value="<?php echo osc_esc_html($m['pk_i_id']); ?>" <?php if($model_global  == $m['pk_i_id']) { echo 'selected';} ?>><?php echo $m['s_name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div class="search-rowing">
                            <div class="search-on">
                                <h3><?php _e('Year', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-input select-year range">
                                    <div class="input-range">
                                        <input type="text" id="min_year2" class="mob-slider" name="min_year" value="" size="4" maxlength="4" />
                                    </div>
                                    <div class="input-range">
                                        <input type="text" id="max_year2" class="mob-slider" name="max_year" value="" size="4" maxlength="4" />
                                    </div>
                            </div>
                            <div id="slide-year" class="mob-slider"></div>
                            <script>
                                $("#slide-year.mob-slider").slider({
                                    animate: "slow",
                                    range: true,
                                    values: [<?= yearhMin();?>, <?= yearhMax();?>],
                                    min: parseInt(minYear),
                                    max: parseInt(maxYear),
                                    step: 1,
                                    slide : function(event, ui) {
                                        $('#min_year2.mob-slider').val(ui.values[ 0 ]);
                                        $("#max_year2.mob-slider").val(ui.values[ 1 ]);
                                    }
                                });
                                $('.input-range input').on('change', function() {
                                    var setIndex = (this.id == "max_year") ? 1 : 0;
                                    $('#slide-year.mob-slider').slider("values", setIndex, $(this).val())
                                });

                                $('#min_year2.mob-slider').val($('#slide-year.mob-slider').slider("values", 0));
                                $("#max_year2.mob-slider").val($('#slide-year.mob-slider').slider("values", 1));

                            </script>
                        </div>
                        <div class="search-rowing">
                            <div class="search-on">
                                <h3 for="transmission"><?php _e('Transmission', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-radio select-trans">
                                <div class="input-radio">
                                    <input type="radio" name="transmission" value="MANUAL" id="manual" <?php if($transmission_global  == 'MANUAL') { echo 'checked="yes"'; } ?>/> <label for="manual"><?php _e('Manual', 'san_auto'); ?></label>
                                </div>
                                <div class="input-radio">
                                    <input type="radio" name="transmission" value="AUTO" id="auto" <?php if($transmission_global  == 'AUTO') { echo 'checked="yes"'; } ?>/> <label for="auto"><?php _e('Automatic', 'san_auto'); ?></label>
                                </div>
                            </div>
                        </div>
                        <?php if( osc_price_enabled_at_items() ) { ?>
                        <div class="search-rowing">
                            <div class="search-on">
                                <h3><?php _e('Price Range', 'san_auto'); ?></h3>
                                <div class="search-line"></div>
                            </div>
                            <div class="search-input select-price range">
                                <div class="input-range">
                                    <i class="ion ion-ios-pricetags"></i>
                                    <input type="text" id="priceMin2" class="mob-slider"  name="sPriceMin" value="<?php echo osc_esc_html(Params::getParam('sPriceMin')); ?>" placeholder="<?php echo osc_esc_html(_e('Min.', 'san_auto')); ?>" size="9" maxlength="9" />
                                </div>
                                <div class="input-range">
                                    <i class="ion ion-ios-pricetags"></i>
                                    <input type="text" id="priceMax2" class="mob-slider" name="sPriceMax" value="<?php echo osc_esc_html(Params::getParam('sPriceMax')); ?>" placeholder="<?php echo osc_esc_html(_e('Max.', 'san_auto')); ?>" size="9" maxlength="9" />
                                </div>
                            </div>
                            <div id="slide-price" class="mob-slider"></div>
                            <?php
                                $currency = osc_get_currencies();

                                $separatop = osc_locale_dec_point();
                                $thousands_sep = osc_locale_thousands_sep();
                                $pref= "";
                                foreach ($currency as $key):
                                    if (osc_currency() == $key['pk_c_code']):
                                         $pref = $key['s_description'];
                                    endif;
                                endforeach;
                           ?>

                            <script>
                                $("#slide-price.mob-slider").slider({
                                    animate: "slow",
                                    range: true,
                                    values: [<?= searchMin(); ?>, <?= searchMax(); ?>],
                                    min: parseInt(0),
                                    max: parseInt(<?= maxPricesql(); ?>),
                                    create: attachSlider,
                                    slide: attachSlider,
                                    stop: attachSlider,
                                    step: 1000

                                });
                                function attachSlider() {
                                    $('#priceMin2.mob-slider').val($('#slide-price.mob-slider').slider("values", 0));
                                    $("#priceMax2.mob-slider").val($('#slide-price.mob-slider').slider("values", 1));
                                }

                                $('.input-range input').on('change', function() {
                                    var setIndex = (this.id == "priceMax") ? 1 : 0;
                                    $('#slide-price.mob-slider').slider("values", setIndex, $(this).val())
                                });

                                $('#priceMin2.mob-slider').val($('#slide-price.mob-slider').slider("values", 0));
                                $("#priceMax2.mob-slider").val($('#slide-price.mob-slider').slider("values", 1));

                            </script>
                        </div>
                        <?php } ?>


                        <div class="search-rowing withCheckbox">
                            <input type="checkbox" name="bPic" id="withPicture" value="1" <?php echo (osc_search_has_pic() ? 'checked="checked"' : ''); ?> />
                            <label for="withPicture"><?php _e('Only with photos', 'san_auto'); ?></label>
                        </div>

                        <div class="search-rowing withCheckbox">
                            <input type="checkbox" name="bPremium" id="withPremium" value="1" <?php echo (osc_search_only_premium() ? 'checked="checked"' : ''); ?> />
                            <label for="withPremium"><?php _e('Only premium items', 'san_auto'); ?></label>
                        </div>

                        <div class="search-rowing">
                            <?php
                                if(osc_search_category_id()) {
                                    osc_run_hook('search_form', osc_search_category_id());
                                } else {
                                    osc_run_hook('search_form');
                                }
                            ?>
                        </div>
                    <button type="submit" class="btn reserve"><?php _e('Apply filters', 'san_auto'); ?></button>
                </form>
            </div>
        </div>
    </div>
</div>
<?php osc_run_hook('footer'); ?>
