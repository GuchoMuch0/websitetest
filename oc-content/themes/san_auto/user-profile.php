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

    $locales   = __get('locales');
    $user = osc_user();
    osc_enqueue_style('jquery-ui-custom', osc_current_web_theme_styles_url('jquery-ui/jquery-ui-1.8.20.custom.css'));
    if (Params::getParam('user_images_action') == 'upload'){
        san_auto_users_images(Params::getParam('userID'),Params::getFiles('package'));
            if(isset($package["error"])) {
                if( $package['error'] == UPLOAD_ERR_OK ) {
                    header('location:'.$_SERVER['REQUEST_URI']);
                    osc_add_flash_ok_message(__('The image has been uploaded correctly', 'san_auto'));
                } else {
                    header('location:'.$_SERVER['REQUEST_URI']);
                    osc_add_flash_error_message(__("An error has occurred, please try again", 'san_auto'));
                }
            }
        } else if (Params::getParam('user_images_action') == 'delete'){
            $path = osc_base_path().'oc-content/uploads/san_auto_users_images/'.Params::getParam('userID').'.jpg' ;
            if(file_exists( $path ) ) {
                @unlink( $path );
                header('location:'.$_SERVER['REQUEST_URI']);
                osc_add_flash_ok_message(__('The image has been removed', 'san_auto'));

            } else {
                header('location:'.$_SERVER['REQUEST_URI']);
                osc_add_flash_error_message(__("Image not found", 'san_auto'));

            }
        }


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="noindex, nofollow" />
        <meta name="googlebot" content="noindex, nofollow" />
    </head>
    <body>
        <?php osc_current_web_theme_path('header.php'); ?>
        <section class="full_h">
        <div class="wrapper">
            <div class="user-box">
            <div class="search-sidebar">
                <div class="search-box">
                    <div class="search-name">
                        <h2><?php _e('Profile', 'san_auto'); ?></h2>
                    </div>
                    <div class="user-sidebar">
                        <?php echo osc_private_user_menu_san_auto(get_user_menu()); ?>
                    </div>
                </div>
            </div>
            <div class="search-items">
                    <div class="users-bar">
                        <h2><?php _e('Update your profile', 'san_auto'); ?></h2>
                        <div class="users-edit">
                            <a href="<?php echo osc_change_user_email_url(); ?>"><i class="ion ion-md-create"></i> <?php _e('Modify e-mail', 'san_auto'); ?></a>
                            <a href="<?php echo osc_change_user_password_url(); ?>" ><i class="ion ion-md-create"></i> <?php _e('Modify password', 'san_auto'); ?></a>
                        </div>
                    </div>
                    <div class="users-content">
                        <?php UserForm::location_javascript(); ?>
                        <script type="text/javascript">
                            $(document).ready(function(){
                                $("#delete_account").click(function(){
                                    $("#dialog-delete-account").dialog('open');
                                });

                                $("#dialog-delete-account").dialog({
                                    autoOpen: false,
                                    modal: true,
                                    buttons: {
                                        "<?php echo osc_esc_js(__('Delete', 'san_auto')); ?>": function() {
                                            window.location = '<?php echo osc_base_url(true).'?page=user&action=delete&id='.osc_user_id().'&secret='.$user['s_secret']; ?>';
                                        },
                                        "<?php echo osc_esc_js(__('Cancel', 'san_auto')); ?>": function() {
                                            $( this ).dialog( "close" );
                                        }
                                    }
                                });
                            });
                        </script>

                        <?php if(!file_exists(osc_base_path().'oc-content/uploads/san_auto_users_images/'.osc_user_id().'.jpg')){  ?>
                            <div class="user-photo">
                              <div class="user-ava">
                                 <?= user_avatar_show(osc_user_id(), false, false, false); ?>
                              </div>
                              <div class="user-loadphoto">
                                  <form name="user_images" action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="post" enctype="multipart/form-data" class="nocsrf" onsubmit="return checkSize(524288)">
                                    <input type="hidden" name="user_images_action" value="upload" />
                                    <input type="hidden" name="userID" value="<?php echo osc_user_id(); ?>" />
                                    <div class="user-file">
                                        <div class="item-form-attachment">
                                            <input type="file" name="package" id="img_upload" accept="image/*"  />
                                        </div>
                                        <button class="btn" type="submit" ><i class="ion ion-md-cloud-upload"></i> <?php _e('Upload', 'san_auto'); ?></button>
                                    </div>
                                    <div class="maxsise"><?php _e('Max file size is', 'san_auto'); ?> <?php echo round(osc_max_size_kb()/1000, 1); ?> Mb, <?php _e('Suitable files are .jpg', 'san_auto'); ?></div>
                                  </form>
                              </div>
                            </div>
                        <?php } else { ?>
                            <div class="user-photo">
                              <div class="user-ava">
                                  <img width="100%" src="<?php echo osc_base_url().'oc-content/uploads/san_auto_users_images/'.osc_logged_user_id().'.jpg' ; ?>" />
                              </div>
                              <div class="user-loadphoto">
                                  <form name="user_images" action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="post" enctype="multipart/form-data" class="nocsrf">
                                      <input type="hidden" name="user_images_action" value="delete" />
                                      <input type="hidden" name="userID" value="<?php echo osc_user_id(); ?>" />
                                      <div class="user-file">
                                          <button class="btn" type="submit" ><i class="ion ion-md-trash"></i> <?php _e('Delete photo', 'san_auto'); ?></button>
                                      </div>
                                  </form>
                              </div>
                          </div>
                        <?php } ?>
                        <div class="step user-step">
                            <form action="<?php echo osc_base_url(true); ?>" method="post">
                                <input type="hidden" name="page" value="user" />
                                <input type="hidden" name="action" value="profile_post" />
                                <fieldset>
                                    <div class="step-row">
                                        <label for="name"><?php _e('Name', 'san_auto'); ?></label>
                                        <?php UserForm::name_text(osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="email"><?php _e('Username', 'san_auto'); ?></label>
                                        <span class="update">
                                            <?php echo osc_user_username(); ?>
                                        </span>
                                    </div>
                                    <div class="step-row">
                                        <label for="email"><?php _e('E-mail', 'san_auto'); ?></label>
                                        <span class="update">
                                            <?php echo osc_user_email(); ?>
                                        </span>
                                    </div>
                                    <div class="step-row">
                                        <label for="user_type"><?php _e('User type', 'san_auto'); ?></label>
                                        <?php UserForm::is_company_select(osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="phoneMobile"><?php _e('Cell phone', 'san_auto'); ?></label>
                                        <?php UserForm::mobile_text(osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="phoneLand"><?php _e('Phone', 'san_auto'); ?></label>
                                        <?php UserForm::phone_land_text(osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="country"><?php _e('Country', 'san_auto'); ?> *</label>
                                        <?php UserForm::country_select(osc_get_countries(), osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="region"><?php _e('Region', 'san_auto'); ?> *</label>
                                        <?php UserForm::region_select(osc_get_regions(), osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="city"><?php _e('City', 'san_auto'); ?> *</label>
                                        <?php UserForm::city_select(osc_get_cities(), osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="city_area"><?php _e('City area', 'san_auto'); ?></label>
                                        <?php UserForm::city_area_text(osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="address"><?php _e('Address', 'san_auto'); ?></label>
                                        <?php UserForm::address_text(osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <label for="webSite"><?php _e('Website', 'san_auto'); ?></label>
                                        <?php UserForm::website_text(osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <?php UserForm::multilanguage_info($locales, osc_user()); ?>
                                    </div>
                                    <div class="step-row">
                                        <button class="btn" type="submit"><?php _e('Update', 'san_auto'); ?></button>
                                        <button id="delete_account" class="btn" type="button"><?php _e('Delete my account', 'san_auto'); ?></button>
                                    </div>
                                    <?php osc_run_hook('user_form'); ?>
                                </fieldset>
                            </form>
                        </div>
                        <div id="dialog-delete-account" title="<?php _e('Delete account', 'san_auto'); ?>" class="has-form-actions hide">
                            <div class="form-horizontal">
                                <div class="step-row">
                                    <p><?php _e('All your listings and alerts will be removed, this action can not be undone.', 'san_auto');?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
        <script type="text/javascript">
            $(function() {
              var customFile = $('[type="file"]');
              jcf.setOptions('File', {
                buttonText: '<?php echo osc_esc_js(__('Choose photo', 'san_auto')); ?>',
                placeholderText: '<?php echo osc_esc_js(__('No photo chosen', 'san_auto')); ?>'

              });
              jcf.replace(customFile);
            });
        </script>
        <?php osc_current_web_theme_path('footer.php'); ?>
    </body>
</html>
