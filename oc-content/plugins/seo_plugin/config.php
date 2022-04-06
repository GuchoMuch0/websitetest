<?php
/* ------------------ Parameter setting ----------------------- */

$pluginInfo = osc_plugin_get_info('seo_plugin/index.php');


$allow_custom_meta           = '';
$dao_preference = new Preference();
if(Params::getParam('allow_custom_meta') != '') {
  $allow_custom_meta = Params::getParam('allow_custom_meta');
} else {
  $allow_custom_meta = (osc_get_preference('seoplugin_allow_custom_meta', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_allow_custom_meta', 'plugin-seo_plugin') : '' ;
}


$showCity            = '';
$dao_preference = new Preference();
if(Params::getParam('showCity') != '') {
  $showCity = Params::getParam('showCity');
} else {
  $showCity = (osc_get_preference('seoplugin_city_show', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_city_show', 'plugin-seo_plugin') : '' ;
}

$showRegion            = '';
$dao_preference = new Preference();
if(Params::getParam('showRegion') != '') {
  $showRegion = Params::getParam('showRegion');
} else {
  $showRegion = (osc_get_preference('seoplugin_region_show', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_region_show', 'plugin-seo_plugin') : '' ;
}

$showCountry            = '';
$dao_preference = new Preference();
if(Params::getParam('showCountry') != '') {
  $showCountry = Params::getParam('showCountry');
} else {
  $showCountry = (osc_get_preference('seoplugin_country_show', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_country_show', 'plugin-seo_plugin') : '' ;
}

$showCategory            = '';
$dao_preference = new Preference();
if(Params::getParam('showCategory') != '') {
  $showCategory = Params::getParam('showCategory');
} else {
  $showCategory = (osc_get_preference('seoplugin_category_show', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_category_show', 'plugin-seo_plugin') : '' ;
}

$showTitle            = '';
$dao_preference = new Preference();
if(Params::getParam('showTitle') != '') {
  $showTitle = Params::getParam('showTitle');
} else {
  $showTitle = (osc_get_preference('seoplugin_title_show', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_title_show', 'plugin-seo_plugin') : '' ;
}

$orderCity            = '';
$dao_preference = new Preference();
if(Params::getParam('orderCity') != '') {
  $orderCity = Params::getParam('orderCity');
} else {
  $orderCity = (osc_get_preference('seoplugin_city_order', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_city_order', 'plugin-seo_plugin') : '' ;
}

$orderRegion            = '';
$dao_preference = new Preference();
if(Params::getParam('orderRegion') != '') {
  $orderRegion = Params::getParam('orderRegion');
} else {
  $orderRegion = (osc_get_preference('seoplugin_region_order', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_region_order', 'plugin-seo_plugin') : '' ;
}

$orderCountry            = '';
$dao_preference = new Preference();
if(Params::getParam('orderCountry') != '') {
  $orderCountry = Params::getParam('orderCountry');
} else {
  $orderCountry = (osc_get_preference('seoplugin_country_order', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_country_order', 'plugin-seo_plugin') : '' ;
}

$orderCategory            = '';
$dao_preference = new Preference();
if(Params::getParam('orderCategory') != '') {
  $orderCategory = Params::getParam('orderCategory');
} else {
  $orderCategory = (osc_get_preference('seoplugin_category_order', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_category_order', 'plugin-seo_plugin') : '' ;
}

$orderTitle            = '';
$dao_preference = new Preference();
if(Params::getParam('orderTitle') != '') {
  $orderTitle = Params::getParam('orderTitle');
} else {
  $orderTitle = (osc_get_preference('seoplugin_title_order', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_title_order', 'plugin-seo_plugin') : '' ;
}

$orderBody            = '';
$dao_preference = new Preference();
if(Params::getParam('orderBody') != '') {
  $orderBody = Params::getParam('orderBody');
} else {
  $orderBody = (osc_get_preference('seoplugin_body_order', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_body_order', 'plugin-seo_plugin') : '' ;
}

$showTitleF            = '';
$dao_preference = new Preference();
if(Params::getParam('showTitleF') != '') {
  $showTitleF = Params::getParam('showTitleF');
} else {
  $showTitleF = (osc_get_preference('seoplugin_title_first', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_title_first', 'plugin-seo_plugin') : '' ;
}
	
if(Params::getParam('plugin_action')=='done') {     
  $dao_preference->update(array("s_value" => $showCity), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_city_show")) ;         
  $dao_preference->update(array("s_value" => $showRegion), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_region_show")) ;         
  $dao_preference->update(array("s_value" => $showCountry), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_country_show")) ;  
  $dao_preference->update(array("s_value" => $showCategory), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_category_show")) ;  
  $dao_preference->update(array("s_value" => $showTitle), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_title_show")) ;  
  $dao_preference->update(array("s_value" => $orderCity), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_city_order")) ;         
  $dao_preference->update(array("s_value" => $orderRegion), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_region_order")) ;         
  $dao_preference->update(array("s_value" => $orderCountry), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_country_order")) ;  		
  $dao_preference->update(array("s_value" => $orderCategory), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_category_order")) ;  		
  $dao_preference->update(array("s_value" => $orderTitle), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_title_order")) ;  		
  $dao_preference->update(array("s_value" => $orderBody), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_body_order")) ;  		
  $dao_preference->update(array("s_value" => $showTitleF), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_title_first")) ;         
  $dao_preference->update(array("s_value" => $allow_custom_meta), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_allow_custom_meta")) ;         
  osc_reset_preferences();    
  message_ok(__('Settings saved','seo_plugin'));
}

unset($dao_preference) ;

/* ------------------- HTML section --------------------- */
?>

<div id="settings_form">
  <?php echo config_menu(); ?>

      <form name="promo_form" id="promo_form" action="<?php echo osc_admin_base_url(true); ?>" method="POST" enctype="multipart/form-data" >
      <input type="hidden" name="page" value="plugins" />
      <input type="hidden" name="action" value="renderplugin" />
      <input type="hidden" name="file" value="<?php echo osc_plugin_folder(__FILE__); ?>config.php" />
      <input type="hidden" name="plugin_action" value="done" />
      <br />

 
      <fieldset>
        <legend><i class="fa fa-cog"></i>&nbsp;<?php _e('Settings for Listings page','seo_plugin'); ?></legend>

        <table>
          <tr>
            <td style="width:320px">
              <label for="showCity" style="font-weight: bold;"><?php _e("Show the city in the title of items?", 'seo_plugin'); ?></label>:<br />
              <select name="showCity" id="showCity"> 
                <option <?php if($showCity == 1){echo 'selected="selected"';}?>value='1'><?php _e('Yes','seo_plugin'); ?></option>
                <option <?php if($showCity == 0){echo 'selected="selected"';}?>value='0'><?php _e('No','seo_plugin'); ?></option>
              </select>
            </td>

            <td style="width:320px">
              <label for="orderCity" style="font-weight: bold;"><?php _e("Order of city in title?", 'seo_plugin'); ?></label>:<br />
              <select name="orderCity" id="orderCity"> 
                <option <?php if($orderCity == 1){echo 'selected="selected"';}?>value='1'><?php _e('First','seo_plugin'); ?></option>
                <option <?php if($orderCity == 2){echo 'selected="selected"';}?>value='2'><?php _e('Second','seo_plugin'); ?></option>
                <option <?php if($orderCity == 3){echo 'selected="selected"';}?>value='3'><?php _e('Third','seo_plugin'); ?></option>
                <option <?php if($orderCity == 4){echo 'selected="selected"';}?>value='4'><?php _e('Fourth','seo_plugin'); ?></option>
                <option <?php if($orderCity == 5){echo 'selected="selected"';}?>value='5'><?php _e('Fifth','seo_plugin'); ?></option>
                <option <?php if($orderCity == 6){echo 'selected="selected"';}?>value='6'><?php _e('Sixth','seo_plugin'); ?></option>
              </select>					
            </td>
          </tr>
        </table>

        <br /><br />   
					  
        <table>
          <tr>
            <td style="width:320px">
              <label for="showRegion" style="font-weight: bold;"><?php _e("Show the region in the title of items?", 'seo_plugin'); ?></label>:<br />
              <select name="showRegion" id="showRegion"> 
                <option <?php if($showRegion == 1){echo 'selected="selected"';}?>value='1'><?php _e('Yes','seo_plugin'); ?></option>
                <option <?php if($showRegion == 0){echo 'selected="selected"';}?>value='0'><?php _e('No','seo_plugin'); ?></option>
              </select>
            </td>

            <td style="width:320px">
              <label for="orderRegion" style="font-weight: bold;"><?php _e("Order of region in title?", 'seo_plugin'); ?></label>:<br />
              <select name="orderRegion" id="orderRegion"> 
                <option <?php if($orderRegion == 1){echo 'selected="selected"';}?>value='1'><?php _e('First','seo_plugin'); ?></option>
                <option <?php if($orderRegion == 2){echo 'selected="selected"';}?>value='2'><?php _e('Second','seo_plugin'); ?></option>
                <option <?php if($orderRegion == 3){echo 'selected="selected"';}?>value='3'><?php _e('Third','seo_plugin'); ?></option>
                <option <?php if($orderRegion == 4){echo 'selected="selected"';}?>value='4'><?php _e('Fourth','seo_plugin'); ?></option>
                <option <?php if($orderRegion == 5){echo 'selected="selected"';}?>value='5'><?php _e('Fifth','seo_plugin'); ?></option>
                <option <?php if($orderRegion == 6){echo 'selected="selected"';}?>value='6'><?php _e('Sixth','seo_plugin'); ?></option>
              </select>					
            </td>
          </tr>
        </table>

        <br /><br />   

        <table>
          <tr>
            <td style="width:320px">
              <label for="showCountry" style="font-weight: bold;"><?php _e("Show the country in the title of items?", 'seo_plugin'); ?></label>:<br />
              <select name="showCountry" id="showCountry"> 
                <option <?php if($showCountry == 1){echo 'selected="selected"';}?>value='1'><?php _e('Yes','seo_plugin'); ?></option>
                <option <?php if($showCountry == 0){echo 'selected="selected"';}?>value='0'><?php _e('No','seo_plugin'); ?></option>
              </select>
            </td>

            <td style="width:320px">
              <label for="orderCountry" style="font-weight: bold;"><?php _e("Order of country in title?", 'seo_plugin'); ?></label>:<br />
              <select name="orderCountry" id="orderCountry"> 
                <option <?php if($orderCountry == 1){echo 'selected="selected"';}?>value='1'><?php _e('First','seo_plugin'); ?></option>
                <option <?php if($orderCountry == 2){echo 'selected="selected"';}?>value='2'><?php _e('Second','seo_plugin'); ?></option>
                <option <?php if($orderCountry == 3){echo 'selected="selected"';}?>value='3'><?php _e('Third','seo_plugin'); ?></option>
                <option <?php if($orderCountry == 4){echo 'selected="selected"';}?>value='4'><?php _e('Fourth','seo_plugin'); ?></option>
                <option <?php if($orderCountry == 5){echo 'selected="selected"';}?>value='5'><?php _e('Fifth','seo_plugin'); ?></option>
                <option <?php if($orderCountry == 6){echo 'selected="selected"';}?>value='6'><?php _e('Sixth','seo_plugin'); ?></option>
              </select>						
            </td>
          </tr>
        </table>

        <br /><br />  

        <table>
          <tr>
            <td style="width:320px">
              <label for="showCategory" style="font-weight: bold;"><?php _e("Show the category in the title of items?", 'seo_plugin'); ?></label>:<br />
              <select name="showCategory" id="showCategory"> 
                <option <?php if($showCategory == 1){echo 'selected="selected"';}?>value='1'><?php _e('Yes','seo_plugin'); ?></option>
                <option <?php if($showCategory == 0){echo 'selected="selected"';}?>value='0'><?php _e('No','seo_plugin'); ?></option>
              </select>
            </td>

            <td style="width:320px">
              <label for="orderCategory" style="font-weight: bold;"><?php _e("Order of category in title?", 'seo_plugin'); ?></label>:<br />
              <select name="orderCategory" id="orderCategory"> 
                <option <?php if($orderCategory == 1){echo 'selected="selected"';}?>value='1'><?php _e('First','seo_plugin'); ?></option>
                <option <?php if($orderCategory == 2){echo 'selected="selected"';}?>value='2'><?php _e('Second','seo_plugin'); ?></option>
                <option <?php if($orderCategory == 3){echo 'selected="selected"';}?>value='3'><?php _e('Third','seo_plugin'); ?></option>
                <option <?php if($orderCategory == 4){echo 'selected="selected"';}?>value='4'><?php _e('Fourth','seo_plugin'); ?></option>
                <option <?php if($orderCategory == 5){echo 'selected="selected"';}?>value='5'><?php _e('Fifth','seo_plugin'); ?></option>
                <option <?php if($orderCategory == 6){echo 'selected="selected"';}?>value='6'><?php _e('Sixth','seo_plugin'); ?></option>
              </select>						
            </td>
          </tr>
        </table>

        <br /><br />

        <table>
          <tr>
            <td style="width:320px">
              <label for="showTitle" style="font-weight: bold;"><?php _e("Show the site name in the title of items?", 'seo_plugin'); ?></label>:<br />
              <select name="showTitle" id="showTitle"> 
                <option <?php if($showTitle == 1){echo 'selected="selected"';}?>value='1'><?php _e('Yes','seo_plugin'); ?></option>
                <option <?php if($showTitle == 0){echo 'selected="selected"';}?>value='0'><?php _e('No','seo_plugin'); ?></option>
              </select>
            </td>

            <td style="width:320px">
              <label for="orderTitle" style="font-weight: bold;"><?php _e("Order of site name in title?", 'seo_plugin'); ?></label>:<br />
              <select name="orderTitle" id="orderTitle"> 
                <option <?php if($orderTitle == 1){echo 'selected="selected"';}?>value='1'><?php _e('First','seo_plugin'); ?></option>
                <option <?php if($orderTitle == 2){echo 'selected="selected"';}?>value='2'><?php _e('Second','seo_plugin'); ?></option>
                <option <?php if($orderTitle == 3){echo 'selected="selected"';}?>value='3'><?php _e('Third','seo_plugin'); ?></option>
                <option <?php if($orderTitle == 4){echo 'selected="selected"';}?>value='4'><?php _e('Fourth','seo_plugin'); ?></option>
                <option <?php if($orderTitle == 5){echo 'selected="selected"';}?>value='5'><?php _e('Fifth','seo_plugin'); ?></option>
                <option <?php if($orderTitle == 6){echo 'selected="selected"';}?>value='6'><?php _e('Sixth','seo_plugin'); ?></option>
              </select>						
            </td>
          </tr>
        </table>

        <br /><br />

        <table>
          <tr>
            <td style="width:320px">
            </td>

            <td style="width:320px">
              <label for="orderBody" style="font-weight: bold;"><?php _e("Order of item title in title?", 'seo_plugin'); ?></label>:<br />
              <select name="orderBody" id="orderBody"> 
                <option <?php if($orderBody == 1){echo 'selected="selected"';}?>value='1'><?php _e('First','seo_plugin'); ?></option>
                <option <?php if($orderBody == 2){echo 'selected="selected"';}?>value='2'><?php _e('Second','seo_plugin'); ?></option>
                <option <?php if($orderBody == 3){echo 'selected="selected"';}?>value='3'><?php _e('Third','seo_plugin'); ?></option>
                <option <?php if($orderBody == 4){echo 'selected="selected"';}?>value='4'><?php _e('Fourth','seo_plugin'); ?></option>
                <option <?php if($orderBody == 5){echo 'selected="selected"';}?>value='5'><?php _e('Fifth','seo_plugin'); ?></option>
                <option <?php if($orderBody == 6){echo 'selected="selected"';}?>value='6'><?php _e('Sixth','seo_plugin'); ?></option>
              </select>						
            </td>
          </tr>
        </table>
      </fieldset>

      <!-- Show what we got Now -->
      <br /><br />
      <fieldset>
        <legend><i class="fa fa-cog"></i>&nbsp;<?php _e('Current Order of Item Title','seo_plugin'); ?></legend>
        <div style="padding: 10px 20px;" class="flashmessage flashmessage-info flashmessage-inline"><?php echo CurrentOrder(); ?></div>
      </fieldset>
      <br /><br />
 			
                                   
                     
      <button name="theButton" id="theButton" type="submit" style="float: left;" class="btn btn-submit"><?php _e('Save', 'seo_plugin');?></button>
      </form>

      <div class="clear"></div>
      <br /><br />

      <?php echo $pluginInfo['version'] . '|  &copy; ' . date('Y') . ' <a href="' . $pluginInfo['plugin_uri'] . '" target="_blank">SEO Plugin</a>'; ?>                     
    </div>


<script>
if($('#keywordsEnabled').val() == 0) { $('#keywords').prop('disabled', true); $('#keywords').css('color', '#666'); $('#keywords').css('background-color', '#efefef'); } else { $('#keywords').prop('disabled', false); $('#keywords').css('color', '#000'); $('#keywords').css('background-color', '#fff'); }

$('#keywordsEnabled').click(function(){
  if($('#keywordsEnabled').val() == 0) { $('#keywords').prop('disabled', true); $('#keywords').css('color', '#666'); $('#keywords').css('background-color', '#efefef'); } else { $('#keywords').prop('disabled', false); $('#keywords').css('color', '#000'); $('#keywords').css('background-color', '#fff'); }
});
</script>