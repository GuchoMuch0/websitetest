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
        <h2 class="admin-title"><i class="far fa-file"></i>  <?php _e('Item-post settings', 'san_auto'); ?></h2>
        <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post">
            <input type="hidden" name="action_specific" value="post" />

            <fieldset>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Input "City area" as a phone', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="cityarea" value="1" id="cityarea" <?php echo (osc_get_preference('cityarea', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="cityarea"><?php _e('No/Yes', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('The field for "City area" will be used as a phone to the item.', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('City area | Phone - required', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="cityarea_req" value="1" id="cityarea_req" <?php echo (osc_get_preference('cityarea_req', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="cityarea_req"><?php _e('No/Yes', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('The field will be required', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Price - required', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="price_req" value="1" id="price_req" <?php echo (osc_get_preference('price_req', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="price_req"><?php _e('No/Yes', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('The field will be required', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Name - required', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="name_req" value="1" id="name_req" <?php echo (osc_get_preference('name_req', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="name_req"><?php _e('No/Yes', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('The field will be required', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Location - required', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="loc_req" value="1" id="loc_req" <?php echo (osc_get_preference('loc_req', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="loc_req"><?php _e('No/Yes', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('The field will be required', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Address - required', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="address_req" value="1" id="address_req" <?php echo (osc_get_preference('address_req', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="address_req"><?php _e('No/Yes', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('The field will be required', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Agree to the site rules', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="agree" value="1" id="agree" <?php echo (osc_get_preference('agree', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="agree"><?php _e('Off/On', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('Mandatory agreement with the rules of the site', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                        <div class="form-custom">
                            <div class="form-label"> <?php _e('Link', 'san_auto'); ?></div>
                            <input type="text" class="xlarge" name="agree_link" placeholder="<?php echo osc_esc_html(__('Link to the page with the rules','san_auto')); ?>" value="<?php echo osc_esc_html( osc_get_preference('agree_link', 'san_auto') ); ?>">
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="admin-actions">
                <button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Save','san_auto')); ?></button>
            </div>

        </form>

</div>
