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
        <h2 class="admin-title"><i class="far fa-file"></i> <?php _e('Item settings', 'san_auto'); ?></h2>
        <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post">
            <input type="hidden" name="action_specific" value="item" />

            <fieldset>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Item Right-To-Left', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                  <input id="rtl2" type="checkbox" name="rtl2" value="1" <?php echo ( (osc_get_preference('rtl2', 'san_auto') !== '0') ? 'checked="checked"' : ''); ?> />
                                  <label for="rtl2"></label>
                            </div>
                            <div class="example">
                              <img id="images2" src="<?php echo ( (osc_get_preference('rtl2', 'san_auto') !== '0') ? '' . osc_current_web_theme_url() .'admin/img/leftsidebar.png"' : '' . osc_current_web_theme_url() .'admin/img/rightsidebar.png')?>" alt="">
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Useful information', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="useful" value="1" id="useful" <?php echo (osc_get_preference('useful', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="useful"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Mark', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="mark" value="1" id="mark" <?php echo (osc_get_preference('mark', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="mark"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

            </fieldset>
            <div class="admin-actions">
                <button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Save','san_auto')); ?></button>
            </div>
        </form>

</div>
