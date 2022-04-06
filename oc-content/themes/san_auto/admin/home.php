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
        <h2 class="admin-title"><i class="fas fa-home"></i> <?php _e('Home settings', 'san_auto'); ?></h2>

        <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post">
            <input type="hidden" name="action_specific" value="home" />
            <fieldset>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Slider/Image', 'san_auto'); ?></div>
                    <div class="form-controls">
                        <select name="defaultSlide">
                            <option value="slider" <?php if(san_auto_default_image() == 'slider'){ echo 'selected="selected"' ; } ?>><?php _e('Slider','san_auto'); ?></option>
                            <option value="image" <?php if(san_auto_default_image() == 'image'){ echo 'selected="selected"' ; } ?>><?php _e('Image','san_auto'); ?></option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
    			<div class="form-row">
    	            <div class="form-label">
    	                <?php _e('H1 on Home', 'san_auto'); ?>
    	            </div>
    	            <div class="form-controls">
    	                <input type="text" class="xlarge" name="h1_text" value="<?php echo osc_esc_html( osc_get_preference('h1_text', 'san_auto') ); ?>">
                        <div class="help-box"><?php _e('If "Image" is selected', 'san_auto'); ?></div>
    	            </div>
    	        </div>
            </div>

            <div class="form-horizontal">
    			<div class="form-row">
    	            <div class="form-label">
    	                <?php _e('H2 on Home', 'san_auto'); ?>
    	            </div>
    	            <div class="form-controls">
    	                <input type="text" class="xlarge" name="h2_text" value="<?php echo osc_esc_html( osc_get_preference('h2_text', 'san_auto') ); ?>">
                        <div class="help-box"><?php _e('If "Image" is selected', 'san_auto'); ?></div>
    	            </div>
    	        </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Select location', 'san_auto'); ?> </div>
                    <div class="form-controls">
                        <select name="loc_home">
                          <option value="region" <?php echo (osc_get_preference('loc_home', 'san_auto') == "region" ? 'selected="selected"' : ''); ?>><?php _e('Only regions','san_auto'); ?></option>
                          <option value="city" <?php echo (osc_get_preference('loc_home', 'san_auto') == "city" ? 'selected="selected"' : ''); ?>><?php _e('Only cities','san_auto'); ?></option>
                          <option value="auto" <?php echo (osc_get_preference('loc_home', 'san_auto') == "auto" ? 'selected="selected"' : ''); ?>><?php _e('Autocomplete','san_auto'); ?></option>
                          <option value="hide" <?php echo (osc_get_preference('loc_home', 'san_auto') == "hide" ? 'selected="selected"' : ''); ?>><?php _e('Hide','san_auto'); ?></option>
                      </select>
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Premium items', 'san_auto'); ?></div>
                    <div class="form-controls">
                        <select name="prem_items">
                            <option value="on" <?php if(prem_items() == 'on'){ echo 'selected="selected"' ; } ?>><?php _e('On','san_auto'); ?></option>
                            <option value="off" <?php if(prem_items() == 'off'){ echo 'selected="selected"' ; } ?>><?php _e('Off','san_auto'); ?></option>
                        </select>
                    </div>
                    <div class="form-custom">
                        <div class="form-label"> <?php _e('Number of items', 'san_auto'); ?></div>
                        <input type="number" name="prem_count" id="prem_count" value="<?php echo osc_get_preference('pop_count', 'san_auto');  ?>"/>
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Make list', 'san_auto'); ?></div>
                    <div class="form-controls">
                        <select name="make_items">
                            <option value="on" <?php if(make_items() == 'on'){ echo 'selected="selected"' ; } ?>><?php _e('On','san_auto'); ?></option>
                            <option value="off" <?php if(make_items() == 'off'){ echo 'selected="selected"' ; } ?>><?php _e('Off','san_auto'); ?></option>
                        </select>
                    </div>
                    <div class="form-custom">
                        <div class="form-label"> <?php _e('Number of make', 'san_auto'); ?></div>
                        <input type="number" name="make_count" id="make_count" value="<?php echo osc_get_preference('make_count', 'san_auto');  ?>"/>
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Latest items', 'san_auto'); ?></div>
                    <div class="form-controls">
                        <select name="lat_items">
                            <option value="on" <?php if(lat_items() == 'on'){ echo 'selected="selected"' ; } ?>><?php _e('On','san_auto'); ?></option>
                            <option value="off" <?php if(lat_items() == 'off'){ echo 'selected="selected"' ; } ?>><?php _e('Off','san_auto'); ?></option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-row">
                    <div class="form-label"><?php _e('Popular items', 'san_auto'); ?></div>
                    <div class="form-controls">
                        <select name="pop_items">
                            <option value="on" <?php if(pop_items() == 'on'){ echo 'selected="selected"' ; } ?>><?php _e('On','san_auto'); ?></option>
                            <option value="off" <?php if(pop_items() == 'off'){ echo 'selected="selected"' ; } ?>><?php _e('Off','san_auto'); ?></option>
                        </select>
                    </div>
                    <div class="form-custom">
                        <div class="form-label"> <?php _e('Number of items', 'san_auto'); ?></div>
                        <input type="number" name="pop_count" id="pop_count" value="<?php echo osc_get_preference('pop_count', 'san_auto');  ?>"/>
                    </div>
                </div>
            </div>



            </fieldset>


            <h2 class="admin-title"><i class="fas fa-arrows-alt"></i> <?php _e('Position blocks', 'san_auto'); ?></h2>
            <div class="position">
                    <?php if (prem_items() == 'on'): ?>
                        <div class="pos<?= osc_get_preference('prempos','san_auto') ?>">
                            <p>Premium</p>
                            <input type="hidden" id="prempos" name="prempos" value="<?= osc_get_preference('prempos','san_auto') ?>"/>
                        </div>
                    <?php endif; ?>
                    <?php if (make_items() == 'on'): ?>
                        <div class="pos<?= osc_get_preference('makepos','san_auto') ?>">
                            <p>Makes</p>
                            <input type="hidden" id="makepos" name="makepos" value="<?= osc_get_preference('makepos','san_auto') ?>"/>
                        </div>
                    <?php endif; ?>
                    <?php if (lat_items() == 'on'): ?>
                        <div class="pos<?= osc_get_preference('lastpos','san_auto') ?>">
                            <p>Latest</p>
                            <input type="hidden" id="lastpos"  name="lastpos" value="<?= osc_get_preference('lastpos','san_auto') ?>"/>
                        </div>
                    <?php endif; ?>

                    <?php if (pop_items() == 'on'): ?>
                        <div class="pos<?= osc_get_preference('poppos','san_auto') ?>">
                            <p>Popular</p>
                            <input type="hidden" id="poppos" name="poppos" value="<?= osc_get_preference('poppos','san_auto') ?>"/>
                        </div>
                    <?php endif; ?>

            </div>


            <div class="admin-actions">
                <button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Save','san_auto')); ?></button>
            </div>
        </form>

        <hr>
        <h2 class="admin-title"><i class="fas fa-image"></i> <?php _e('Image settings', 'san_auto'); ?></h2>
        <?php if (osc_use_imagick () == 1): ?>
            <p><strong><?php _e('Enable Use ImageMagick.', 'san_auto'); ?></strong></p>
        <?php endif; ?>
        <form name="icons" action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post" enctype="multipart/form-data" class="nocsrf">
            <input type="hidden" name="action_specific" value="background" />
            <div class="form-horizontal">
                    <div class="form-row">
                        <div class="form-label"><?php _e('Photo', 'san_auto'); ?></div>
                         <div class="form-controls">
                                <div class="image">
                                <?php
                                if (file_exists(osc_base_path() . 'oc-content/themes/san_auto/images/header.jpg')) { ?>

                                    <img width="auto" height="50" src="<?php echo osc_current_web_theme_url('images/header.jpg?v=' . date('YmdHis'));?>" /><br />

                                    <?php } else { _e('No icon', 'san_auto');} ?>

                                </div>
                                <div class="file">
                                    <input type="file" name="background_images" id="package" accept="image/x-png"/>
                                    <button type="submit" class="btn btn-submit btn-success"><?php _e('Upload', 'san_auto'); ?></button>
                                </div>
                                <div class="help-box"><?php _e('If "Image" is selected', 'san_auto'); ?></div>
                        </div>
                    </div>
            </div>
        </form>

        <script type="text/javascript">
            $('.position').sortable({
                update: function (event, ui) {
                    $('.position div').each(function (i) {
                        var numbering = i + 1;
                        $(this).find('input').val(numbering);
                        $(this).removeClass().addClass('pos'+numbering);
                    });
                },
                placeholder: 'highlight-grey',
            });
            $('.position').disableSelection();

        </script>
</div>
