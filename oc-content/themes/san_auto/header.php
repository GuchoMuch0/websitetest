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
	  $breadcrumb = san_auto_breadcrumb('', false, get_breadcrumb_lang());
?>
<div id="modal"></div>
<header>
	<?php if (!osc_is_contact_page()): ?>
		<div class="header-top">
				<div class="wrapper">
					<div class="header-contact">
						<div class="header-us">
							<a href="<?php echo osc_contact_url(); ?>"><?php _e('Contact us', 'san_auto'); ?></a>
							<?php if (osc_get_preference('phone_text', 'san_auto') <> ""): ?>
								<a href="tel:<?= osc_get_preference('phone_text', 'san_auto'); ?>"><i class="ion ion-ios-call"></i><?= osc_get_preference('phone_text', 'san_auto'); ?></a>
							<?php endif; ?>
							<?php if (osc_count_web_enabled_locales() > 1): ?>
								<div class="header-lang">
									<div class="header-menu">
										<span><img src="<?= osc_current_web_theme_url()?>images/lang/<?php echo strtolower(substr(osc_current_user_locale(), 3)); ?>.png" alt="" /> <?php echo strtoupper(substr(osc_current_user_locale(), 0, 2)); ?><i class="ion ion-md-arrow-dropdown"></i></span>
										<div class="header-locals">
											<div class="header-loc-c">
												<?php osc_goto_first_locale(); ?>
												<?php $i = 0;  ?>
												<?php while ( osc_has_web_enabled_locales() ) { ?>
													<div class="header-loc <?php if( $i == 0 ) { echo "first"; } ?>">
														<a id="<?php echo osc_locale_code (); ?>" href="<?php echo osc_change_language_url ( osc_locale_code() ); ?>"><img src="<?= osc_current_web_theme_url()?>images/lang/<?php echo strtolower(substr(osc_locale_code(), 3)); ?>.png" alt="" /><?php echo substr(osc_locale_code(), 0, 2); ?></a>
													</div>
													<?php $i++; ?>
												<?php } ?>
											</div>
										</div>
									</div>
								</div>
							<?php endif; ?>
						</div>
						<div class="header-social">
							<?php if (osc_get_preference('fc_text', 'san_auto') <> ""): ?>
								<a class="fac" target="_blank" href="<?= osc_get_preference('fc_text', 'san_auto'); ?>"><i class="fab fa-facebook-f"></i></a>
							<?php endif; ?>
							<?php if (osc_get_preference('tg_text', 'san_auto') <> ""): ?>
								<a class="telegram" target="_blank" href="<?= osc_get_preference('tg_text', 'san_auto'); ?>"><i class="fab fa-telegram-plane"></i></a>
							<?php endif; ?>
							<?php if (osc_get_preference('tw_text', 'san_auto') <> ""): ?>
								<a class="telegram"  target="_blank" href="<?= osc_get_preference('tw_text', 'san_auto'); ?>"><i class="fab fa-twitter"></i></a>
							<?php endif; ?>
							<?php if (osc_get_preference('pin_text', 'san_auto') <> ""): ?>
								<a class="pinterest"  target="_blank" href="<?= osc_get_preference('pin_text', 'san_auto'); ?>"><i class="fab fa-pinterest-p"></i></a>
							<?php endif; ?>
							<?php if (osc_get_preference('vider_text', 'san_auto') <> ""): ?>
								<a class="viber"  target="_blank" href="<?= osc_get_preference('vider_text', 'san_auto'); ?>"><i class="fab fa-viber"></i></a>
							<?php endif; ?>
							<?php if (osc_get_preference('wt_text', 'san_auto') <> ""): ?>
								<a class="whatsapp"  target="_blank" href="<?= osc_get_preference('wt_text', 'san_auto'); ?>"><i class="fab fa-whatsapp"></i></a>
							<?php endif; ?>
							<?php if (osc_get_preference('ins_text', 'san_auto') <> ""): ?>
								<a class="instagram"  target="_blank" href="<?= osc_get_preference('ins_text', 'san_auto'); ?>"><i class="fab fa-instagram"></i></a>
							<?php endif; ?>
							<?php if (osc_get_preference('vk_text', 'san_auto') <> ""): ?>
								<a class="vk"  target="_blank" href="<?= osc_get_preference('vk_text', 'san_auto'); ?>"><i class="fab fa-vk"></i></a>
							<?php endif; ?>
							<?php if (osc_get_preference('you_text', 'san_auto') <> ""): ?>
								<a class="youtube"  target="_blank" href="<?= osc_get_preference('you_text', 'san_auto'); ?>"><i class="fab fa-youtube"></i></a>
							<?php endif; ?>
						</div>
					</div>

				</div>
		</div>
	<?php endif; ?>
    <div class="header-bottom<?= !osc_is_home_page() ? " cover" : ""; ?><?= osc_is_publish_page() || osc_is_forgot_page() ? " modified" : ""; ?><?= osc_is_ad_page() ? " ad" : ""; ?>"
		<?php if (osc_is_ad_page()): ?>
			    <?php for ( $i = 0; osc_has_item_resources(); $i++ ) { ?>
					    <?php if( $i == 0 ) { ?>
							style="background: url(<?= osc_resource_original_url() ?>) center center/cover fixed no-repeat"
						<?php } ?>
				<?php } ?>
		<?php endif; // close div header-bottom ?>>
        <?php osc_reset_resources(); ?>
        <div class="wrapper">
            <div class="header">
                <div class="header-left">
					<?php if (!osc_is_login_page()): ?>
						<div class="only-mobile mobile-left-menu">
							<a href="#" class="menu-burger">
								<span></span>
								<span></span>
								<span></span>
							</a>
						</div>
					<?php endif; ?>
                    <div class="header-logo">
                        <a id="logo" href="<?php echo osc_base_url(); ?>"><?php echo logo_header(); ?></a>
                    </div>
					<?php if (!osc_is_login_page()): ?>
						<div class="only-mobile mobile-right-menu<?= osc_is_search_page() ? ' is_search' : ''; ?>">
							<i class="ion ion-ios-search"></i>
						</div>
					<?php endif; ?>
                    <?php if (!osc_is_search_page()): ?>
                        <div class="header-search only-all">
                            <form action="<?php echo osc_base_url(true); ?>" method="get" class="nocsrf">
                                <input type="hidden" name="page" value="search"/>
                                <div class="header-form">
                                    <button class="btn "type="submit" name="button"><i class="flaticon-search"></i></button>
                                    <input type="text" name="sPattern" autocomplete="off" value="<?php echo osc_esc_html(osc_search_pattern()); ?>" placeholder="<?php echo osc_esc_html(__(osc_get_preference('keyword_placeholder', 'san_auto'), 'san_auto')); ?>" />
                                </div>
                            </form>
                        </div>
                    <?php endif; ?>
                </div>
                <div class="header-right only-all">
                    <div class="header-sub">
                        <div class="header-post">
                            <?php if (osc_users_enabled() || ( !osc_users_enabled() && !osc_reg_user_post() )): ?>
                                <a class="header-link<?= osc_is_publish_page() ? " active" : "";?>" href="<?php echo osc_item_post_url(); ?>"><i class="flaticon-car5"></i> <?php _e("Publish", 'san_auto');?></a>
                            <?php endif; ?>
                        </div>
                        <div class="header-user<?= osc_is_web_user_logged_in() ? " logged" : ""; ?>">
                            <?php if (osc_users_enabled()): ?>
                                <?php if (osc_is_web_user_logged_in()): ?>
                                    <div class="header-menu header-dashboard">
                                        <?php if (function_exists('watchlist')): ?>
                                            <a class="header-menu__favorite" href="<?= osc_route_url('watchlist-user', array('iPage' => null));?>"><i class="ion ion-md-heart-empty"></i> <span class="count"><?= countFavoriteAuto(); ?></span> </a>
                                        <?php endif; ?>

                                        <a href="<?php echo osc_user_dashboard_url(); ?>" class="header-user">
                                            <div class="header-avatar">
                                                <?php user_avatar_show(osc_logged_user_id()); ?>
                                            </div>
                                            <div class="header-name"><?= osc_logged_user_name(); ?></div>
                                        </a>

                                        <div class="header-menu">
                                            <div class="header-menu__burg"><i class="ion ion-ios-menu"></i>
                                                <div class="header-menu-list">
                                                    <div class="header-nav">
                                                      <a class="header-nav-btns" href="<?php echo osc_user_list_items_url(); ?>"><i class="ion ion-ios-list"></i><?php _e('My listings', 'san_auto'); ?></a>
                                                      <a class="header-nav-btns" href="<?php echo osc_user_alerts_url(); ?>"><i class="ion ion-ios-notifications-outline"></i> <?php _e('My alerts', 'san_auto'); ?></a>
                                                      <a class="header-nav-btns" href="<?php echo osc_change_user_password_url(); ?>"><i class="ion ion-ios-key"></i><?php _e('Change password', 'san_auto'); ?></a>
                                                      <a class="header-nav-btns" href="<?php echo osc_change_user_email_url(); ?>"><i class="ion ion-ios-at"></i> <?php _e('Change email', 'san_auto'); ?></a>
                                                      <a class="header-nav-btns logout" href="<?php echo osc_user_logout_url(); ?>"><i class="ion ion-md-power"></i> <?php _e('Logout', 'san_auto'); ?></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php else: ?>
                                    <div class="header-menu">
                                        <a class="header-link" href="<?php echo osc_user_login_url(); ?>"><i class="flaticon-login"></i> <?php _e('Log In', 'san_auto'); ?> </a>
                                    </div>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<?php if (osc_is_home_page()): ?>
    <section class="search-main<?= san_auto_default_image() == 'image' ? ' header-cover' : '' ; ?>"<?= san_auto_default_image() == 'image' ? ' style="background-image: url(' . osc_current_web_theme_url('images/header.jpg?v=' . date('YmdHis')) . ')"' : '' ; ?>>
        <?php if (san_auto_default_image() == 'slider'): ?>
            <?php osc_run_hook('responsive_slider'); ?>
        <?php else: ?>
            <div class="wrapper">
                <div class="search-image">
                    <div class="search-text">
                        <?php if (san_auto_default_image() == 'image'): ?>
                            <h1><?php echo osc_get_preference('h1_text', 'san_auto'); ?></h1>
                            <h4><?php echo osc_get_preference('h2_text', 'san_auto'); ?></h4>
							<script type="text/javascript">
								$(document).find('.search-text h1').addClass('focus-in-expand-fwd');
								$(document).find('.search-text h4').addClass('focus-in-contract');
							</script>
                        <?php endif; ?>
                    </div>
                    <?php osc_current_web_theme_path('header-search.php'); ?>
                </div>
            </div>
        <?php endif; ?>
    </section>
<?php endif; ?>

<section class="title-box">
    <div class="wrapper">
        <?= title_pages_san_auto(); ?>
        <?php if (!osc_is_login_page() && !osc_is_publish_page()): ?>
				<?php if( $breadcrumb !== '') { ?><div><?php echo $breadcrumb; ?></div><?php } ?>
        <?php endif; ?>
    </div>
</section>
<section>
	<div class="wrapper">
		<div class="forcemessages-inline">
			<?php osc_show_flash_message(); ?>
		</div>
	</div>
</section>
<?php if (!osc_is_home_page()): ?>
<?php if(osc_get_preference('hide_ads', 'san_auto') !== '0') { ?>
    <?php if( osc_get_preference('header-728x90', 'san_auto') != '') { ?>
        <div class="figure-rek">
            <div class="i728-90">
                <?php echo osc_get_preference('header-728x90', 'san_auto'); ?>
            </div>
        </div>
    <?php } ?>
<?php } ?>
<?php endif; ?>
