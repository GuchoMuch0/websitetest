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
        <h2 class="admin-title"><i class="far fa-file"></i> <?php _e('Register settings', 'san_auto'); ?></h2>
        <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post">
            <input type="hidden" name="action_specific" value="register" />

            <fieldset>
                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Select User Type', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="user_type" value="1" id="user_type" <?php echo (osc_get_preference('user_type', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="user_type"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Phone', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="phone" value="1" id="phone" <?php echo (osc_get_preference('phone', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="phone"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('User info', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="info" value="1" id="info" <?php echo (osc_get_preference('info', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="info"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Location', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="loc" value="1" id="loc" <?php echo (osc_get_preference('loc', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="loc"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Agree to the site rules', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="agree2" value="1" id="agree2" <?php echo (osc_get_preference('agree2', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="agree2"><?php _e('Off/On', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('Mandatory agreement with the rules of the site', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                        <div class="form-custom">
                            <div class="form-label"> <?php _e('Link', 'san_auto'); ?></div>
                            <input type="text" class="xlarge" name="agree_link2" placeholder="<?php echo osc_esc_html(__('Link to the page with the rules','san_auto')); ?>" value="<?php echo osc_esc_html( osc_get_preference('agree_link2', 'san_auto') ); ?>">
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="admin-actions">
                <button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Save','san_auto')); ?></button>
            </div>
        </form>

</div>
