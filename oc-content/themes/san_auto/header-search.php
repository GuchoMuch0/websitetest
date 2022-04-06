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
    if(class_exists('ModelCars')) { /* check plugin car atributes */
        $make  = Params::getParam('make') ;
        $model = Params::getParam('model') ;
        $type  = Params::getParam('type') ;
        $year  = Params::getParam('year') ;

        $makes  = ModelCars::newInstance()->getCarMakes();
        $models = array();
        if($make != '') {
            $models = ModelCars::newInstance()->getCarModels($make);
        }

        $types = ModelCars::newInstance()->getVehiclesType(osc_current_user_locale());
    }
 ?>
<div class="search-header">
      <div class="search-collum">
                    <div class="search-form">
                        <form action="<?php echo osc_base_url(true); ?>" method="get" class="nocsrf">
                            <input type="hidden" name="page" value="search"/>
                            <div class="search-row">
                                <div class="sort-left">
                                    <div class="search-col<?= san_auto_location_show_as() == 'hide' ? ' not-loc' : '' ;?>">
                                        <input type="text" name="sPattern" autocomplete="off" class="input-text" value="" placeholder="<?php echo osc_esc_html(__(osc_get_preference('keyword_placeholder', 'san_auto'), 'san_auto')); ?>" />
                                    </div>
                                    <?php if (san_auto_location_show_as() !== 'hide'): ?>
                                        <div class="search-col center-col select-col">
                                            <?php if (san_auto_location_show_as() == 'region'): ?>
                                                <?php chosen_region_select(); ?>
                                            <?php elseif(san_auto_location_show_as() == 'city'): ?>
                                                <?php chosen_city_select(); ?>
                                            <?php elseif(san_auto_location_show_as() == 'auto'): ?>
                                                <input class="input-text" type="hidden" id="sRegion" name="sRegion" value="<?php echo osc_esc_html(Params::getParam('sRegion')); ?>" />
                                                <input class="input-text" type="text" id="sCity" name="sCity" value="<?php echo osc_esc_html(osc_search_city()); ?>" placeholder="<?php echo osc_esc_html( __('Enter city', 'san_auto')); ?>"/>
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
                                                                            "<?php echo osc_esc_html( __('Selected', 'san_auto') ); ?>: " + ui.item.value + " aka " + ui.item.id :
                                                                            "<?php echo osc_esc_html( __('Nothing selected, input was', 'san_auto') ); ?> " + this.value );

                                                                    },
                                                                    open: function( event, ui ) {
                                                                        $("#sRegion").closest('.seaach-main-pattern').addClass('focus');
                                                                    },
                                                                     close: function( event, ui ) {
                                                                        $("#sRegion").closest('.seaach-main-pattern').removeClass('focus');
                                                                     }
                                                                })
                                                            });
                                                </script>
                                            <?php endif; ?>
                                        </div>
                                    <?php endif; ?>
                                    <div class="search-col select-col">
                                        <?php osc_categories_select('sCategory', null, null, __('Select a category', 'san_auto')) ; ?>
                                    </div>
                                </div>
                                <div class="search-col sort-right">
                                    <?php if(function_exists('cars_search_conditions')): ?>
                                        <div class="search-sort-main">
                                            <a class="open_sort" href="#">
                                                <span class="line on1"></span>
                                                <span class="line on2"></span>
                                                <span class="line on3"></span>
                                            </a>
                                        </div>
                                    <?php endif; ?>
                                    <div class="search-btn">
                                        <button class="btn btn_red"><i class="ion ion-ios-search"></i></button>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <?php if(function_exists('cars_search_conditions')): ?>
                    <div class="search-atributes">
                        <h2><?php _e('Select venicle type', 'san_auto'); ?> </h2>
                        <div class="atributes-row">
                            <?php foreach($types as $p) { ?>
                                <div class="atributes-type">
                                    <input id="type<?= $p['pk_i_id']; ?>"type="radio" name="type" value="<?= $p['pk_i_id']; ?>"/>
                                    <label for="type<?= $p['pk_i_id']; ?>">
                                        <?= type_auto($p['pk_i_id']);?>
                                    </label>
                                    <span class="atributes-title"><?= osc_esc_html($p['s_name']); ?></span>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="atributes-row atributes-more">
                            <div class="atributes-col atributes-make">
                                <h2><?php _e('Make', 'san_auto'); ?></h2>
                                <select name="make" id="make" class="select-jsf" >
                                    <option value=""><?php  _e('Select a make', 'san_auto'); ?></option>
                                    <?php foreach($makes as $m) { ?>
                                        <option value="<?php echo $m['pk_i_id']; ?>" <?php if($make == $m['pk_i_id']) { echo 'selected'; } ?>><?php echo $m['s_name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="atributes-col atributes-model">
                                <h2><?php _e('Model', 'san_auto'); ?></h2>
                                <select name="model" id="model" class="select-jsf">
                                    <option value=""><?php _e('Select a model', 'san_auto'); ?></option>
                                    <?php foreach($models as $m) { ?>
                                        <option value="<?php echo $m['pk_i_id']; ?>" <?php if($model == $m['pk_i_id']) { echo 'selected';} ?>><?php echo $m['s_name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="atributes-col atributes-range">
                                <h2><?php _e('Year', 'san_auto'); ?></h2>
                                <input type="hidden" id="min_year" name="min_year" value="" size="4" maxlength="4" />
                                <input type="hidden" id="max_year" name="max_year" value="" size="4" maxlength="4" />
                                <div class="atribute-year">
                                    <span id="min_year_count"></span>
                                    <span id="max_year_count"></span>
                                </div>
                                <div id="slide"></div>
                                <script>
                                    $("#slide").slider({
                                        animate: "slow",
                                        range: true,
                                        values: [minYear, maxYear],
                                        min: parseInt(minYear),
                                        max: parseInt(maxYear),
                                        step: 1,
                                        slide : function(event, ui) {
                                            $(this).find('span.min').text(ui.values[0]);
                		            		$(this).find('span.max').text(ui.values[1]);
                                            $('#min_year').val(ui.values[ 0 ]);
                                            $("#max_year").val(ui.values[ 1 ]);
                                        }
                                    });
                                    $('#min_year').val($('#slide').slider("values", 0));
                                    $("#max_year").val($('#slide').slider("values", 1));
                                    $("#slide .ui-slider-handle:first-of-type").append("<span class='min'>" + minYear + "</span>");
                                    $("#slide .ui-slider-handle:last-of-type").append("<span class='max'>" + maxYear + "</span>");

                                </script>
                            </div>

                            <?php if( osc_price_enabled_at_items() ) { ?>
                                <div class="atributes-col atributes-price atributes-range">
                                    <h2><?php _e('Price', 'san_auto'); ?></h2>
                                    <input type="hidden" id="priceMin" name="sPriceMin" value="<?php echo osc_esc_html(osc_search_price_min()); ?>" size="10" maxlength="10" />
                                    <input type="hidden" id="priceMax" name="sPriceMax" value="<?php echo osc_esc_html(osc_search_price_max()); ?>" size="10" maxlength="10" />
                                    <div id="slide-price"></div>
                                    <script>
                                        $("#slide-price").slider({
                                            animate: "slow",
                                            range: true,
                                            values: [0, <?= maxPricesql(); ?>],
                                            min: parseInt(0),
                                            max: parseInt(<?= maxPricesql(); ?>),
                                            step: 1,
                                            slide : function(event, ui) {
                                                $(this).find('span.min').text(ui.values[0]);
                    		            		$(this).find('span.max').text(ui.values[1]);
                                                $('#priceMin').val(ui.values[ 0 ]);
                                                $("#priceMax").val(ui.values[ 1 ]);
                                            }
                                        });
                                        $('#priceMin').val($('#slide-price').slider("values", 0));
                                        $("#priceMax").val($('#slide-price').slider("values", 1));
                                        $("#slide-price .ui-slider-handle:first-of-type").append("<span class='min'>0</span>");
                                        $("#slide-price .ui-slider-handle:last-of-type").append("<span class='max'>" + <?= maxPricesql(); ?> + "</span>");
                                    </script>
                                </div>
                            <?php } ?>

                        </div>
                    </div>
                    <?php endif; ?>
                    </form>
                    </div>
                    <?php
                    /*
                    <div class="help">
                        <div class="help-list">
                            <span>Custom text 1</span>
                            <span>Custom text 1</span>
                            <span>Custom text 1</span>
                            <span>Custom text 1</span>
                        </div>
                    </div>
                    */
                     ?>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#make").change(function(){
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
