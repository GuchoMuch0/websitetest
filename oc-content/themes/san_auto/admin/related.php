<?php if ( (!defined('ABS_PATH')) ) exit('ABS_PATH is not loaded. Direct access is not allowed.');
if ( !OC_ADMIN ) exit('User access is not allowed.');
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
    $ra_numads            = '';
    $dao_preference = new Preference();
    if(Params::getParam('related_num') != '') {
        $ra_numads = Params::getParam('related_num');
    } else {
        $ra_numads = (osc_related_num() != '') ? osc_related_num() : '' ;
    }

    $category            = '';
    $dao_preference = new Preference();
    if(Params::getParam('related_category') != '') {
        $category = Params::getParam('related_category');
    } else {
        $category = (osc_related_category() != '') ? osc_related_category() : '' ;
    }

    $region            = '';
    $dao_preference = new Preference();
    if(Params::getParam('related_region') != '') {
        $region = Params::getParam('related_region');
    } else {
        $region = (osc_related_region() != '') ? osc_related_region() : '' ;
    }

    $country            = '';
    $dao_preference = new Preference();
    if(Params::getParam('related_country') != '') {
        $country = Params::getParam('related_country');
    } else {
        $country = (osc_related_country() != '') ? osc_related_country() : '' ;
    }

    $picOnly            = '';
    $dao_preference = new Preference();
    if(Params::getParam('related_picOnly') != '') {
        $picOnly = Params::getParam('related_picOnly');
    } else {
        $picOnly = (osc_related_picOnly() != '') ? osc_related_picOnly() : '' ;
    }


    $premiumonly            = '';
    $dao_preference = new Preference();
    if(Params::getParam('related_remiumonly') != '') {
        $premiumonly = Params::getParam('related_remiumonly');
    } else {
        $premiumonly = (osc_related_remiumonly() != '') ? osc_related_remiumonly() : '' ;
    }



    if( Params::getParam('option') == 'stepone' ) {

        osc_set_preference('related_num', ($ra_numads), 'san_auto');
        osc_set_preference('related_category', ($category ? '1' : '0'), 'san_auto');
        osc_set_preference('related_country', ($country ? '1' : '0'), 'san_auto');
        osc_set_preference('related_region', ($region ? '1' : '0'), 'san_auto');
        osc_set_preference('related_picOnly', ($picOnly ? '1' : '0'), 'san_auto');
        osc_set_preference('related_remiumonly', ($premiumonly ? '1' : '0'), 'san_auto');


        osc_add_flash_ok_message(__('Setting saved successfully', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#related')); exit;
    }
    unset($dao_preference) ;

?>
<div class="admin-content">
    <h2 class="admin-title "><i class="fa fa-cog"></i>  <?php _e('Related items', 'san_auto'); ?></h2>
    <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post" enctype="multipart/form-data" class="nocsrf">
        <input type="hidden" name="action_specific" value="related" />
        <input type="hidden" name="option" value="stepone" />
        <fieldset>

        <div class="form-horizontal">
            <div class="form-row">
                <div class="form-label wide" >
                    <label for="related_num" ><?php _e('Number of related ads  ', 'san_auto'); ?></label>:
                </div>
                <div class="form-controls">
                    <input type="text" name="related_num" id="related_num" value="<?php echo $ra_numads; ?>" />
                    <div class="help-box"><?php _e('Enter how many ads you want to show on Item Page (Default is 4)', 'san_auto'); ?></div>
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="form-row"><div class="form-label wide" >
                <label for="related_remiumonly" ><?php _e('Show only premium ads', 'san_auto'); ?></label>:
            </div>
            <div class="form-controls">
                <div class="form-label-selection">
                <select name="related_remiumonly" id="related_remiumonly">
        	           <option <?php if($premiumonly ==0){echo 'selected="selected"';}?> value='0'><?php _e('No', 'san_auto'); ?></option>
    	              <option <?php if($premiumonly ==1){echo 'selected="selected"';}?> value='1'><?php _e('Yes', 'san_auto'); ?></option>
               </select>
                <div class="help-box"><?php _e('Select Yes if you want to show premium ads only', 'san_auto'); ?></div>
                </div>
            </div>
            </div>
        </div>
        <div class="form-horizontal">
        <div class="form-row"><div class="form-label wide" >
        <label for="related_picOnly" ><?php _e('Show ads with pictures only', 'san_auto'); ?></label>:
        </div>
        <div class="form-controls"><div class="form-label-selection">
        <select name="related_picOnly" id="related_picOnly">
        	<option <?php if($picOnly ==0){echo 'selected="selected"';}?> value='0'><?php _e('No', 'san_auto'); ?></option>
        	<option <?php if($picOnly ==1){echo 'selected="selected"';}?> value='1'><?php _e('Yes', 'san_auto'); ?></option>
        </select>
        <div class="help-box"><?php _e('Select Yes if you want to show ads with picture only', 'san_auto'); ?></div>
        </div></div>
        </div>

       	<div class="form-row"><div class="form-label wide" >
        <label for="related_category" ><?php _e('Show ads with same category', 'san_auto'); ?></label>:
        </div>
        <div class="form-controls"><div class="form-label-selection">
        <select name="related_category" id="related_category">
        	<option <?php if($category ==0){echo 'selected="selected"';}?> value='0'><?php _e('No', 'san_auto'); ?></option>
        	<option <?php if($category ==1){echo 'selected="selected"';}?> value='1'><?php _e('Yes', 'san_auto'); ?></option>
        </select>
        <div class="help-box"><?php _e('Select Yes to Filter ads by Category', 'san_auto'); ?></div>
        </div></div>
        </div>

       	<div class="form-row"><div class="form-label wide" >
        <label for="related_country" ><?php _e('Show ads with same country', 'san_auto'); ?></label>:
        </div>
        <div class="form-controls"><div class="form-label-selection">
        <select name="related_country" id="related_country">
        	<option <?php if($country ==0){echo 'selected="selected"';}?> value='0'><?php _e('No', 'san_auto'); ?></option>
        	<option <?php if($country ==1){echo 'selected="selected"';}?> value='1'><?php _e('Yes', 'san_auto'); ?></option>
        </select>
        <div class="help-box"><?php _e('Select Yes to Filter ads by Country', 'san_auto'); ?></div>
        </div></div>
        </div>

        <div class="form-row"><div class="form-label wide" >
        <label for="related_region" ><?php _e('Show ads with same region', 'san_auto'); ?></label>:
        </div>
        <div class="form-controls"><div class="form-label-selection">
        <select name="related_region" id="related_region">
        	<option <?php if($region ==0){echo 'selected="selected"';}?> value='0'><?php _e('No', 'san_auto'); ?></option>
        	<option <?php if($region ==1){echo 'selected="selected"';}?> value='1'><?php _e('Yes', 'san_auto'); ?></option>
        </select>
        <div class="help-box"><?php _e('Select Yes to Filter ads by Region', 'san_auto'); ?></div>
        </div></div>
        </div>
        </div>
        </fieldset>
         <div class="admin-actions">
             <button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Save','san_auto')); ?></button>
         </div>
</form>
</div>
