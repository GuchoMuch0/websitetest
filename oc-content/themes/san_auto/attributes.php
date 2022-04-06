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

        $attr  = ModelCars::newInstance()->getCarAttr(osc_item_id());
        if( !empty($attr) && array_key_exists('fk_vehicle_type_id', $attr) ) {
            $car_type = ModelCars::newInstance()->getVehicleTypeById($attr['fk_vehicle_type_id']);
        }
        if( !empty($attr) && array_key_exists('fk_i_make_id', $attr) ) {
            $make     = ModelCars::newInstance()->getCarMakeById( $attr['fk_i_make_id'] );
        }
        if( !empty($attr) && array_key_exists('fk_i_model_id', $attr) ) {
            $model    = ModelCars::newInstance()->getCarModelById( $attr['fk_i_model_id'] );
        }

        $attr['s_make'] = '' ;
        if(!empty($make) && array_key_exists('s_name', $make) ) {
            $attr['s_make']  = $make['s_name'];
        }
        $attr['s_model'] = '' ;
        if( !empty($model) && array_key_exists('s_name', $model) ) {
            $attr['s_model']  = $model['s_name'];
        }
        $attr['locale']  = array() ;
        if (isset($car_type)) {
            foreach($car_type as $c) {
                $attr['locale'][$c['fk_c_locale_code']]['s_car_type'] = $c['s_name'] ;
            }
        }
 ?>
<table>
    <?php $locale = osc_current_user_locale(); ?>
    <?php if( !empty($attr['locale'][$locale]['s_car_type']) ) { ?>
    <tr class="tr">
        <td width="150px"><label><?php _e('Car type', 'san_auto'); ?></label></td>
        <td width="150px"><?php echo @$attr['locale'][$locale]['s_car_type']; ?></td>
    </tr>
    <?php } ?>
    <?php if( !empty($attr['i_doors']) ) { ?>
    <tr class="tr">
        <td width="150px"><label><?php _e('Doors', 'san_auto'); ?></label></td>
        <td width="150px"><?php echo @$attr['i_doors']; ?></td>
    </tr>
    <?php } ?>
    <?php if( !empty($attr['i_seats']) ) { ?>
    <tr class="tr">
        <td width="150px"><label><?php _e('Seats', 'san_auto'); ?></label></td>
        <td width="150px"><?php echo @$attr['i_seats']; ?></td>
    </tr>
    <?php } ?>
    <?php if( !empty($attr['i_engine_size']) ) { ?>
    <tr class="tr">
        <td width="150px"><label><?php _e('Engine size (cc)', 'san_auto'); ?></label></td>
        <td width="150px"><?php echo @$attr['i_engine_size']; ?></td>
    </tr>
    <?php } ?>
    <?php if( !empty($attr['i_num_airbags']) ) { ?>
    <tr class="tr">
        <td width="150px"><label><?php _e('Num. Airbags', 'san_auto'); ?></label></td>
        <td width="150px"><label><?php echo @$attr['i_num_airbags']; ?></td>
    </tr>
    <?php } ?>
    <?php if( !empty($attr['e_transmission']) ) { ?>
    <tr class="tr">
        <?php $transmission = array('MANUAL' => __('Manual', 'san_auto'), 'AUTO' => __('Auto', 'san_auto')); ?>
        <td width="150px"><label><?php _e('Transmission', 'san_auto'); ?></label></td>
        <td width="150px"><label><?php echo $transmission[$attr['e_transmission']]; ?></td>
    </tr>
    <?php } ?>
    <?php if( !empty($attr['e_seller']) ) { ?>
    <tr class="tr">
        <?php $seller = array('DEALER' => __('Dealer', 'san_auto'), 'OWNER' => __('Owner', 'san_auto')); ?>
        <td width="150px"><label><?php _e('Seller', 'san_auto'); ?></label></td>
        <td width="150px"><label><?php echo $seller[$attr['e_seller']]; ?></td>
    </tr>
    <?php } ?>
    <tr class="tr">
        <td width="150px"><label><?php _e('Warranty', 'san_auto'); ?>: </label></td>
        <td width="150px"><?php echo @$attr['b_warranty'] ? '<strong>' . __('Yes', 'san_auto') . '</strong>' : __('No', 'san_auto'); ?></td>
    </tr>
    <tr class="tr">
        <td><label><?php _e('New', 'san_auto'); ?>: </label></td>
        <td width="150px"><?php echo @$attr['b_new'] ? '<strong>' . __('Yes', 'san_auto') . '</strong>' : __('No', 'san_auto'); ?></td>
    </tr>
    <?php if( !empty($attr['i_power']) ) { ?>
    <tr class="tr">
        <td width="150px"><label><?php _e('Power', 'san_auto'); ?></label></td>
        <td width="150px"><?php echo @$attr['i_power']; ?> <?php echo @$attr['e_power_unit']; ?></td>
    </tr>
    <?php } ?>
    <?php if( !empty($attr['i_gears']) ) { ?>
    <tr class="tr">
        <td width="150px"><label><?php _e('Gears', 'san_auto'); ?></label></td>
        <td width="150px"><?php echo @$attr['i_gears']; ?></td>
    </tr>
    <?php } ?>
</table>
