<?php

$pluginInfo = osc_plugin_get_info('seo_plugin/index.php');
if(Params::getParam('plugin_action')=='done') {
    message_ok(__('Settings saved','seo_plugin'));
    $detail = ModelSeoHome::newInstance()->getAttrHome();
    if(isset($detail['seo_home_id'])) {
        ModelSeoHome::newInstance()->updateAttr( 1, Params::getParam('seo_title'), Params::getParam('seo_description'), Params::getParam('seo_keywords') );
    } else {
        ModelSeoHome::newInstance()->insertAttr( 1, Params::getParam('seo_title'), Params::getParam('seo_description'), Params::getParam('seo_keywords') );
    }

}
?>
<style>
    table tr {font-weight:bold;}
    table tr td {padding-left:5px;padding-top:5px;}
</style>

<?php echo config_menu(); ?>
<fieldset>
    <legend><i class="fa fa-cog"></i>&nbsp;<?php _e('Settings for Main Page','seo_plugin'); ?></legend>
    <br />
    <form name="promo_form" id="promo_form" action="<?php echo osc_admin_base_url(true); ?>" method="POST" enctype="multipart/form-data" >
        <input type="hidden" name="page" value="plugins" />
        <input type="hidden" name="action" value="renderplugin" />
        <input type="hidden" name="file" value="<?php echo osc_plugin_folder(__FILE__); ?>home.php" />
        <input type="hidden" name="plugin_action" value="done" />

        <table>
            <tr>

                <td><?php _e('Meta Title', 'seo_plugin'); ?></td>
                <td><?php _e('Meta Description', 'seo_plugin'); ?></td>
                <td><?php _e('Meta Keywords', 'seo_plugin'); ?></td>
            </tr>

            <?php  $detail = ModelSeoHome::newInstance()->getAttrHome();?>
            <tr>
                <td><input type="text" name="seo_title" id="seo_title" value="<?php if($detail['seo_title'] != ''){echo $detail['seo_title']; } ?>" size="20" /></td>
                <td><input type="text" name="seo_description" id="seo_description" value="<?php if($detail['seo_description'] != ''){echo $detail['seo_description']; } ?>" size="20" /></td>
                <td><input type="text" name="seo_keywords" id="seo_keywords" value="<?php if($detail['seo_keywords'] != ''){echo $detail['seo_keywords']; } ?>" size="20" /></td>
            </tr>

            <!--            --><?php //}?>

        </table>
</fieldset>

<br /><br />
<button name="theButton" id="theButton" type="submit" style="float: left;" class="btn btn-submit"><?php _e('Save', 'seo_plugin');?></button>
</form>

<div class="clear"></div>
<br /><br />

<?php echo $pluginInfo['version'] . '|  &copy; ' . date('Y') . ' <a href="' . $pluginInfo['plugin_uri'] . '" target="_blank">SEO Plugin</a>'; ?>            
