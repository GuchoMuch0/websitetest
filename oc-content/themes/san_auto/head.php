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

    if(class_exists('ModelCars')) {
         function script_car() {
             $minYear = ModelCars::newInstance()->minYearsql();
             $maxYear = ModelCars::newInstance()->maxYearsql();
             ?>
             <script type="text/javascript">
                var minYear = '<?php echo osc_esc_js($minYear); ?>';
                var maxYear = '<?php echo osc_esc_js($maxYear); ?>';
             </script>
         <?php }
         osc_add_hook('header', 'script_car');
    }



?>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title><?php echo meta_title(); ?></title>
    <meta name="title" content="<?php echo osc_esc_html(meta_title()); ?>" />
    <?php if( meta_description() != '' ) { ?>
        <meta name="description" content="<?php echo osc_esc_html(meta_description()); ?>" />
    <?php } ?>
    <?php if( function_exists('meta_keywords') ) { ?>
        <?php if( meta_keywords() != '' ) { ?>
            <meta name="keywords" content="<?php echo osc_esc_html(meta_keywords()); ?>" />
        <?php } ?>
    <?php } ?>
    <?php if( osc_get_canonical() != '' ) { ?>
        <link rel="canonical" href="<?php echo osc_get_canonical(); ?>"/>
    <?php } ?>
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="Fri, Jan 01 1970 00:00:00 GMT" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <script type="text/javascript">
        var fileDefaultText = '<?php echo osc_esc_js( __('No file selected', 'san_auto') ); ?>';
        var fileBtnText     = '<?php echo osc_esc_js( __('Choose File', 'san_auto') ); ?>';
    </script>
    <?php if (osc_is_login_page()): ?>
        <script type="text/javascript">
            var logText = '<?php echo osc_esc_js(__('Register', 'san_auto')); ?>';
            var regText= '<?php echo osc_esc_js(__('Sign in', 'san_auto')); ?>';

            var logWelcText = '<?php echo osc_esc_js(__('Hello, Friend!', 'san_auto')); ?>';
            var regWelcText = '<?php echo osc_esc_js(__('Welcome Back!', 'san_auto')); ?>';

            var logsubcText = '<?php echo osc_esc_js(__('Enter you personal info', 'san_auto')); ?>';
            var regsubcText = '<?php echo osc_esc_js(__('To manage your items, please log in.', 'san_auto')); ?>';
        </script>
    <?php endif; ?>
<?php
osc_enqueue_style('flaticon', osc_current_web_theme_url('fonts/Flaticon/flaticon.css?v=' . date('YmdHis')));
osc_enqueue_style('style', osc_current_web_theme_url('css/style.css?v=' . date('YmdHis')));
osc_enqueue_style('anim', osc_current_web_theme_url('css/anim.css?v=' . date('YmdHis')));
osc_enqueue_style('media', osc_current_web_theme_url('css/media.css?v=' . date('YmdHis')));
//osc_enqueue_style('fontawesome', osc_current_web_theme_url('css/fontawesome.css?v=' . date('YmdHis')));

osc_enqueue_style('jquery-ui-datepicker', osc_assets_url('css/jquery-ui/jquery-ui.css'));
osc_enqueue_style('fancybox-css', osc_current_web_theme_js_url('fancybox/jquery.fancybox.min.css'));

osc_register_script('global', osc_current_web_theme_js_url('global.js?v=' . date('YmdHis')));
osc_register_script('fancybox', osc_current_web_theme_js_url('fancybox/jquery.fancybox.js?v=' . date('YmdHis')), array('jquery'));
osc_register_script('validate', osc_current_web_theme_js_url('jquery.validate.min.js'), array('jquery'));

if (osc_is_ad_page()) {
    osc_register_script('fancybox', osc_current_web_theme_js_url('fancybox/jquery.fancybox.min.js'), array('jquery'));
}

osc_register_script('jquery.uniform', osc_current_web_theme_js_url('jquery.uniform.js?v=' . date('YmdHis')));
osc_register_script('tabber-minimized', osc_current_web_theme_js_url('tabber-minimized.js?v=' . date('YmdHis')));

osc_register_script('jsf-js', osc_current_web_theme_js_url('jsf/jcf.js'), 'jquery');
osc_register_script('jsf-select', osc_current_web_theme_js_url('jsf/jcf.select.js'), 'jquery');
osc_register_script('jsf-file', osc_current_web_theme_js_url('jsf/jcf.file.js'), 'jquery');
osc_register_script('jsf-scroll', osc_current_web_theme_js_url('jsf/jcf.scrollable.js'), 'jquery');


osc_enqueue_script('jsf-js');
osc_enqueue_script('jsf-select');
osc_enqueue_script('jsf-file');
osc_enqueue_script('jsf-scroll');
osc_enqueue_style('jsf-css', osc_current_web_theme_url('js/jsf/jcf.css'));


osc_enqueue_script('jquery');
osc_enqueue_script('jquery-ui');
osc_enqueue_script('global');
osc_enqueue_script('jquery.uniform');
osc_enqueue_script('tabber-minimized');

if (osc_is_ad_page()) {
    osc_enqueue_script('fancybox');
}

if(!osc_is_search_page() && !osc_is_home_page()) {
  osc_enqueue_script('validate');
}

osc_run_hook('header');
FieldForm::i18n_datePicker();

?>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" crossorigin="anonymous">
<link href="//unpkg.com/ionicons@4.5.5/dist/css/ionicons.min.css" rel="stylesheet">
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
