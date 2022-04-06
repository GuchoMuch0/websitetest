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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <?php if( osc_count_items() == 0 || Params::getParam('iPage') > 0 || stripos($_SERVER['REQUEST_URI'], 'search') )  { ?>
            <meta name="robots" content="noindex, nofollow" />
            <meta name="googlebot" content="noindex, nofollow" />
        <?php } else { ?>
            <meta name="robots" content="index, follow" />
            <meta name="googlebot" content="index, follow" />
        <?php } ?>
    </head>
    <body class="search-page">
        <?php osc_current_web_theme_path('header.php'); ?>
        <div class="wrapper">
        <div class="search<?= osc_get_preference('rtl', 'san_auto') == '0' ? " search-reserve" : "" ;?>">
            <div class="search-sidebar only-all">
                <div class="search-box">
                    <div class="search-name">
                        <h2><?php _e('Filters', 'san_auto'); ?></h2>
                    </div>
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
                                            <div class="atributes-type <?php if($types_global == $p['pk_i_id']) { echo 'checked'; } ?>">
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
                                                <input type="text" id="min_year" name="min_year" value="" size="4" maxlength="4" />
                                            </div>
                                            <div class="input-range">
                                                <input type="text" id="max_year" name="max_year" value="" size="4" maxlength="4" />
                                            </div>
                                    </div>
                                    <div id="slide-year"></div>
                                    <script>
                                        $("#slide-year").slider({
                                            animate: "slow",
                                            range: true,
                                            values: [<?= yearhMin();?>, <?= yearhMax();?>],
                                            min: parseInt(minYear),
                                            max: parseInt(maxYear),
                                            step: 1,
                                            slide : function(event, ui) {
                                                $('#min_year').val(ui.values[ 0 ]);
                                                $("#max_year").val(ui.values[ 1 ]);
                                            }
                                        });
                                        $('.input-range input').on('change', function() {
                                            var setIndex = (this.id == "max_year") ? 1 : 0;
                                            $('#slide-year').slider("values", setIndex, $(this).val())
                                        });

                                        $('#min_year').val($('#slide-year').slider("values", 0));
                                        $("#max_year").val($('#slide-year').slider("values", 1));

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
                                            <input type="text" id="priceMin" name="sPriceMin" value="<?php echo osc_esc_html(Params::getParam('sPriceMin')); ?>" placeholder="<?php echo osc_esc_html(_e('Min.', 'san_auto')); ?>" size="9" maxlength="9" />
                                        </div>
                                        <div class="input-range">
                                            <i class="ion ion-ios-pricetags"></i>
                                            <input type="text" id="priceMax" name="sPriceMax" value="<?php echo osc_esc_html(Params::getParam('sPriceMax')); ?>" placeholder="<?php echo osc_esc_html(_e('Max.', 'san_auto')); ?>" size="9" maxlength="9" />
                                        </div>
                                    </div>
                                    <div id="slide-price"></div>
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
                                        $("#slide-price").slider({
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
                                            $('#priceMin').val($('#slide-price').slider("values", 0));
                                            $("#priceMax").val($('#slide-price').slider("values", 1));
                                        }

                                        $('.input-range input').on('change', function() {
                                            var setIndex = (this.id == "priceMax") ? 1 : 0;
                                            $('#slide-price').slider("values", setIndex, $(this).val())
                                        });

                                        $('#priceMin').val($('#slide-price').slider("values", 0));
                                        $("#priceMax").val($('#slide-price').slider("values", 1));

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
                <div class="search-alert">
                    <?php osc_alert_form(); ?>
                </div>
            </div>

            <div class="search-items">
                <div class="search-bar">
                    <div class="search-barleft">
                        <h2><?php _e('Search result', 'san_auto'); ?> <span>(<?= osc_search_total_items(); ?>)</span></h2>
                    </div>
                    <div class="search_barright only-all">
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
                </div>
                <div class="search-listing">
                    <?php if(osc_count_items() == 0) { ?>
                        <p class="item-form-help" ><?php printf(__('There are no results matching "%s"', 'san_auto'), osc_search_pattern()); ?></p>
                    <?php } else { ?>
                        <div class="item-<?= $old_show == 'list' ? "list" : "gallery" ;?>">
                        <?php osc_run_hook('search_ads_listing_top'); ?>
                          <?php while( osc_has_items() ) : ?>
                              <?= $old_show == 'list' ? draw_item_san_auto('list') : draw_item_san_auto('gallery') ; ?>
                          <?php endwhile; ?>
                          <?php osc_run_hook('search_ads_listing_bottom'); ?>
                         </div>
                        <div class="paginate">
                            <?php echo osc_search_pagination(); ?>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>


            <script type="text/javascript">
                $(function() {
                    function log( message ) {
                        $( "<div/>" ).text( message ).prependTo( "#log" );
                        $( "#log" ).attr( "scrollTop", 0 );
                    }

                    $( "#sCity" ).autocomplete({
                        source: "<?php echo osc_base_url(true); ?>?page=ajax&action=location",
                        minLength: 2,
                        select: function( event, ui ) {
                            $("#sRegion").attr("value", ui.item.region);
                            log( ui.item ?
                                "<?php _e('Selected', 'san_auto'); ?>: " + ui.item.value + " aka " + ui.item.id :
                                "<?php _e('Nothing selected, input was', 'san_auto'); ?> " + this.value );
                        }
                    });
                });

            </script>
            <script type="text/javascript">
                $(document).ready(function(){
                    $("#make").on('change', function(){
                        $("#model").attr('disabled',true);
                        var make_id = $(this).val();
                        var url = '<?php echo osc_ajax_plugin_url("cars_attributes/ajax.php") . "&makeId="; ?>' + make_id;
                        var result = '';
                        if(make_id != '') {
                            $("#model").attr('disabled',false);
                            $.ajax({
                                type: "POST",
                                url: url,
                                dataType: 'json',
                                success: function(data){
                                    var length = data.length;
                                    if(length > 0) {
                                        result += '<option value=""><?php _e("Select a model", 'san_auto'); ?></option>';
                                        for(key in data) {
                                            result += '<option value="' + data[key].pk_i_id + '">' + data[key].s_name + '</option>';
                                        }
                                    } else {
                                        result += '<option value=""><?php _e('No results', 'san_auto'); ?></option>';
                                    }
                                    $("#model").html(result);
                                }
                             });
                         } else {
                            $("#model").attr('disabled',true);
                         }
                    });
                });
            </script>
        </div>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
