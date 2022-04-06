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
        <h2 class="admin-title"><i class="fas fa-cogs"></i> <?php _e('Basic settings', 'san_auto'); ?></h2>
        <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post">
            <input type="hidden" name="action_specific" value="general" />

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Search placeholder', 'san_auto'); ?></div>
                    <div class="form-controls"><input type="text" class="xlarge" name="keyword_placeholder" value="<?php echo osc_esc_html( osc_get_preference('keyword_placeholder', 'san_auto') ); ?>"></div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Color', 'san_auto'); ?></div>
                    <div class="form-controls">
                        <div class="form-btn">
                            <div class="form-radio green">
                                <input type="radio" class="xlarge" name="color" id="green" value="green" <?= osc_get_preference('color', 'san_auto') == 'green' ? "checked" : ""; ?>/>
                                <label for="green"><?php _e('Standart', 'san_auto'); ?></label>
                            </div>
                            <div class="form-radio violet">
                                <input type="radio" class="xlarge" name="color" id="violet" value="violet" <?= osc_get_preference('color', 'san_auto') == 'violet' ? "checked" : ""; ?>/>
                                <label for="violet"><?php _e('Violet', 'san_auto'); ?></label>
                            </div>
                            <div class="form-radio blue">
                                <input type="radio" class="xlarge" name="color" id="blue" value="blue" <?= osc_get_preference('color', 'san_auto') == 'blue' ? "checked" : ""; ?>/>
                                <label for="blue"><?php _e('Blue', 'san_auto'); ?></label>
                            </div>
                            <div class="form-radio pink">
                                <input type="radio" class="xlarge" name="color" id="pink" value="pink" <?= osc_get_preference('color', 'san_auto') == 'pink' ? "checked" : ""; ?>/>
                                <label for="pink"><?php _e('Pink', 'san_auto'); ?></label>
                            </div>
                            <div class="form-radio custom">
                                <input type="radio" class="xlarge" name="color" id="custom" value="custom" <?= osc_get_preference('color', 'san_auto') == 'custom' ? "checked" : ""; ?>/>
                                <label for="custom"><?php _e('Custom', 'san_auto'); ?></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-custom form-custom-color <?= osc_get_preference('color', 'san_auto') == 'custom' ? 'active' : ''; ?>">
                        <div class="form-label"> <?php _e('Color', 'san_auto'); ?></div>
                        <input type="text" class="color {hash:true}" name="text_color" id="text_color" value="<?php echo osc_get_preference('text_color', 'san_auto');  ?>"/>
                    </div>

                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Phone', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fas fa-phone-volume"></i>
                        <input type="text" class="xlarge is-ico" name="phone_text" value="<?php echo osc_esc_html( osc_get_preference('phone_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('E-mail', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="far fa-envelope"></i>
                        <input type="text" class="xlarge is-ico" name="email_text" value="<?php echo osc_esc_html( osc_get_preference('email_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Facebook', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-facebook-f"></i>
                        <input type="text" class="xlarge is-ico" name="fc_text" value="<?php echo osc_esc_html( osc_get_preference('fc_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>
            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Twitter', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-twitter"></i>
                        <input type="text" class="xlarge is-ico" name="tw_text" value="<?php echo osc_esc_html( osc_get_preference('tw_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>
            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Instagram', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-instagram"></i>
                        <input type="text" class="xlarge is-ico" name="ins_text" value="<?php echo osc_esc_html( osc_get_preference('ins_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>
            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Pinterest', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-pinterest-p"></i>
                        <input type="text" class="xlarge is-ico" name="pin_text" value="<?php echo osc_esc_html( osc_get_preference('pin_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Vkontakte', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-vk"></i>
                        <input type="text" class="xlarge is-ico" name="vk_text" value="<?php echo osc_esc_html( osc_get_preference('vk_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>
            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Whatsapp', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-whatsapp"></i>
                        <input type="text" class="xlarge is-ico" name="wt_text" value="<?php echo osc_esc_html( osc_get_preference('wt_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>
            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Viber', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-viber"></i>
                        <input type="text" class="xlarge is-ico" name="viber_text" value="<?php echo osc_esc_html( osc_get_preference('viber_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>
            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Telegram', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-telegram-plane"></i>
                        <input type="text" class="xlarge is-ico" name="tg_text" value="<?php echo osc_esc_html( osc_get_preference('tg_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>
            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label">
                        <?php _e('Youtube', 'san_auto'); ?>
                    </div>
                    <div class="form-controls">
                        <i class="fab fa-youtube"></i>
                        <input type="text" class="xlarge is-ico" name="you_text" value="<?php echo osc_esc_html( osc_get_preference('you_text', 'san_auto') ); ?>">
                    </div>
                </div>
            </div>
            <div class="admin-actions">
                <button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Save','san_auto')); ?></button>
            </div>
        </form>


        <h2 class="admin-title"><i class="fas fa-image"></i> <?php _e('Photo at the top on all pages (except the home page)', 'san_auto'); ?></h2>
        <?php if (osc_use_imagick () == 1): ?>
            <p><strong><?php _e('Enable Use ImageMagick.', 'san_auto'); ?></strong></p>
        <?php endif; ?>
        <form name="icons" action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post" enctype="multipart/form-data" class="nocsrf">
            <input type="hidden" name="action_specific" value="background_page" />
            <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Photo', 'san_auto'); ?></div>
                         <div class="form-controls">
                                <div class="image">
                                <?php
                                if (file_exists(osc_base_path() . 'oc-content/themes/san_auto/images/header.jpg')) { ?>

                                    <img width="auto" height="50" src="<?php echo osc_current_web_theme_url('images/page-cover.jpg?v=' . date('YmdHis'));?>" /><br />

                                    <?php } else { _e('No icon', 'san_auto');} ?>

                                </div>
                                <div class="file">
                                    <input type="file" name="background_pic" id="package" accept="image/x-png"/>
                                    <button type="submit" class="btn btn-submit btn-success"><?php _e('Upload', 'san_auto'); ?></button>
                                </div>
                        </div>
                    </div>
            </div>
        </form>

</div>
