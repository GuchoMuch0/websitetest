<?php

$pluginInfo = osc_plugin_get_info('seo_plugin/index.php');

$robotsEnabled            = '';
$dao_preference = new Preference();
if(Params::getParam('robotsEnabled') != '') {
  $robotsEnabled = Params::getParam('robotsEnabled');
} else {
  $robotsEnabled = (osc_get_preference('seoplugin_robots_enabled', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_robots_enabled', 'plugin-seo_plugin') : '' ;
}

$robots            = '';
$dao_preference = new Preference();
if(Params::getParam('robots') != '') {
  $robots = Params::getParam('robots', false, false);
} else {
  $robots = (osc_get_preference('seoplugin_robots', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_robots', 'plugin-seo_plugin') : '' ;
} 

if(Params::getParam('plugin_action')=='done') {
  $dao_preference->update(array("s_value" => $robotsEnabled), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_robots_enabled")) ;
  $dao_preference->update(array("s_value" => $robots), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_robots")) ; 

  if($robotsEnabled == 0) {$content = 'User-agent: * <br> Disallow: /oc-admin/'; } else { $content = $robots;}
  $fp = fopen($_SERVER['DOCUMENT_ROOT'] .  "/robots.txt","wb"); 
  fwrite($fp,$content);
  fclose($fp);

  osc_reset_preferences();
  message_ok(__('robots.txt file was successfully updated','seo_plugin'));

  if(!is_writable($_SERVER['DOCUMENT_ROOT'] .  "/robots.txt")) {
    message_error(__('It is impossible to write to robots.txt file, please change CHMOD settings on this file.','seo_plugin'));
  }
}

unset($dao_preference) ;
?>

<div id="settings_form">
  <?php echo config_menu(); ?>

      <form name="promo_form" id="promo_form" action="<?php echo osc_admin_base_url(true); ?>" method="POST" enctype="multipart/form-data" >
      <input type="hidden" name="page" value="plugins" />
      <input type="hidden" name="action" value="renderplugin" />
      <input type="hidden" name="file" value="<?php echo osc_plugin_folder(__FILE__); ?>robots.php" />
      <input type="hidden" name="plugin_action" value="done" />
      <br />

      <fieldset>
        <legend><i class="fa fa-cog"></i>&nbsp;<?php _e('Settings robots.txt','seo_plugin'); ?></legend>

        <label for="robotsEnabled" style="font-weight: bold;"><?php _e("Which robots.txt you want to use?", 'seo_plugin'); ?></label>:<br />
        <select name="robotsEnabled" id="robotsEnabled"> 
          <option <?php if($robotsEnabled == 1){echo 'selected="selected"';}?>value='1'><?php _e('Custom','seo_plugin'); ?></option>
          <option <?php if($robotsEnabled == 0){echo 'selected="selected"';}?>value='0'><?php _e('Default','seo_plugin'); ?></option>
        </select>
      
        <br /><br />
        
        <label for="robots" style="font-weight: bold;"><?php _e('Robots.txt: ', 'seo_plugin'); ?></label><br />
        <textarea <?php if ($robotsEnabled == 0) { echo "disabled"; } ?> rows="20" type="text" style="width:800px;height:250px;" id="robots" name="robots" value="<?php echo $robots; ?>" ><?php echo $robots; ?></textarea>

        <br /><br />

        <div class="important"><?php _e('Important:', 'seo_plugin'); ?></div>
        <div><?php _e('You should always disable admin folder (oc-admin) to be indexed by search engines:', 'seo_plugin'); ?></div>
        <div><?php echo osc_base_url() . 'oc-admin';?></div>
		<div><?php _e('It is also desirable to close the registration page, login and password reminder:', 'seo_plugin'); ?></div>
		<div><?php echo osc_base_url() . 'user/login';?></div>
		<div><?php echo osc_base_url() . 'user/register';?></div>
		<div><?php echo osc_base_url() . 'user/recover';?></div>
        <br /> 
      </fieldset>				       

      <br /><br />  
					                 
      <button name="theButton" id="theButton" type="submit" style="float: left;" class="btn btn-submit"><?php _e('Save', 'seo_plugin');?></button>
      </form>

      <div class="clear"></div>
      <br /><br />

      <?php echo $pluginInfo['version'] . '|  &copy; ' . date('Y') . ' <a href="' . $pluginInfo['plugin_uri'] . '" target="_blank">SEO Plugin</a>'; ?>                    
</div>

<script>
if($('#robotsEnabled').val() == 0) { $('#robots').css('opacity', '0.7'); $('#robots').prop('disabled', true); $('#robots').css('color', '#666'); $('#robots').css('background-color', '#fefefe'); } else { $('#robots').prop('disabled', false); $('#robots').css('color', '#000'); $('#robots').css('background-color', '#fff'); $('#robots').css('opacity', '1');}

$('#robotsEnabled').click(function(){
  if($('#robotsEnabled').val() == 0) { $('#robots').css('opacity', '0.7'); $('#robots').prop('disabled', true); $('#robots').css('color', '#666'); $('#robots').css('background-color', '#fefefe'); } else { $('#robots').prop('disabled', false); $('#robots').css('color', '#000'); $('#robots').css('background-color', '#fff');$('#robots').css('opacity', '1'); }
});
</script>