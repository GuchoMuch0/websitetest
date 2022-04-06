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
    if ( (!defined('ABS_PATH')) ) exit('ABS_PATH is not loaded. Direct access is not allowed.');
    if ( !OC_ADMIN ) exit('User access is not allowed.');
 ?>

<div class="admin-content">
        <h2 class="admin-title"><i class="fas fa-search"></i> <?php _e('Search settings', 'san_auto'); ?></h2>
        <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post">
            <input type="hidden" name="action_specific" value="search" />

            <fieldset>
            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Search Right-To-Left', 'san_auto'); ?></div>
                    <div class="form-controls">
                        <div class="form-label-checkbox">
                              <input id="rtl" type="checkbox" name="rtl" value="1" <?php echo ( (osc_get_preference('rtl', 'san_auto') !== '0') ? 'checked="checked"' : ''); ?> />
                              <label for="rtl"></label>
                        </div>
                        <div class="example">
                          <img id="images" src="<?php echo ( (osc_get_preference('rtl', 'san_auto') !== '0') ? '' . osc_current_web_theme_url() .'admin/img/leftsidebar.png"' : '' . osc_current_web_theme_url() .'admin/img/rightsidebar.png')?>" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Default View on Search Page', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <select name="def_view" id="def_view">
                          <option value="0" <?php echo (osc_get_preference('def_view', 'san_auto') == 0 ? 'selected="selected"' : ''); ?>><?php _e('Gallery view', 'san_auto'); ?></option>
                          <option value="1" <?php echo (osc_get_preference('def_view', 'san_auto') == 1 ? 'selected="selected"' : ''); ?>><?php _e('List view', 'san_auto'); ?></option>
                        </select>
                    </div>
                </div>
            </div>


            </fieldset>
            <div class="admin-actions">
                <button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Save','san_auto')); ?></button>
            </div>
        </form>

</div>
