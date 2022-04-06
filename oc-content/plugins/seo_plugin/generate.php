<?php 
if (!defined('OC_ADMIN') || OC_ADMIN!==true) exit('Access is not allowed.');

$pluginInfo = osc_plugin_get_info('seo_plugin/index.php');

$freq            = '';
$dao_preference = new Preference();
if(Params::getParam('sitemap_freq') != '') {
  $freq = Params::getParam('sitemap_freq');
} else {
  $freq = (osc_get_preference('seoplugin_sitemap_freq', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_sitemap_freq', 'plugin-seo_plugin') : '' ;
}

$sitemap_items            = '';
$dao_preference = new Preference();
if(Params::getParam('sitemap_items') != '') {
  $sitemap_items = Params::getParam('sitemap_items');
} else {
  $sitemap_items = (osc_get_preference('seoplugin_sitemap_items', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_sitemap_items', 'plugin-seo_plugin') : '' ;
}

$sitemap_items_limit            = '';
$dao_preference = new Preference();
if(Params::getParam('sitemap_items_limit') != '') {
  $sitemap_items_limit = Params::getParam('sitemap_items_limit');
} else {
  $sitemap_items_limit = (osc_get_preference('seoplugin_sitemap_items_limit', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_sitemap_items_limit', 'plugin-seo_plugin') : '' ;
}

if(Params::getParam('plugin_action')=='done') {

  //Update params
  $dao_preference->update(array("s_value" => $freq), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_sitemap_freq")) ;
  $dao_preference->update(array("s_value" => $sitemap_items), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_sitemap_items")) ;
  $dao_preference->update(array("s_value" => $sitemap_items_limit), array("s_section" => "plugin-seo_plugin", "s_name" => "seoplugin_sitemap_items_limit")) ;

  //Generate sitemap
  seo_sitemap_generator(); 
  message_ok(__('Sitemap generated correctly', 'seo_plugin'));
  osc_reset_preferences();
}

unset($dao_preference) ;
?>


<form name="promo_form" id="promo_form" action="<?php echo osc_admin_base_url(true); ?>" method="POST" enctype="multipart/form-data" >
<input type="hidden" name="page" value="plugins" />
<input type="hidden" name="action" value="renderplugin" />
<input type="hidden" name="file" value="<?php echo osc_plugin_folder(__FILE__); ?>generate.php" />
<input type="hidden" name="plugin_action" value="done" />

<div id="settings_form">
  <?php echo config_menu(); ?>

    <fieldset>
      <legend><i class="fa fa-cog"></i>&nbsp;<?php _e('Sitemap Generator', 'seo_plugin'); ?></legend>
      <a style="font-weight:bold;" href="<?php echo osc_base_url() . 'sitemap.xml';?>" target="_blank"><?php _e('View sitemap','seo_plugin'); ?> >></a>

      <br /><br />

      <label for="sitemap_freq" style="font-weight:bold"><?php _e("Select frequency of sitemap generation", 'seo_plugin'); ?></label>:<br />
      <select name="sitemap_freq" id="sitemap_freq"> 
        <option <?php if($freq == 'weekly'){echo 'selected="selected"';}?>value='weekly'><?php _e('Weekly','seo_plugin'); ?></option>
        <option <?php if($freq == 'daily'){echo 'selected="selected"';}?>value='daily'><?php _e('Daily','seo_plugin'); ?></option>
        <option <?php if($freq == 'hourly'){echo 'selected="selected"';}?>value='hourly'><?php _e('Hourly','seo_plugin'); ?></option>
        <option <?php if($freq == 'none'){echo 'selected="selected"';}?>value='none'><?php _e('None','seo_plugin'); ?></option>
      </select>

      <br /><br />

      <label for="sitemap_items" style="font-weight:bold"><?php _e('Do you want to include items to sitemap?','seo_plugin'); ?></label>:<br />
      <select name="sitemap_items" id="sitemap_items"> 
        <option <?php if($sitemap_items == 1){echo 'selected="selected"';}?>value='1'><?php _e('Yes','seo_plugin'); ?></option>
        <option <?php if($sitemap_items == 0){echo 'selected="selected"';}?>value='0'><?php _e('No','seo_plugin'); ?></option>
      </select>

      <br /><br />

      <label for="sitemap_items_limit" style="font-weight:bold"><?php _e('Limit maximum count of items in sitemap?','seo_plugin'); ?></label>:<br />
      <input type="text" name="sitemap_items_limit" id="sitemap_items_limit" value="<?php echo $sitemap_items_limit;?>" /><br />
    </fieldset> 
      
    <br /><br />  
					                 
    <button name="theButton" id="theButton" type="submit" style="float: left;" class="btn btn-submit"><?php _e('Save', 'seo_plugin');?></button>
  </div>
</div>
</form>

<div class="clear"></div>
<br /><br />

<?php echo $pluginInfo['version'] . '|  &copy; ' . date('Y') . ' <a href="' . $pluginInfo['plugin_uri'] . '" target="_blank">SEO Plugin</a>'; ?>                     

<script>
if($('#sitemap_items').val() == 0) { $('#sitemap_items_limit').css('opacity', '0.7');$('#sitemap_items_limit').prop('disabled', true); $('#sitemap_items_limit').css('color', '#666'); $('#sitemap_items_limit').css('background-color', '#fefefe'); } else { $('#sitemap_items_limit').prop('disabled', false); $('#sitemap_items_limit').css('color', '#000'); $('#sitemap_items_limit').css('background-color', '#fff');$('#sitemap_items_limit').css('opacity', '1'); }

$('#sitemap_items').click(function(){
  if($('#sitemap_items').val() == 0) { $('#sitemap_items_limit').css('opacity', '0.7');$('#sitemap_items_limit').prop('disabled', true); $('#sitemap_items_limit').css('color', '#666'); $('#sitemap_items_limit').css('background-color', '#fefefe'); } else { $('#sitemap_items_limit').prop('disabled', false); $('#sitemap_items_limit').css('color', '#000'); $('#sitemap_items_limit').css('background-color', '#fff');$('#sitemap_items_limit').css('opacity', '1'); }
});
</script>