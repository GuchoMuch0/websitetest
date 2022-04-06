<?php
/*
	Plugin Name: Responsive Slides
	Plugin URI: http://www.osclass.org/
	Description: Responsive Slides is a tiny jQuery plugin that creates a responsive slider and works with wide range of browsers including all IE versions from IE6 and up.
	Version: 1.5.1
	Author: FrinWeb modified by san-osclass.com
	Author URI: http://www.frinweb.com
	Short Name: responsive_slides
	Plugin update URI: responsive-slides
*/
require_once( osc_plugins_path() . 'responsive_slides/ModelSlides.php' ) ;

function rslides_install() {
	ModelSlides::newInstance()->import('responsive_slides/struct.sql') ;
	$aFields = array(
	's_internal_name' => 'responsive_slides'
	);
	osc_set_preference('width', '0','responsive_slides','STRING');
	osc_set_preference('height', '600','responsive_slides','STRING');
	osc_set_preference('caption', '1','responsive_slides','BOOLEAN');
	osc_set_preference('description', '1','responsive_slides','BOOLEAN');
	osc_set_preference('link', '0','responsive_slides','BOOLEAN');
	osc_set_preference('openin', '0','responsive_slides','BOOLEAN');
	osc_set_preference('auto', '1','responsive_slides','BOOLEAN');
	osc_set_preference('pager', '0','responsive_slides','BOOLEAN');
	osc_set_preference('navigation', '1','responsive_slides','BOOLEAN');
	osc_set_preference('speed', '500','responsive_slides','STRING');
}

function rslides_uninstall() {
	try {
		Page::newInstance()->deleteByInternalName('responsive_slides');
		ModelSlides::newInstance()->uninstall();
	} catch (Exception $e) {
		echo $e->getMessage();
	}
	osc_delete_preference('width','responsive_slides');
	osc_delete_preference('height','responsive_slides');
	osc_delete_preference('caption','responsive_slides');
	osc_delete_preference('description','responsive_slides');
	osc_delete_preference('link','responsive_slides');
	osc_delete_preference('openin','responsive_slides');
	osc_delete_preference('auto','responsive_slides');
	osc_delete_preference('pager','responsive_slides');
	osc_delete_preference('navigation','responsive_slides');
	osc_delete_preference('speed','responsive_slides');
}

function rslides_admin_menu() {
	echo '<h3><a href="#">'.__('Responsive Slides','responsive_slides').'</a></h3>
	<ul>
		<li><a href="'.osc_admin_render_plugin_url("responsive_slides/admin/create.php").'">'. __('Create Slide', 'responsive_slides').'</a></li>
		<li><a href="'.osc_admin_render_plugin_url("responsive_slides/admin/list.php").'">'. __('Manage Slides', 'responsive_slides').'</a></li>
		<li><a href="'.osc_admin_render_plugin_url("responsive_slides/admin/settings.php").'">'. __('Settings', 'responsive_slides').'</a></li>
		<li><a href="'.osc_admin_render_plugin_url("responsive_slides/admin/help.php").'">'. __('Help', 'responsive_slides').'</a></li>
	</ul>';
}

function getSliderWidth() {
	return(osc_get_preference('width', 'responsive_slides')) ;
}
function getSliderHeight() {
	return(osc_get_preference('height', 'responsive_slides')) ;
}
function getSliderCaption() {
	return(osc_get_preference('caption', 'responsive_slides')) ;
}
function getSliderDescription() {
	return(osc_get_preference('description', 'responsive_slides')) ;
}
function getSliderLink() {
	return(osc_get_preference('link', 'responsive_slides')) ;
}
function getSliderOpenIn() {
	return(osc_get_preference('openin', 'responsive_slides')) ;
}
function getSliderAuto() {
	return(osc_get_preference('auto', 'responsive_slides')) ;
}
function getSliderSpeed() {
	return(osc_get_preference('speed', 'responsive_slides')) ;
}
function getSliderNavigation() {
	return(osc_get_preference('navigation', 'responsive_slides')) ;
}




