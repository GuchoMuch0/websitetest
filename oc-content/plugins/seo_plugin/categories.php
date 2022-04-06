<?php 

$pluginInfo = osc_plugin_get_info('seo_plugin/index.php');

if(Params::getParam('plugin_action')=='done') {
  message_ok(__('Settings saved','seo_plugin'));
} 
?>

<style>
  table tr {font-weight:bold;}
  table tr td {padding-left:5px;padding-top:5px;}
</style>

<div id="settings_form">
<?php echo config_menu(); ?>

<form name="promo_form" id="promo_form" action="<?php echo osc_admin_base_url(true); ?>" method="POST" enctype="multipart/form-data" >
<input type="hidden" name="page" value="plugins" />
<input type="hidden" name="action" value="renderplugin" />
<input type="hidden" name="file" value="<?php echo osc_plugin_folder(__FILE__); ?>categories.php" />
<input type="hidden" name="plugin_action" value="done" />

<fieldset >
<legend><i class="fa fa-cog"></i>&nbsp;<?php _e('Settings categories','seo_plugin'); ?></legend>

<br /><br />

<table>
  <tr>
    <td><?php _e('ID', 'seo_plugin'); ?></td>
    <td><?php _e('Category name', 'seo_plugin'); ?></td>
    <td><?php _e('Meta Title', 'seo_plugin'); ?></td>
    <td><?php _e('Meta Description', 'seo_plugin'); ?></td>
    <td><?php _e('Meta Keywords', 'seo_plugin'); ?></td>
  </tr>

  <?php
  osc_goto_first_category();

  // First, feed Parent Categories
  while(osc_has_categories()) {
    $detail = ModelSeoCategory::newInstance()->getAttrByCategoryId( osc_category_id() ); 

    //Update if anything
    if(Params::getParam('plugin_action')=='done') {
      if( Params::getParam('seo_title' . osc_category_id()) <> '' or Params::getParam('seo_description' . osc_category_id()) <> '' or Params::getParam('seo_keywords' . osc_category_id()) <> '') {
        if(isset($detail['seo_category_id'])) {
          ModelSeoCategory::newInstance()->updateAttr( osc_category_id(), Params::getParam('seo_title' . osc_category_id()), Params::getParam('seo_description' . osc_category_id()), Params::getParam('seo_keywords' . osc_category_id()) );
        } else {
          ModelSeoCategory::newInstance()->insertAttr( osc_category_id(), Params::getParam('seo_title' . osc_category_id()), Params::getParam('seo_description' . osc_category_id()), Params::getParam('seo_keywords' . osc_category_id()) );
        } 
      } else {
        if(isset($detail['seo_category_id'])) { ModelSeoCategory::newInstance()->deleteCategory( $detail['seo_category_id'] ); } 
      }
    }
    $detail = ModelSeoCategory::newInstance()->getAttrByCategoryId( osc_category_id() ); 
    ?>

    <tr>
      <td><input type="text" name="idcko" id="idcko" disabled value="<?php echo osc_category_id(); ?>" size="20" style="width:40px;text-align:center;font-weight:bold;color:#000" /></td>
      <td><input type="text" name="title" id="title" disabled value="<?php echo osc_category_name(); ?>" size="20" style="width:190px;font-weight:bold;color:#000"/></td>
      <td><input type="text" name="seo_title<?php echo osc_category_id(); ?>" id="seo_title" value="<?php if(isset($detail['seo_title']) != ''){echo $detail['seo_title']; } ?>" size="20" /></td>
      <td><input type="text" name="seo_description<?php echo osc_category_id(); ?>" id="seo_description" value="<?php if(isset($detail['seo_description']) != ''){echo $detail['seo_description']; } ?>" size="20" /></td>
      <td><input type="text" name="seo_keywords<?php echo osc_category_id(); ?>" id="seo_keywords" value="<?php if(isset($detail['seo_keywords']) != ''){echo $detail['seo_keywords']; } ?>" size="20" /></td>
    </tr>
    <?php


    // Now, feed Subcategories
    while(osc_has_subcategories()) {
      $detail = ModelSeoCategory::newInstance()->getAttrByCategoryId( osc_category_id() ); 

      //Update if anything
      if(Params::getParam('plugin_action')=='done') {
        if( Params::getParam('seo_title' . osc_category_id()) <> '' or Params::getParam('seo_description' . osc_category_id()) <> '' or Params::getParam('seo_keywords' . osc_category_id()) <> '') {
          if(isset($detail['seo_category_id'])) {
            ModelSeoCategory::newInstance()->updateAttr( osc_category_id(), Params::getParam('seo_title' . osc_category_id()), Params::getParam('seo_description' . osc_category_id()), Params::getParam('seo_keywords' . osc_category_id()) );
          } else {
            ModelSeoCategory::newInstance()->insertAttr( osc_category_id(), Params::getParam('seo_title' . osc_category_id()), Params::getParam('seo_description' . osc_category_id()), Params::getParam('seo_keywords' . osc_category_id()) );
          } 
        } else {
          if(isset($detail['seo_category_id'])) { ModelSeoCategory::newInstance()->deleteCategory( $detail['seo_category_id'] ); } 
        }
      }
      $detail = ModelSeoCategory::newInstance()->getAttrByCategoryId( osc_category_id() ); 
      ?>

      <tr>
        <td><input type="text" name="idcko" id="idcko" disabled value="<?php echo osc_category_id(); ?>" size="20" style="width:40px;text-align:center;" /></td>
        <td><input type="text" name="title" id="title" disabled value="<?php echo osc_category_name(); ?>" size="20" style="width:175px;margin-left:15px;"/></td>
        <td><input type="text" name="seo_title<?php echo osc_category_id(); ?>" id="seo_title" value="<?php if(isset($detail['seo_title']) != ''){echo $detail['seo_title']; } ?>" size="20" /></td>
        <td><input type="text" name="seo_description<?php echo osc_category_id(); ?>" id="seo_description" value="<?php if(isset($detail['seo_description']) != ''){echo $detail['seo_description']; } ?>" size="20" /></td>
        <td><input type="text" name="seo_keywords<?php echo osc_category_id(); ?>" id="seo_keywords" value="<?php if(isset($detail['seo_keywords']) != ''){echo $detail['seo_keywords']; } ?>" size="20" /></td>
      </tr>
    <?php }?>
  <?php }?>

</table>
</fieldset>

<br /><br />
<button name="theButton" id="theButton" type="submit" style="float: left;" class="btn btn-submit"><?php _e('Save', 'seo_plugin');?></button>
</form>
</div>

<div class="clear"></div>
<br /><br />

<?php echo $pluginInfo['version'] . '|  &copy; ' . date('Y') . ' <a href="' . $pluginInfo['plugin_uri'] . '" target="_blank">SEO Plugin</a>'; ?>                      

	