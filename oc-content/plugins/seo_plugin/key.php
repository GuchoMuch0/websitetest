<?php
/* ------------------ Parameter setting ----------------------- */

$pluginInfo = osc_plugin_get_info('seo_plugin/index.php');

$keywordsEnabled            = '';
$dao_preference = new Preference();
if(Params::getParam('keywordsEnabled') != '') {
  $keywordsEnabled = Params::getParam('keywordsEnabled');
} else {
  $keywordsEnabled = (osc_get_preference('seoplugin_keywords_enabled', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_keywords_enabled', 'plugin-seo_plugin') : '' ;
}

$keywords            = '';
$dao_preference = new Preference();
if(Params::getParam('keywords') != '') {
  $keywords = Params::getParam('keywords');
} else {
  $keywords = (osc_get_preference('seoplugin_keywords', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_keywords', 'plugin-seo_plugin') : '' ;
}

$delimiter            = '';
$dao_preference = new Preference();
if(Params::getParam('delimiter') != '') {
  $delimiter = Params::getParam('delimiter');
} else {
  $delimiter = (osc_get_preference('seoplugin_delimiter', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_delimiter', 'plugin-seo_plugin') : '' ;
} 


	
if(Params::getParam('plugin_action')=='done') {
  $dao_preference->update(array("s_value" => $keywordsEnabled), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_keywords_enabled")) ;
  $dao_preference->update(array("s_value" => $keywords), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_keywords")) ;         
  $dao_preference->update(array("s_value" => $delimiter), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_delimiter")) ;               
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
      <input type="hidden" name="file" value="<?php echo osc_plugin_folder(__FILE__); ?>key.php" />
      <input type="hidden" name="plugin_action" value="done" />
      <br />

      <fieldset>
        <legend><i class="fa fa-cog"></i>&nbsp;<?php _e('Custom keywords','seo_plugin'); ?></legend>
    <br />

        <label for="keywordsEnabled" style="font-weight: bold;"><?php _e("Use the custom keywords defined below?", 'seo_plugin'); ?></label>:<br />
        <select name="keywordsEnabled" id="keywordsEnabled"> 
          <option <?php if($keywordsEnabled == 1){echo 'selected="selected"';}?>value='1'><?php _e('Yes','seo_plugin'); ?></option>
          <option <?php if($keywordsEnabled == 0){echo 'selected="selected"';}?>value='0'><?php _e('No','seo_plugin'); ?></option>
        </select>
        <br /><br />

        <label for="keywords" style="font-weight: bold;"><?php _e('Keywords:', 'seo_plugin'); ?></label><br />
        <input type="text" style="width:700px;" id="keywords" name="keywords" value="<?php echo $keywords; ?>" />
        <div style="padding: 5px 10px;" class="flashmessage flashmessage-warning flashmessage-inline"><?php _e('Separate keywords with comma, i.e.: key1, key2, key3', 'seo_plugin'); ?></div>

        <br /><br />

        <label for="delimiter" style="font-weight: bold;"><?php _e('Delimiter (used in title): ', 'seo_plugin'); ?></label><br />
        <input type="text" style="width:100px;" id="delimiter" name="delimiter" value="<?php echo $delimiter; ?>" />
        <div style="padding: 5px 10px;" class="flashmessage flashmessage-warning flashmessage-inline"><?php _e('Do not put blank spaces here, they are auto-generated', 'seo_plugin'); ?></div>
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