function responsive_slides() { ?>
	<div class="slider" style="min-height:<?= getSliderHeight(); ?>px;">
			<ul class="slides" id="slides">
			<?php $slides = ModelSlides::newInstance()->getSlides(); ?>
			<?php foreach($slides as $slide) { ?>
				<li class="slider-item">
					<?php if(getSliderLink() ==1){ ?>
						<a class="slider-link" href="<?php echo $slide['link'];?>" <?php if(getSliderOpenIn() ==1) { echo 'target="_blank"';  }  ?>>
							<img data-lazy="<?php echo osc_base_url().'oc-content/plugins/responsive_slides/media/'.$slide['uniqname']; ?>" alt="<?php echo osc_esc_html($slide['imagename']); ?>">
						</a>
					<?php } else {?>
						<img data-lazy="<?php echo osc_base_url().'oc-content/plugins/responsive_slides/media/'.$slide['uniqname']; ?>" alt="<?php echo osc_esc_html($slide['imagename']); ?>">
					<?php } ?>
					<?php if(getSliderCaption() == 1){ ?>
						<div class="slider-name">
							<div class="wrapper">
									<div class="search-text">
										<h1><?php echo $slide['caption']; ?></h1>
										<?php if($slide['description'] != null){ ?>
											<h4><?php echo $slide['description']; ?></h4>
										<?php } ?>
									</div>
							</div>
						</div>
					<?php } ?>
				</li>
				<?php } ?>
			</ul>
            <?php if (osc_current_web_theme() == 'modern'): ?>
				<div class="search-slider">
					<div class="wrapper">
						<?php osc_current_web_theme_path('header-search.php'); ?>
					</div>
				</div>
			<?php endif; ?>
	</div>
<?php }

function rslides_head() {?>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<?php if (osc_is_home_page()): ?>
		<style media="screen">
			.slick-slide img{
				<?php if(getSliderHeight() == 0){ echo 'height: 100%;'; } else { echo 'height: '.getSliderHeight().'px'; }?>;
				<?php if(getSliderWidth() == 0){ echo 'width: 100%;'; } else { echo 'width: '.getSliderWidth().'px'; } ?>;
				-o-object-fit: cover;
				   object-fit: cover;
				-o-object-position: center;
				   object-position: center;
			}
			<?php if (osc_current_web_theme() == 'modern'):
				$heght = 100 - 15;
				?>
				.slider-name{
					top: calc(<?php if (getSliderHeight() !== 0): ?><?= getSliderHeight(); ?>px - <?= $heght;?>%<?php endif; ?>);
				}
				.search-slider{
					bottom: calc(<?php if (getSliderHeight() !== 0): ?><?= getSliderHeight(); ?>px + -<?= $heght + '5';?>%<?php endif; ?>);
				}
			<?php endif; ?>
		</style>
	<?php endif; ?>
	<?php
}
function rslides_js_Head() {?>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script type='text/javascript'>
		$(document).ready(function() {
			$("#slides").slick({
				infinite: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				<?=  getSliderNavigation() == 1 ? "dots: true,": "" ;?>
				speed: <?php echo getSliderSpeed(); ?>,
				prevArrow: false,
				nextArrow: false,
	            lazyLoad: 'ondemand',
				fade: false,
				<?=  getSliderAuto() == 1 ? "autoplay: true,autoplaySpeed: 2000": "" ;?>
			});
		});
	</script>
<?php }

osc_register_plugin(osc_plugin_path(__FILE__), 'rslides_install');
osc_add_hook(osc_plugin_path(__FILE__)."_uninstall", 'rslides_uninstall');

//Display hook
osc_add_hook('responsive_slider', 'responsive_slides');

//Header hook
osc_add_hook('header', 'rslides_head');
osc_add_hook('header', 'rslides_js_Head', 10);

// Admin menu
osc_add_hook('admin_menu', 'rslides_admin_menu', 6);
?>
