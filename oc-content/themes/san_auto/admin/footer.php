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
        <h2 class="admin-title"><?php _e('Footer settings', 'san_auto'); ?></h2>
        <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post">
            <input type="hidden" name="action_specific" value="footer" />

            <fieldset>
                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Footer link', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="footer_link" value="1" id="footer_link" <?php echo (osc_get_preference('footer_link', 'san_auto') ? 'checked' : ''); ?> >
        						<label for="footer_link"> <?php _e('I want to help San-Osclass by linking to <a href="https://san-osclass.com/" target="_blank">san-osclass.com</a> from my site with the following text:', 'san_auto'); ?></label>
                                <div class="help-box">
                                    <?php _e('This website is proudly using the <a title="San-Osclass web" target="_blank" href="https://san-osclass.com/"> theme </a> software San-Osclass', 'san_auto'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Customers', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="cust" value="1" id="cust" <?php echo (osc_get_preference('cust', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="cust"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Category', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="cat" value="1" id="cat" <?php echo (osc_get_preference('cat', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="cat"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                        <div class="form-custom">
                            <div class="form-label"> <?php _e('Number of categories', 'san_auto'); ?></div>
                            <input type="number" name="cat_count" id="cat_count" value="<?php echo osc_get_preference('cat_count', 'san_auto');  ?>"/>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Follow', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="follow" value="1" id="follow" <?php echo (osc_get_preference('follow', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="follow"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('About', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="about" value="1" id="about" <?php echo (osc_get_preference('about', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="about"><?php _e('Off/On', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Logo footer', 'san_auto'); ?></div>
                        <div class="form-controls">
                            <div class="form-label-checkbox">
                                <input type="checkbox" name="logo_footer" value="1" id="logo_footer" <?php echo (osc_get_preference('logo_footer', 'san_auto') ? 'checked' : ''); ?> >
                                <label for="logo_footer"><?php _e('Off/On', 'san_auto'); ?></label>
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
