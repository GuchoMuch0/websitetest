<?php
define( 'ABS_PATH', dirname( dirname( dirname( dirname( __FILE__ ) ) ) ) . '/' ) ;
require_once( ABS_PATH . 'oc-load.php' ) ;
require_once( osc_content_path() . 'plugins/seo_plugin/sitemap.php' ) ;

seo_sitemap_generator();
?>