<?php 

$pluginInfo = osc_plugin_get_info('seo_plugin/index.php');

// Get all static pages
function osc_has_static_pages_seo() {
  if ( !View::newInstance()->_exists('pages') ) {
    View::newInstance()->_exportVariableToView('pages', Page::newInstance()->listAll(false, 0) );
  }

  $page = View::newInstance()->_next('pages');
  View::newInstance()->_exportVariableToView('page_meta', json_decode($page['s_meta'], true));
  return $page;
}

if(Params::getParam('plugin_action')=='done') {
  message_ok(__('Settings saved','seo_plugin'));
  osc_reset_static_pages();

  while(osc_has_static_pages_seo()) {
    $detail = ModelSeoPage::newInstance()->getAttrByPageId( osc_static_page_id() );
    if(isset($detail['seo_page_id'])) {
      ModelSeoPage::newInstance()->updateAttr( osc_static_page_id(), Params::getParam('seo_title' . osc_static_page_id()), Params::getParam('seo_description' . osc_static_page_id()), Params::getParam('seo_keywords' . osc_static_page_id()) );
    } else {
      ModelSeoPage::newInstance()->insertAttr( osc_static_page_id(), Params::getParam('seo_title' . osc_static_page_id()), Params::getParam('seo_description' . osc_static_page_id()), Params::getParam('seo_keywords' . osc_static_page_id()) );
    } 
  }

} 
?>

<style>
  table tr {font-weight:bold;}
  table tr td {padding-left:5px;padding-top:5px;}
</style>

<?php echo config_menu(); ?>

<fieldset>
<legend><i class="fa fa-cog"></i>&nbsp;<?php _e('Static Pages Settings','seo_plugin'); ?></legend>
<br />
<form name="promo_form" id="promo_form" action="<?php echo osc_admin_base_url(true); ?>" method="POST" enctype="multipart/form-data" >
<input type="hidden" name="page" value="plugins" />
<input type="hidden" name="action" value="renderplugin" />
<input type="hidden" name="file" value="<?php echo osc_plugin_folder(__FILE__); ?>pages.php" />
<input type="hidden" name="plugin_action" value="done" />

<table>
  <tr>
    <td><?php _e(' ID', 'seo_plugin'); ?></td>
    <td><?php _e('Page Name', 'seo_plugin'); ?></td>
    <td><?php _e('Meta Title', 'seo_plugin'); ?></td>
    <td><?php _e('Meta Description', 'seo_plugin'); ?></td>
    <td><?php _e('Meta Keywords', 'seo_plugin'); ?></td>
  </tr>

  <?php
  osc_reset_static_pages();
  while(osc_has_static_pages_seo()) {
    $detail = ModelSeoPage::newInstance()->getAttrByPageId( osc_static_page_id() ); 
    ?>

    <tr>
      <td><input type="text" name="idcko" id="idcko" disabled value="<?php echo osc_static_page_id(); ?>" size="20" style="width:40px;text-align:center;" /></td>
      <td><input type="text" name="title" id="title" disabled value="<?php echo osc_static_page_title(); ?>" size="20" /></td>
      <td><input type="text" name="seo_title<?php echo osc_static_page_id(); ?>" id="seo_title" value="<?php if(isset($detail['seo_title']) != ''){echo $detail['seo_title']; } ?>" size="20" /></td>
      <td><input type="text" name="seo_description<?php echo osc_static_page_id(); ?>" id="seo_description" value="<?php if(isset($detail['seo_description']) != ''){echo $detail['seo_description']; } ?>" size="20" /></td>
      <td><input type="text" name="seo_keywords<?php echo osc_static_page_id(); ?>" id="seo_keywords" value="<?php if(isset($detail['seo_keywords']) != ''){echo $detail['seo_keywords']; } ?>" size="20" /></td>
    </tr>

  <?php }?>

</table>
</fieldset>

<br /><br />
<button name="theButton" id="theButton" type="submit" style="float: left;" class="btn btn-submit"><?php _e('Save', 'seo_plugin');?></button>
</form>

<div class="clear"></div>
<br /><br />

<?php echo $pluginInfo['version'] . '|  &copy; ' . date('Y') . ' <a href="' . $pluginInfo['plugin_uri'] . '" target="_blank">SEO Plugin</a>'; ?>                       
	