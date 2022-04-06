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

    define('SAN_AUTO_VERSION', '1.0.0');

    osc_enqueue_script('php-date');

    function mobileFixScript(){ ?>
            <script type="text/javascript">
                 $(document).on('resize',  function(){
                     if (($(window).width()) < 767) {
                         <?php if (osc_is_search_page()): ?>
                            $(document).find('.search-sidebar.only-all').remove();
                         <?php elseif(osc_is_home_page()): ?>
                            $(document).find('.search-atributes').remove();
                         <?php endif; ?>
                    }
                 });
                if (($(window).width()) < 767) {
                    <?php if (osc_is_search_page()): ?>
                       $(document).find('.search-sidebar.only-all').remove();
                    <?php elseif(osc_is_home_page()): ?>
                       $(document).find('.search-atributes').remove();
                    <?php endif; ?>
                }
            </script>
    <?php
    }
    osc_add_hook('footer', 'mobileFixScript');

    //Count favorite
    if (function_exists('watchlist')){
            function countFavoriteAuto() {
        		$count = 0;
        		$conn = getConnection();
                $count =  $conn->osc_dbFetchValue("SELECT COUNT(fk_i_item_id) FROM %st_item_watchlist WHERE fk_i_user_id = '%d'" , DB_TABLE_PREFIX, osc_logged_user_id());
        		return $count;
        	}
    }

    function searchMax(){
        if (!is_numeric(osc_search_price_max()) || osc_search_price_max() == "" ||  osc_search_price_max() < 0 ) {
            return maxPricesql();
        } else {
            return osc_search_price_max();
        }
    }

    function searchMin(){
        if (!is_numeric(osc_search_price_min()) || osc_search_price_min() == "" ||  osc_search_price_min() < 0 ) {
            return 0;
        } else {
            return osc_search_price_min();
        }
    }

    function yearhMin(){
        $minYear = ModelCars::newInstance()->minYearsql();
        if (Params::getParam('min_year') == "" ||  Params::getParam('min_year') < 0 || is_nan(Params::getParam('min_year'))) {
            return $minYear;
        } else {
            return Params::getParam('min_year');
        }
    }

    function yearhMax(){
        $maxYear = ModelCars::newInstance()->maxYearsql();
        if (Params::getParam('max_year') == "" ||  Params::getParam('max_year') < 0 || is_nan(Params::getParam('max_year'))) {
            return $maxYear;
        } else {
            return Params::getParam('max_year');
        }
    }

    function title_type_user(){
        if(Params::getParam('sCompany') == '' or Params::getParam('sCompany') == null) {
            return  _e('All vehicles', 'san_auto');
        } elseif(Params::getParam('sCompany') == '0'){
            return  _e('Private Sellers', 'san_auto');
        } elseif(Params::getParam('sCompany') == '1'){
            return  _e('Auto Dealers', 'san_auto');
        }
    }


    function theme_color(){
        if (osc_get_preference('color', 'san_auto') == 'blue') {
            ?>
            <style media="screen">
                .header-bottom.cover, .header-bottom.cover.ad, .btn, .btn:hover, .btn:active, .btn:focus, .header-link, .footer-follow a, .search-sort-main .open_sort, .item-list .item-more a, .search-line, .jcf-list-box .jcf-selected, .jcf-select-drop .jcf-hover, .item-contact a, .users-edit a, .user-right, .user-form button{
                    background-color: #03A9F4!important;
                }
                .btn{
                    color: #fff!important;
                }
                .header-link, .item-page .header-form input, input[type=checkbox]:checked, input[type=radio]:checked, .btn, .search-radio .atributes-type.checked,  .search-col .jcf-select.jcf-focus, .search-col input[type="text"]:focus, .search-col input[type="text"]:active{
                    border-color:  #03A9F4!important;
                }
                .item-list .item-autor-name a, .step label a:hover, .step label a:active, .step-check a:hover, .step-check a:active, .user-help a:hover, .user-help a:active, .make-list-left i, .make-list-right i, .prem-right i, .prem-left i, .main-title span, .search-grid a:hover, .search-grid a:active, .search-grid a.active, ul.breadcrumbs li a, .search-input.select-price .input-range i, .item-content h2, .step-title h2, .step-help-title, .item-name-link, .item-display-cont, .users_login .user_left h1{
                    color: #03A9F4!important;
                }
                .user-input.focus:after,.item-report:hover .item-report-label, input[type=checkbox]:checked, input[type=radio]:checked, .make-item:hover, .make-item:active, .make-item:focus, .item-gallery .item-back-btn, .jcf-scrollbar-vertical .jcf-scrollbar-handle, .ui-slider-handle:after, .atributes-col .ui-state-default, .atributes-col .ui-widget-content .ui-state-default, .atributes-col .ui-widget-header .ui-state-default, .atributes-col .ui-widget-header, .item-image .item-det-label, .search-rowing .ui-state-default, .search-rowing .ui-widget-content .ui-state-default, .search-rowing  .ui-widget-header .ui-state-default, .search-rowing .ui-slider .ui-slider-range, .search-radio .atributes-type.checked::after, .paginate span.searchPaginationSelected, .paginate a.searchPaginationSelected{
                    background: #03A9F4!important;
                }
            </style>
            <?php
        } elseif (osc_get_preference('color', 'san_auto') == 'pink') {
            ?>
            <style media="screen">
                .header-bottom.cover, .header-bottom.cover.ad, .btn, .btn:hover, .btn:active, .btn:focus, .header-link, .footer-follow a, .search-sort-main .open_sort, .item-list .item-more a, .search-line, .jcf-list-box .jcf-selected, .jcf-select-drop .jcf-hover, .item-contact a, .users-edit a, .user-right, .user-form button{
                    background-color: #E91E63!important;
                }
                .btn{
                    color: #fff!important;
                }
                .header-link, .item-page .header-form input, input[type=checkbox]:checked, input[type=radio]:checked, .btn, .search-radio .atributes-type.checked,  .search-col .jcf-select.jcf-focus, .search-col input[type="text"]:focus, .search-col input[type="text"]:active{
                    border-color:  #E91E63!important;
                }
                .item-list .item-autor-name a, .step label a:hover, .step label a:active, .step-check a:hover, .step-check a:active, .user-help a:hover, .user-help a:active, .make-list-left i, .make-list-right i, .prem-right i, .prem-left i, .main-title span, .search-grid a:hover, .search-grid a:active, .search-grid a.active, ul.breadcrumbs li a, .search-input.select-price .input-range i, .item-content h2, .step-title h2, .step-help-title, .item-name-link, .item-display-cont, .users_login .user_left h1{
                    color: #E91E63!important;
                }
                .user-input.focus:after,.item-report:hover .item-report-label, input[type=checkbox]:checked, input[type=radio]:checked, .make-item:hover, .make-item:active, .make-item:focus, .item-gallery .item-back-btn, .jcf-scrollbar-vertical .jcf-scrollbar-handle, .ui-slider-handle:after, .atributes-col .ui-state-default, .atributes-col .ui-widget-content .ui-state-default, .atributes-col .ui-widget-header .ui-state-default, .atributes-col .ui-widget-header, .item-image .item-det-label, .search-rowing .ui-state-default, .search-rowing .ui-widget-content .ui-state-default, .search-rowing  .ui-widget-header .ui-state-default, .search-rowing .ui-slider .ui-slider-range, .search-radio .atributes-type.checked::after, .paginate span.searchPaginationSelected, .paginate a.searchPaginationSelected{
                    background: #E91E63!important;
                }
            </style>
            <?php
        } elseif (osc_get_preference('color', 'san_auto') == 'violet') {
            ?>
            <style media="screen">
                .header-bottom.cover, .header-bottom.cover.ad, .btn, .btn:hover, .btn:active, .btn:focus, .header-link, .footer-follow a, .search-sort-main .open_sort, .item-list .item-more a, .search-line, .jcf-list-box .jcf-selected, .jcf-select-drop .jcf-hover, .item-contact a, .users-edit a, .user-right, .user-form button{
                    background-color: #673AB7!important;
                }
                .btn{
                    color: #fff!important;
                }
                .header-link, .item-page .header-form input, input[type=checkbox]:checked, input[type=radio]:checked, .btn, .search-radio .atributes-type.checked,  .search-col .jcf-select.jcf-focus, .search-col input[type="text"]:focus, .search-col input[type="text"]:active{
                    border-color:  #673AB7!important;
                }
                .item-list .item-autor-name a, .step label a:hover, .step label a:active, .step-check a:hover, .step-check a:active, .user-help a:hover, .user-help a:active, .make-list-left i, .make-list-right i, .prem-right i, .prem-left i, .main-title span, .search-grid a:hover, .search-grid a:active, .search-grid a.active, ul.breadcrumbs li a, .search-input.select-price .input-range i, .item-content h2, .step-title h2, .step-help-title, .item-name-link, .item-display-cont, .users_login .user_left h1{
                    color: #673AB7!important;
                }
                .user-input.focus:after,.item-report:hover .item-report-label, input[type=checkbox]:checked, input[type=radio]:checked, .make-item:hover, .make-item:active, .make-item:focus, .item-gallery .item-back-btn, .jcf-scrollbar-vertical .jcf-scrollbar-handle, .ui-slider-handle:after, .atributes-col .ui-state-default, .atributes-col .ui-widget-content .ui-state-default, .atributes-col .ui-widget-header .ui-state-default, .atributes-col .ui-widget-header, .item-image .item-det-label, .search-rowing .ui-state-default, .search-rowing .ui-widget-content .ui-state-default, .search-rowing  .ui-widget-header .ui-state-default, .search-rowing .ui-slider .ui-slider-range, .search-radio .atributes-type.checked::after, .paginate span.searchPaginationSelected, .paginate a.searchPaginationSelected{
                    background: #673AB7!important;
                }
            </style>
            <?php
        } elseif(osc_get_preference('color', 'san_auto') == 'custom') {
            ?>
            <style media="screen">
                .header-bottom.cover, .header-bottom.cover.ad, .btn, .btn:hover, .btn:active, .btn:focus, .header-link, .footer-follow a, .search-sort-main .open_sort, .item-list .item-more a, .search-line, .jcf-list-box .jcf-selected, .jcf-select-drop .jcf-hover, .item-contact a, .users-edit a, .user-right, .user-form button{
                    background-color: <?= osc_get_preference('text_color', 'san_auto')  ?>!important;
                }
                .btn{
                    color: #fff!important;
                }
                .header-link, .item-page .header-form input, input[type=checkbox]:checked, input[type=radio]:checked, .btn, .search-radio .atributes-type.checked,  .search-col .jcf-select.jcf-focus, .search-col input[type="text"]:focus, .search-col input[type="text"]:active{
                    border-color:  <?= osc_get_preference('text_color', 'san_auto')  ?>!important;
                }
                .item-list .item-autor-name a, .step label a:hover, .step label a:active, .step-check a:hover, .step-check a:active, .user-help a:hover, .user-help a:active, .make-list-left i, .make-list-right i, .prem-right i, .prem-left i, .main-title span, .search-grid a:hover, .search-grid a:active, .search-grid a.active, ul.breadcrumbs li a, .search-input.select-price .input-range i, .item-content h2, .step-title h2, .step-help-title, .item-name-link, .item-display-cont, .users_login .user_left h1{
                    color: #673AB7!important;
                }
                .user-input.focus:after,.item-report:hover .item-report-label, input[type=checkbox]:checked, input[type=radio]:checked, .make-item:hover, .make-item:active, .make-item:focus, .item-gallery .item-back-btn, .jcf-scrollbar-vertical .jcf-scrollbar-handle, .ui-slider-handle:after, .atributes-col .ui-state-default, .atributes-col .ui-widget-content .ui-state-default, .atributes-col .ui-widget-header .ui-state-default, .atributes-col .ui-widget-header, .item-image .item-det-label, .search-rowing .ui-state-default, .search-rowing .ui-widget-content .ui-state-default, .search-rowing  .ui-widget-header .ui-state-default, .search-rowing .ui-slider .ui-slider-range, .search-radio .atributes-type.checked::after, .paginate span.searchPaginationSelected, .paginate a.searchPaginationSelected{
                    background: <?= osc_get_preference('text_color', 'san_auto')  ?>!important;
                }
            </style>
            <?php
        }
    }
    osc_add_hook('header', 'theme_color');


    function san_auto_most_viewed($limit = 10){
		$Mviewed = Item::newInstance();
		$viewed = Search::newInstance();
		$viewed->dao->select();
		$viewed->dao->from(DB_TABLE_PREFIX . 't_item i, '.DB_TABLE_PREFIX.'t_item_location l, '.DB_TABLE_PREFIX.'t_item_stats s');
		$viewed->dao->where('l.fk_i_item_id = i.pk_i_id AND s.fk_i_item_id = i.pk_i_id');
		$viewed->dao->where('i.b_enabled', 1);
		$viewed->dao->where('i.b_active', 1);
		$viewed->dao->where('i.b_spam', 0);
		$viewed->dao->groupBy('s.fk_i_item_id');
		$viewed->dao->orderBy('SUM(s.i_num_views)', 'DESC');
	    $viewed->dao->limit($limit);
	    $result = $viewed->dao->get();
	    if($result == false) {
	        return array();
	      }
	    $items  = $result->result();
	    return $Mviewed->extendData($items);

	}

	function san_auto_show_most_viewed(){
		$countPop = osc_get_preference('pop_count', 'san_auto');
		$mostViewedAds = san_auto_most_viewed($countPop);
		View::newInstance()->_exportVariableToView('items', $mostViewedAds);
		if(osc_count_items() > 0) { ?>
			<h2 class="main-title"><span><?php _e('Popular', 'san_auto'); ?> </span><?php _e('cars', 'san_auto'); ?></h2>
			<div class="item-gallery">
				<?php while(osc_has_items()){
				      draw_item_san_auto('gallery', false, true);
				 } ?>
	 		</div>
            <a class="prem-left" href="#"><i class="ion ion-ios-arrow-back"></i></a>
            <a class="prem-right" href="#"><i class="ion ion-ios-arrow-forward"></i></a>
            <script type="text/javascript">
                $('#pop .item-gallery').slick({
                    <?php if (osc_count_items() > 4): ?>
                        slidesToShow: 4,
                    <?php else: ?>
                        slidesToShow: <?= osc_count_items(); ?>,
                    <?php endif; ?>
                    slidesToScroll: 2,
                    dots: false,
                    arrows: true,
                    lazyLoad: 'ondemand',
                    prevArrow: $('#pop .prem-left'),
                    nextArrow: $('#pop .prem-right'),
                    //autoplay: true,// admin
                    autoplaySpeed: 2000,
                    responsive: [
                        {
                       breakpoint: 1024,
                       settings: {
                         slidesToShow: 3,
                          dots: true
                       }
                       },
                      {
                        breakpoint: 768,
                        settings: {
                          slidesToShow: 1,
                          slidesToScroll: 1,
                          fade: true,
                          dots: true,
                          arrows: false
                        }
                      }
                    ]
                });
            </script>
		<? } osc_reset_items();
	}
    osc_add_hook('main_popular', 'san_auto_show_most_viewed');

    function san_auto_admin_load_scripts(){
		osc_register_script('admin', osc_current_web_theme_url('admin/js/admin.js?v=' . date('YmdHis')), 'jquery');
        osc_register_script('jscolor', osc_current_web_theme_url('admin/js/jscolor/jscolor.js?v=' . date('YmdHis')), 'jquery');
        osc_enqueue_script('jscolor');
		osc_enqueue_script('admin');
		osc_enqueue_style('admin/css/style.css', osc_current_web_theme_url('admin/css/style.css?v=' . date('YmdHis')));
	}
	osc_add_hook('init_admin', 'san_auto_admin_load_scripts');

    function san_auto_false_404() {
        if (!Search::newInstance()->count()) header('HTTP/1.1 200 Ok');
    }
    osc_add_hook("after_search", "san_auto_false_404" );

    if (san_auto_is_fineuploader()) {
        if (!OC_ADMIN) {
            osc_enqueue_style('fine-uploader-css', osc_assets_url('js/fineuploader/fineuploader.css'));
        }
        osc_enqueue_script('jquery-fineuploader');
    }

    function san_auto_is_fineuploader() {
        return Scripts::newInstance()->registered['jquery-fineuploader'] && method_exists('ItemForm', 'ajax_photos');
    }

    if (function_exists('osc_admin_menu_appearance')) {
        osc_admin_menu_appearance(__('Header logo', 'san_auto'), osc_admin_render_theme_url('oc-content/themes/san_auto/admin/header-logo.php'), 'header_san_auto');
        osc_admin_menu_appearance(__('Footer logo', 'san_auto'), osc_admin_render_theme_url('oc-content/themes/san_auto/admin/footer-logo.php'), 'footer_san_auto');
        osc_admin_menu_appearance(__('Theme settings', 'san_auto'), osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'), 'settings_san_auto');
    } else {
        function san_auto_admin_menu() {
            echo '<h3><a href="#">' . __('Auto theme', 'san_auto') . '</a></h3>
                <ul>
                    <li><a href="' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/header-logo.php') . '">&raquo; ' . __('Header logo', 'san_auto') . '</a></li>
                    <li><a href="' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/footer-logo.php') . '">&raquo; ' . __('Footer logo', 'san_auto') . '</a></li>
                    <li><a href="' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php') . '">&raquo; ' . __('Theme settings', 'san_auto') . '</a></li>

                </ul>';
        }
        osc_add_hook('admin_menu', 'san_auto_admin_menu');
    }

    function osc_private_user_menu_san_auto($options) {
        $options = osc_apply_filter('user_menu_filter', $options);
        $url = "";
        $url = 'http' . ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') ? 's' : '') . '://';
        $url = $url . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];

        echo '<ul class="user_menu">';
        $var_l = count($options);
        for($var_o = 0; $var_o < ($var_l-1); $var_o++) {
            $active = "";
            if ($url === $options[$var_o]['url']) {
                $active = ' active';
            }
            echo '<li class="' . $options[$var_o]['class'] . $active .'"><a href="' . $options[$var_o]['url'] . '" class="user-link"><i class="' . $options[$var_o]['ico'] . '"></i><span>' . $options[$var_o]['name'] . '</span></a></li>';
        }
        osc_run_hook('user_menu');
        echo '<li class="' . $options[$var_l-1]['class'] . '" ><a href="' . $options[$var_l-1]['url'] . '" class="user-link"><i class="' . $options[$var_l-1]['ico'] . '"></i><span>' . $options[$var_l-1]['name'] . '</span></a></li>';
        echo '</ul>';
    }

    if( !function_exists('get_user_menu') ) {
        function get_user_menu() {
            $options   = array();
            $options[] = array(
                'name' => __('Public Profile'),
                 'url' => osc_user_public_profile_url(osc_logged_user_id()),
                 'class' => 'opt_publicprofile',
                 'ico' => 'ion ion-ios-contacts'
            );
            $options[] = array(
                'name'  => __('Listings', 'san_auto'),
                'url'   => osc_user_list_items_url(),
                'class' => 'opt_items',
                'ico' => 'ion ion-ios-list'
            );
            $options[] = array(
                'name' => __('Alerts', 'san_auto'),
                'url' => osc_user_alerts_url(),
                'class' => 'opt_alerts',
                'ico' => 'ion ion-ios-notifications-outline'
            );
            $options[] = array(
                'name'  => __('Account', 'san_auto'),
                'url'   => osc_user_profile_url(),
                'class' => 'opt_account',
                'ico' => 'ion ion-ios-settings'
            );
            $options[] = array(
                'name'  => __('Change email', 'san_auto'),
                'url'   => osc_change_user_email_url(),
                'class' => 'opt_change_email',
                'ico' => 'ion ion-ios-at'
            );
            $options[] = array(
                'name'  => __('Change username', 'san_auto'),
                'url'   => osc_change_user_username_url(),
                'class' => 'opt_change_username',
                'ico' => 'ion ion-ios-contact'
            );
            $options[] = array(
                'name'  => __('Change password', 'san_auto'),
                'url'   => osc_change_user_password_url(),
                'class' => 'opt_change_password',
                'ico' => 'ion ion-ios-key'
            );
            $options[] = array(
                'name' => __('Logout'),
                'url' => osc_user_logout_url(),
                'class' => 'opt_logout',
                'ico' => 'ion ion-md-power'
            );

            return $options;
        }
    }

    function san_auto_breadcrumb($separator = '', $echo = true, $lang = array()) {
		require('classes/BreadcrumpAuto.php');
        $br = new BreadcrumbAuto($lang);
        $br->init();
        if( $echo ) {
            echo $br->render($separator);
            return;
        }
        return $br->render($separator);
    }

    if( !function_exists('get_breadcrumb_lang')) {
        function get_breadcrumb_lang() {
            $lang = array();
            $lang['item_add']               = __('Publish a listing', 'san_auto');
            $lang['item_edit']              = __('Edit your listing', 'san_auto');
            $lang['item_send_friend']       = __('Send to a friend', 'san_auto');
            $lang['item_contact']           = __('Contact publisher', 'san_auto');
            $lang['search']                 = __('Search results', 'san_auto');
            $lang['search_pattern']         = __('Search results: %s', 'san_auto');
            $lang['user_dashboard']         = __('Dashboard', 'san_auto');
            $lang['user_dashboard_profile'] = __("%s's profile", 'san_auto');
            $lang['user_account']           = __('Account', 'san_auto');
            $lang['user_items']             = __('Listings', 'san_auto');
            $lang['user_alerts']            = __('Alerts', 'san_auto');
            $lang['user_profile']           = __('Update account', 'san_auto');
            $lang['user_change_email']      = __('Change email', 'san_auto');
            $lang['user_change_username']   = __('Change username', 'san_auto');
            $lang['user_change_password']   = __('Change password', 'san_auto');
            $lang['login']                  = __('Login', 'san_auto');
            $lang['login_recover']          = __('Recover password', 'san_auto');
            $lang['login_forgot']           = __('Change password', 'san_auto');
            $lang['register']               = __('Create a new account', 'san_auto');
            $lang['contact']                = __('Contact', 'san_auto');
            return $lang;
        }
    }

    function hideText($text){
        $count = $text;
        $countSmall = substr($count, 0, -6); // Crop phone
        $x = str_repeat("X", 6);
        $countSmall .= $x;// Add symbol 'X' in text
        return $countSmall;
    }

    function seller_post() {
      if(osc_get_preference('rewriteEnabled', 'osclass') <> 1) {
        $url = osc_base_url() . 'index.php?page=search&seller_post=' . osc_item_user_id();
      } else {
        $url = osc_base_url() . 'search/seller_post,' . osc_item_user_id() . '/iPage';
      }
      $conn = getConnection();
      $user = $conn->osc_dbFetchResult("SELECT COUNT(*) as count FROM %st_item i WHERE i.fk_i_user_id = '%d' AND i.b_active = 1 AND i.b_enabled = 1", DB_TABLE_PREFIX, osc_item_user_id());

      if ( osc_item_user_id() <> 0 ) {
        echo '<a class="item-lists" href="'. $url . '">';
        echo '<span class="item-bycount">'. $user['count'] . '</span> ' . ($user['count'] == 1 ? __('item', 'san_auto') : __('items', 'san_auto'));
        echo '</a>';
      }


    }

    function display_search($params = null){
      if ($params == null) {
        return false;
      }

      foreach ($params as $key => $value) {
        if ($value != '') {
          // We may want to have param-specific searches
          switch ($key) {
            case 'seller_post':
              Search::newInstance()->addConditions(sprintf("%st_item.fk_i_user_id = %d ", DB_TABLE_PREFIX, $value));
            break;
          }
        }
      }
    }
    osc_add_hook('search_conditions', 'display_search');

    function osc_related_num() {
        return(osc_get_preference('related_num', 'san_auto')) ;
    }

    function osc_related_category() {
        return(osc_get_preference('related_category', 'san_auto')) ;
    }

    function osc_related_country() {
        return(osc_get_preference('related_country', 'san_auto')) ;
    }

    function osc_related_region() {
        return(osc_get_preference('related_region', 'san_auto')) ;
    }

    function osc_related_picOnly() {
        return(osc_get_preference('related_picOnly', 'san_auto')) ;
    }

    function osc_related_remiumonly() {
    	return(osc_get_preference('related_remiumonly', 'san_auto')) ;
    }

    function related_san_auto() {
        $rmItemId = osc_item_id() ;
        $ra_numads = (osc_related_num() != '') ? osc_related_num() : '' ;
        $country = (osc_related_country() != '') ? osc_related_country() : '' ;
        $region = (osc_related_region() != '') ? osc_related_region() : '' ;
        $category = (osc_related_category() != '') ? osc_related_category() : '' ;
        $picOnly = (osc_related_picOnly() != '') ? osc_related_picOnly() : '';
        $premiumonly = (osc_related_remiumonly() != '') ? osc_related_remiumonly() : '';

        $mSearch = new Search() ;

        //Excluding current item
        $mSearch->dao->where(sprintf("%st_item.pk_i_id <> $rmItemId", DB_TABLE_PREFIX));

        //Checking if item is premium
        if($premiumonly ==1){
        $mSearch->dao->where(sprintf("%st_item.b_premium = 1", DB_TABLE_PREFIX));
        }

        //Adding Country as condition
        if($country ==1){
        $mSearch->addCountry(osc_item_country()) ;
        }

        //Adding Region as condition
        if($region ==1) {
        $mSearch->addRegion(osc_item_region()) ;
        }

        //Adding Item Category as condition
        if($category ==1) {
        $mSearch->addCategory(osc_item_category_id()) ;
        }

        //Adding condition for item having pictures
        if($picOnly == 1 ) {
        $mSearch->withPicture(true); //Search only Item which have pictures
        }

        //limiting number of related ads
        $mSearch->limit(0, $ra_numads) ; // fetch number of ads to show set in preference

        //Searching with all enabled conditions
        $aItems = $mSearch->doSearch();

    	$global_items = View::newInstance()->_get('items') ;
    	View::newInstance()->_exportVariableToView('items', $aItems); ?>

            <div class="item-list">
                <?php while ( osc_has_items() ) {
                    draw_item_san_auto('list', false);
                    }
                ?>
            </div>

        <?php

        View::newInstance()->_exportVariableToView('items', $global_items);
    }



    function title_pages_san_auto(){
            if (osc_is_publish_page()){
                    echo '<h1>'.__("Publish a listing", "san_auto").'</h1>';
			} elseif (osc_is_recover_page()){
					echo '<h1>'.__('Recover your password', 'san_auto').'</h1>';
			} elseif (osc_is_forgot_page()){
					echo '<h1>'.__('Recover your password', 'san_auto').'</h1>';
			} elseif (osc_is_user_dashboard()){
					echo '<h1>'. __('Welcome', 'san_auto'), ' ', osc_logged_user_name() .'!</h1>';
			} else if (osc_is_list_items()){
					echo '<h1>'.__('My listings', 'san_auto').'</h1>';
			} elseif (osc_is_list_alerts()){
					echo '<h1>'.__('Alerts', 'san_auto').'</h1>';
			} elseif (osc_is_user_profile()){
					echo '<h1>'.__('Update account', 'san_auto').'</h1>';
			} elseif (osc_is_contact_page()){
					echo '<h1>'.__('Contact us', 'san_auto').'</h1>';
			} elseif (osc_is_search_page()){
                if (search_title() !== "") {
                    echo '<h1>'. search_title().'</h1>';
                } elseif (osc_search_pattern() !== "") {
                    echo '<h1>'. osc_search_pattern() .'</h1>';
                } else {
                    echo '<h1>'.__('Search', 'san_auto').'</h1>';
                }
			} elseif (osc_is_ad_page()){
                    //echo osc_highlight(osc_item_title(), 100);
			} elseif (osc_is_static_page()) {
					echo '<h1>'. osc_static_page_title().'</h1>';
			} elseif (osc_is_custom_page()) {

			} elseif (osc_is_change_password_page()){
			 		echo '<h1>'.__('Change password', 'san_auto').'</h1>';
			} elseif (osc_is_change_username_page()) {
				  	echo '<h1>'.__('Change username', 'san_auto').'</h1>';
			} elseif (osc_is_change_email_page()) {
					echo '<h1>'.__('Change e-mail', 'san_auto').'</h1>';
			} elseif (osc_is_404()) {
                    echo "<h1>";
					echo '<i class="la la-frown-o"></i>';
					 _e("Sorry but I can't find the page you're looking for", 'san_auto');
                    echo "</h1>";
			} elseif (osc_is_item_send_page_san_auto()) {
				  	echo '<h1>'.__('Send to a friend', 'san_auto').'</h1>';
            } elseif (osc_is_edit_page()) {
				  	echo '<h1>'.__('Edit item', 'san_auto').'</h1>';
            } elseif (osc_is_public_profile()) {
				  	echo '<h1>'. osc_user_name() .'</h1>';
			}
	}


    function osc_is_item_send_page_san_auto(){
		return osc_is_current_page('item', 'send_friend');
	}

    function san_auto_country_id() {
		$aCountries = Country::newInstance()->listAll();
		if (count($aCountries) >= 0) {
			foreach($aCountries as $country) {
				$countryID = $country['pk_c_code'];
				}
			}
		return $countryID;
	}


    function draw_item_san_auto( $view = 'gallery', $premium = false) {
		$filename = 'loop-single';
		if($premium){
			$filename .='-premium';
		}
		require WebThemes::newInstance()->getCurrentThemePath() . $filename . '.php';
	}


    function chosen_region_select() {
        View::newInstance()->_exportVariableToView('list_regions', Search::newInstance()->listRegions('%%%%', '>=', 'region_name ASC') ) ;

        if( osc_count_list_regions() > 0 ) {
            echo '<select name="sRegion" class="select-jsf">' ;
            echo '<option value="">' . __('Select regions', 'san_auto') . '</option>' ;
            while( osc_has_list_regions() ) {
                echo '<option value="' . osc_list_region_id() . '">' . osc_list_region_name() . '</option>' ;
            }
            echo '</select>' ;
        }

        View::newInstance()->_erase('list_regions') ;
    }

    function chosen_city_select() {
        View::newInstance()->_exportVariableToView('list_cities', Search::newInstance()->listCities('%%%%', '>=', 'city_name ASC') ) ;

        if( osc_count_list_cities() > 0 ) {
            echo '<select name="sCity" class="select-jsf" >' ;
            echo '<option value="">' . __('Select a cities', 'san_auto') . '</option>' ;
            while( osc_has_list_cities() ) {
                echo '<option value="' . osc_list_city_id() . '">' . osc_list_city_name() . '</option>' ;
            }
            echo '</select>' ;
        }

        View::newInstance()->_erase('list_cities') ;
    }

    // USER-AVATAR
	function san_auto_users_images($userID,$package){
		if (!is_dir(osc_base_path().'oc-content/uploads/san_auto_users_images')) {
			@mkdir(osc_base_path().'oc-content/uploads/san_auto_users_images', 0755, true);
		}
		if( $package['error'] == UPLOAD_ERR_OK ) {
			$img = ImageResizer::fromFile($package['tmp_name']);
			$path = osc_base_path().'oc-content/uploads/san_auto_users_images/'.$userID.'.jpg' ;
			$img->saveToFile($path);
		}
	}

	function san_auto_delete_user_image($id){
		$path = osc_base_path().'oc-content/uploads/san_auto_users_images/'.$id.'.jpg' ;
		if(file_exists( $path )) {
			@unlink( $path );
		}
	}
	osc_add_hook('delete_user', 'san_auto_delete_user_image') ;

    // CHECK PLUGIN CAR ATTRIBUTES
    function san_auto_error (){
        echo '<div class="help-theme">'.__("To work correctly, it is recommended to install a modified plugin Car atributtes, it can be found in the archive with the template", "san_auto").'</div>';
    }

    if(!class_exists('ModelCars')) {
        osc_add_hook('footer', 'san_auto_error');
    }

    // SHOW USER-AVATAR IN ITEM, PREMIUM, HEADER
    function user_avatar_show($userId, $item = false, $premium = false, $coment = false){
        if(!file_exists(osc_base_path().'oc-content/uploads/san_auto_users_images/'.$userId.'.jpg')){
            $first = mb_substr($userId, 0, 1);
            $last  = mb_substr($userId, 1);
            $color ="rgba(0, 2$first$last, $first$first, 0.73)";
            if ($item) {
                if ($premium) {
                    echo '<span class="item-symb" style="background:'.$color.'">'.mb_substr(osc_premium_contact_name(), 0, 1, 'UTF-8').'</span>';
                } elseif($coment) {
                    echo '<span class="item-symb" style="background:'.$color.'">'.mb_substr(osc_comment_author_name(), 0, 1, 'UTF-8').'</span>';
                } else {
                    echo '<span class="item-symb" style="background:'.$color.'">'.mb_substr(osc_item_contact_name(), 0, 1, 'UTF-8').'</span>';
                }
            } else {
                echo '<span class="header-symb" style="background:'.$color.'">'.mb_substr(osc_logged_user_name(), 0, 1, 'UTF-8').'</span>';
            }
        } else {

            echo '<img width="100%" src="'.osc_base_url().'oc-content/uploads/san_auto_users_images/'.$userId.'.jpg"/>';
        }
    }

    function type_auto($id){
        if ($id == 1) { ?>
            <svg version="1.1" id="type-h<?= $id ?>" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="47.6 310.9 500 220" enable-background="new 47.6 310.9 500 220" xml:space="preserve">
				<g>
					<path d="M249.1,378.4h-0.9c-4.1,0.5-6,4.1-7.3,8.2l-2.3,8.7c-4.1,12.8,19.2,12.8,18.8,1.8v-11.4
						C256.9,381.1,253.7,377.9,249.1,378.4L249.1,378.4z"></path>
					<path d="M142,488.3c-21.1,0-41.7-14.2-42.6-14.7l-2.3-1.4v-32.1l2.3-1.4c0.9-1.8,2.3-7.3,2.3-11.9v-30.2l58.6-3.7
						c25.2-1.4,40.8,1.4,58.2,4.1c9.6,1.4,19.7,3.2,31.6,4.1h95.2c5.5,0,11-0.9,16.9-1.4c6-0.9,11.9-1.8,18.3-1.8
						c0.9,0,38.9,4.1,69.6,11.9c33,8.2,44,21.5,45.3,27.5l2.7,47.2l-4.1,0.9c-7.8,1.8-14.2,2.7-31.1,2.7h-18.3v-9.2h16
						c12.8,0,19.7-0.5,25.2-1.8v-2.7v-35.7c-0.5-1.4-9.6-11.9-38-19.2c-29.8-7.8-67.3-11.9-67.8-11.9c-5,0-10.5,0.5-16.5,1.4
						c-6,0.9-11.9,1.8-18.3,1.8h-95.7c-12.8-0.9-22.9-2.7-33-4.1c-16.5-2.7-31.6-4.6-55.9-3.7l-49.9,2.7v21.5c0,6.4-3.2,12.8-4.6,15.6
						v23.8c6,3.7,22.9,12.4,38,11.9h12.4v9.2h-14.2C142,488.3,142.4,488.3,142,488.3L142,488.3z M394.7,488.3H207v-9.2h187.7V488.3
						L394.7,488.3z"></path>
					<path d="M106.2,415.9c0,4.6-1.8,9.6-1.8,12.4h6.4c7.8,0,17.9-6,18.3-12.4v-6h-22.9V415.9L106.2,415.9L106.2,415.9z"></path>
					<path d="M458.8,433.3l9.2,16.5c3.2-1.8,7.3-2.7,11-2.7l0,0l0,0l0,0l0,0l0,0l0,0c4.6,0,9.6,0,14.2,0v-0.9c-0.5-1.4-5-9.2-9.6-12.8
						C475.3,433.3,467.1,433.3,458.8,433.3L458.8,433.3z"></path>
					<path d="M213.4,488.3c-1.8,3.7-4.1,6.9-6.9,9.6l0,0c-6.4,6.4-14.7,10.1-24.3,10.1s-17.9-4.1-24.3-10.1c-2.7-2.7-5-6-6.9-9.6h-4.6
						h-3.7v-4.6v-12.4c0-11,4.6-21.5,11.9-28.8c7.3-7.3,16.5-11.9,27.5-11.9l0,0c11,0,21.1,4.1,28.8,11.4l0,0h2.3
						c7.3,7.3,11.9,17.4,11.9,28.8v12.4v4.6h-4.6h-7.3V488.3L213.4,488.3z M420.4,449.3c-13.3,0-23.8,10.5-23.8,23.8
						s10.5,23.8,23.8,23.8c13.3,0,23.8-10.5,23.8-23.8C444.6,460.3,433.6,449.3,420.4,449.3L420.4,449.3L420.4,449.3z M182.2,449.3
						c-13.3,0-23.8,10.5-23.8,23.8S169,497,182.2,497s23.8-10.5,23.8-23.8C206.5,460.3,195.5,449.3,182.2,449.3L182.2,449.3L182.2,449.3
						z M420.4,431L420.4,431c11,0,21.1,4.1,28.8,11.4l0,0h2.3c7.3,7.3,11.9,17.4,11.9,28.8v12.4v4.6h-4.6h-7.3c-1.8,3.7-4.1,6.9-6.9,9.6
						c-6.4,6.4-14.7,10.1-24.3,10.1c-9.6,0-17.9-3.7-24.3-10.1l0,0c-2.7-2.7-5-6-6.9-9.6h-4.6H381v-4.6v-12.4c0-11,4.6-21.1,11.9-28.8
						H392l0,0C399.3,435.6,409.4,431,420.4,431L420.4,431z"></path>
					<path d="M420.4,464.9c-4.6,0-8.7,3.7-8.7,8.7c0,4.6,4.1,8.7,8.7,8.7s8.7-3.7,8.7-8.7C429.1,468.6,425.4,464.9,420.4,464.9
						L420.4,464.9z"></path>
					<polygon points="266.5,424.2 243.6,424.2 243.6,419.6 266.5,419.6 	"></polygon>
					<path d="M182.2,464.9c-5,0-8.7,3.7-8.7,8.7c0,4.6,3.7,8.7,8.7,8.7c4.6,0,8.7-3.7,8.7-8.7C190.9,468.6,187.3,464.9,182.2,464.9
						L182.2,464.9z"></path>
					<polygon points="234.4,464 234.4,469.9 367.7,469.9 	"></polygon>
					<polygon points="490.9,469.9 481.7,469.9 481.7,465.4 490.9,465.4 	"></polygon>
					<path d="M483.1,460.8h-6.9c-1.8,0-3.2,1.8-3.2,3.7v2.3c0,1.8,1.4,3.2,3.2,3.2h6.9c1.8,0,3.2-1.4,3.2-3.2v-2.3
						C486.3,462.2,484.9,460.8,483.1,460.8L483.1,460.8z"></path>
					<path d="M101.7,465.4v13.3h36.6v-0.9C123.6,476.4,107.6,469,101.7,465.4L101.7,465.4z"></path>
					<path d="M185,376.1L185,376.1c-4.1,0.5-6,4.1-6.9,8.2l-2.7,8.7c-0.5,0.9-0.5,1.4-0.5,1.8c6.4,0.5,11.9,0.9,18.3,1.4
						c0-0.5,0-0.9,0-1.4v-11.4C192.8,378.8,189.6,375.6,185,376.1L185,376.1z"></path>
					<path d="M383.3,398.5c0,0-46.7-28.4-65.9-34.3c-2.3-0.9-4.6-1.4-6.9-1.8l0,0c-2.3-0.5-5-0.9-7.8-1.4l-1.8,9.2
						c24.3,6,33.9,21.1,54.9,33.9c3.2,1.8,19.2,0.9,22.4,2.7L383.3,398.5L383.3,398.5z"></path>
					<path d="M337.5,400.8L337.5,400.8c-2.7,2.7-4.1,6-4.1,9.6c0,1.4,0.5,2.3,1.4,3.2c0.9,0.9,1.8,1.4,3.2,1.4H348
						c1.8,0,3.2-0.9,4.1-2.3c0.9-1.4,0.9-3.2,0-4.6c-1.8-3.2-5-6.4-10.1-8.2C340.2,399,338.4,399.4,337.5,400.8L337.5,400.8z"></path>
					<path d="M345.7,412.7c-0.9,0-1.8-0.5-2.7-1.4l-6-8.2c-0.9-1.4-0.9-3.2,0.5-4.6c1.4-0.9,3.2-0.9,4.6,0.9l6,8.2
						c0.9,1.4,0.9,3.2-0.9,4.6C347.1,412.7,346.6,412.7,345.7,412.7L345.7,412.7z"></path>
				</g>
			</svg>
        <?php } elseif ($id == 2) { ?>
            <svg version="1.1" id="type-h<?= $id ?>" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="47.6 310.9 500 220" enable-background="new 47.6 310.9 500 220" xml:space="preserve">
				<g>
					<path d="M198.7,492.4v-9.2h21.1c65.9,0,134.2-0.5,198.7,0v9.2c-64.6,0-132.8,0-198.7,0H198.7L198.7,492.4z M152.9,493.8
						c-20.6-2.7-57.2-13.7-69.1-22.4l-4.1-1.4v-25.6l1.4-1.4c1.8-1.8,6-8.2,6-12.8l4.1-18.3L86.5,393l22,2.7h37.5
						c3.7-1.4,8.7-3.7,14.2-6c29.3-11.9,56.8-21.5,68.7-21.5h78.8c1.4,0,2.3,0,3.7,0.5c23.8,6.9,45.3,18.8,70.5,33.4h0.5
						c70.1,2.7,111.3,8.2,125.5,16.5l2.3,1.4v14.7l5.5,4.6v2.3c0,17.9-7.8,25.2-12.4,29.3c0,0.5-0.5,0.9,0,0.9c1.4,2.7,2.3,5,2.3,7.8
						v3.2l-5,1.4c-11,4.6-22.4,7.3-36.2,8.7v-9.6c11-0.9,21.1-3.2,30.2-6.4c0-0.5,0.9-0.5,0.9-0.9c-0.9-2.3-1.8-4.1-1.8-6v-2.3l0.9-0.9
						c0.9-0.9,1.4-1.4,2.3-2.3c4.1-3.7,9.2-7.8,9.6-20.1l-5.5-4.6v-16c-11-5-40.3-11-118.1-14.2h-3.7l-0.9-0.5
						c-24.7-14.7-46.2-24.7-69.1-31.1c-0.5,0-0.9,0-0.9,0H229c-10.5,0-44.9,13.7-65,22c-6.4,2.3-11.4,4.1-15.6,5.5l-1.4,0.5h-39.4h-8.2
						l1.4,5.5l-4.6,20.6c0,6.4-5,13.7-7.8,16.5v16.9c12.4,7.3,46.2,16.9,64.1,19.2v9.2H152.9z"></path>
					<path d="M243.6,385.2c0.5,8.2,1.4,16,1.8,24.3c-12.4-2.7-25.2-5.5-37.5-8.7C223,390.7,225.7,385.2,243.6,385.2L243.6,385.2
						L243.6,385.2z M253.2,385.2c17.9,0,36.2,0,54,0c12.8,3.7,25.2,9.2,37.5,15.1l-0.5,0.5l0,0c-2.7,2.7-4.6,6.4-5.5,10.1
						c-9.2,0-19.7,0-30.7,0c-17.4,0-35.3,0-52.7,0C254.6,402.6,254.1,393.9,253.2,385.2L253.2,385.2z"></path>
					<path d="M424.9,503.4c-4.6-2.3-8.2-6-11.4-10.1l-3.2-0.5c-1.8-0.5-5-0.9-6.9-0.9l-3.7-0.9v-3.7V475c0-11.9,2.7-22.4,10.5-30.2h1.4
						c6.4-6.4,16-10.5,30.2-10.5c13.7,0,23.4,4.1,30.2,10.5l0,0c7.8,7.8,10.5,18.3,10.5,30.2v7.8v4.1l-4.1,0.5c-1.4,0.5-2.7,0.5-4.1,0.9
						l0,0l-1.4,0.5c-2.7,5.5-6.4,10.1-11.4,13.7c-5.5,3.7-12.4,6-19.7,6C435.9,507.9,430,506.1,424.9,503.4L424.9,503.4L424.9,503.4
						L424.9,503.4z M441.9,449.3c-13.3,0-23.8,10.5-23.8,23.8s10.5,23.8,23.8,23.8c13.3,0,23.8-10.5,23.8-23.8
						C465.7,460.3,455.2,449.3,441.9,449.3L441.9,449.3L441.9,449.3z M174.5,449.3c-13.3,0-23.8,10.5-23.8,23.8s10.5,23.8,23.8,23.8
						c13.3,0,23.8-10.5,23.8-23.8C198.3,460.3,187.7,449.3,174.5,449.3L174.5,449.3L174.5,449.3z M145.2,444.3h-0.5
						c6.4-6.4,16-10.5,30.2-10.5c13.7,0,23.4,4.1,30.2,10.5h1.8c7.8,7.8,10.5,18.3,10.5,30.2v15.1v2.7h-4.6h-11.4
						c-2.7,3.7-6.4,6.9-11,9.2c-5,2.7-10.5,6-16,6c-6,0-11.9-1.4-16.5-4.6c-4.6-2.3-8.2-6-11.4-10.1l-3.2-0.5c-1.8-0.5-3.2-0.9-5-1.4
						l-3.7-0.9v-3.7v-12.4C134.6,462.6,137.4,452.1,145.2,444.3L145.2,444.3z"></path>
					<path d="M174.5,464.9c-5,0-8.7,3.7-8.7,8.7c0,4.6,3.7,8.7,8.7,8.7c4.6,0,8.7-4.1,8.7-8.7C183.2,468.6,179,464.9,174.5,464.9
						L174.5,464.9z"></path>
					<polygon points="281.2,423.7 258.3,423.7 258.3,419.1 281.2,419.1 	"></polygon>
					<polygon points="230.8,465.4 230.8,474.1 388.8,474.1 	"></polygon>
					<path d="M441.9,464.9c-4.6,0-8.7,3.7-8.7,8.7c0,4.6,3.7,8.7,8.7,8.7s8.7-4.1,8.7-8.7C450.6,468.6,446.5,464.9,441.9,464.9
						L441.9,464.9z"></path>
					<path d="M464.3,396.2h-49.9l-21.1,9.2v2.3c21.5,1.4,47.6,3.2,71,6V396.2L464.3,396.2z"></path>
					<path d="M347.1,404.5L347.1,404.5c-2.7,2.7-4.1,6-4.1,9.6c0,1.4,0.5,2.7,1.4,4.1c0.9,0.9,1.8,1.4,3.2,1.4h10.5
						c1.8,0,3.2-0.9,4.1-2.3c0.9-1.4,0.9-3.7,0-5c-1.8-3.2-5-6.4-10.1-8.2C350.3,402.6,348.5,403.1,347.1,404.5L347.1,404.5z"></path>
					<path d="M355.8,423.7c-0.9,0-1.8-0.5-2.7-1.4l-6-8.2c-0.9-1.4-0.9-3.2,0.9-4.6c1.4-0.9,3.2-0.9,4.6,0.5l6,8.2
						c0.9,1.4,0.9,3.2-0.5,4.6C357.2,423.2,356.7,423.7,355.8,423.7L355.8,423.7z"></path>
				</g>
			</svg>
        <?php } elseif ($id == 3) { ?>
            <svg id="type-h<?= $id ?>" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 302.85 123.53">
                <g>
                    <path class="cls-1" d="M445.09,447.53h.64c-.05,3.47-.17,6.81-.48,9.61-2.43.3-10.28.78-10.77-1.54-.35-1.6-.33-5.31.73-6.09s2.11-1.84,3.31-1.87C439.89,447.61,443.71,447.57,445.09,447.53Z" transform="translate(-145.93 -361.55)"/><path class="cls-1" d="M445.2,431.46h0c.29.07.56,1.54.56,1.84,0,2.33,0,4.89,0,7.52-3.21-.12-8.29-.23-11.49-.35-.76,0-14-5.68-14.38-6.09-1.85-2.11-9.66-6.81-11.51-8.92C414.2,425.46,439.34,431.45,445.2,431.46Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M338.41,454.46H252V454c0-1.67-.12-4.78-.12-6.45,11.54,2.64,23.4,3.54,35.2,4.43C297.51,452.74,327,454.46,338.41,454.46Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M358.69,408.1c-36,0-94.19.52-137.79-2.46-3.67-.25-11.29-6.49-14.86-6.69-14.5-.83-29.46,0-42.4,0l-1.93-1.29c4.5-6.76,9.78-14.57,14.46-21.24a2.2,2.2,0,0,0,.37-.86l2.53.2c63.65-2.09,139.31-1.14,139.31-1.14,12.66,7,33.2,21.72,37.31,27.48,1.18,1.66,3,4.39,3.68,5.5Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M154.25,419.94c.16-2.11.24-4.24.29-6.08a19.41,19.41,0,0,1,.16-2c3.59-.16,14.66.14,18,0-3.25,4.71-3.47,6.78-9,8.12-.39.1-8.72.25-9,0Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M376,469.46H232.45a3,3,0,0,1,0-6H376a3,3,0,0,1,0,6Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M416.78,469a3,3,0,0,1,0-6c.65,0,1.36,0,2.11,0,3.24-.14,7.3-.55,11.23-.94,5-.5,10.11-1,13.83-1a3,3,0,0,1,0,6c-3.43,0-8.41.5-13.23,1-4,.4-8.17.82-11.56,1C418.33,468.94,417.52,469,416.78,469Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M445.35,435.94a3,3,0,0,1-1.72-.52c-1.8-1.23-1.64-3.91-1.38-4.75a3.09,3.09,0,0,1,2.95-2.21,3,3,0,0,1,3,3c0,.12,0,.24,0,.35a3,3,0,0,1-.92,3.48A3,3,0,0,1,445.35,435.94Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M444,466a3,3,0,0,1-2.74-4.23,18.64,18.64,0,0,0,1.06-4.93c.25-2.31.4-5.27.46-9.31,0-2.2,0-4.46,0-6.67,0-2.58,0-5.1,0-7.4l-.06-.3a3,3,0,0,1,3.2-4.57c2.83.68,2.86,4.59,2.86,4.75,0,2.36,0,4.9,0,7.51,0,2.25,0,4.54,0,6.76-.06,4.24-.22,7.38-.5,9.9a23.07,23.07,0,0,1-1.55,6.72A3,3,0,0,1,444,466Zm.56-31.58Zm0,0Zm0,0Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M445.22,434.46a3,3,0,0,1-2.12-.88l-.87-.87c-9-9-14.94-14.95-26.64-18-8-2.11-14.21-3.79-19.65-5.28-8.81-2.41-15.77-4.32-26.61-6.92a3,3,0,1,1,1.4-5.83c10.94,2.62,18.28,4.63,26.79,7,5.43,1.48,11.57,3.17,19.6,5.27,13.27,3.48,20.37,10.59,29.35,19.58l.87.87a3,3,0,0,1-2.12,5.12Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M192.43,469.27a2.9,2.9,0,0,1-.66-.07l-3.41-.75c-11.55-2.6-29.05-7.11-40.41-11.29a3,3,0,0,1-2-2.81l-.06-20.67a6.17,6.17,0,0,1,1.37-4.35,5.9,5.9,0,0,1,2.76-1.59c.28-.75.84-2.85,1.19-8,.17-2.26.25-4.48.29-6a21.77,21.77,0,0,1,.18-2.34,22.59,22.59,0,0,1,3.5-9.41c1.16-1.77,2.44-3.69,3.79-5.73l.2-.3c3.67-5.51,9.06-13.52,14.13-20.77-.31-.36-.8-.81-1.13-1.12-1.27-1.21-4.26-4-1.85-7.06a3,3,0,0,1,2.14-1.13c5.15-.35,126.31-8.44,150-1.7a2,2,0,0,1,.39.14l9.43,4.18a2.27,2.27,0,0,1,.48.27c13,8.89,22.15,15.81,29.49,21.37,3.32,2.51,6.45,4.88,9.43,7.05l.13.09h0a3,3,0,0,1-3.52,4.86l-.23-.17c-3-2.19-6.13-4.56-9.44-7.06-7.24-5.49-16.25-12.3-29-21l-9-4c-20.48-5.6-118.8.15-142.58,1.64A5.61,5.61,0,0,1,179.5,376a5.31,5.31,0,0,1-.86,2.08c-5.16,7.36-10.7,15.59-14.44,21.2l-.19.3c-1.34,2-2.61,3.94-3.77,5.71a16.43,16.43,0,0,0-2.57,6.9,15.6,15.6,0,0,0-.13,1.72c0,1.54-.12,3.86-.3,6.22-.66,9.61-2.15,12.09-4.36,13-.32.12-.62.22-.93.31h0v.22l0,18.56c11.08,3.88,27,8,37.69,10.37l3.33.73a3,3,0,0,1-.57,5.94Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M326.87,411.14c-33.48,0-73.76-.29-106.18-2.5-2.52-.18-5.56-1.92-8.77-3.77-2-1.14-5-2.86-6-2.92-9.7-.56-19.54-.36-29.06-.17-4.6.09-9,.17-13.17.17a3,3,0,1,1,0-6c4.16,0,8.48-.08,13.05-.17,9.64-.19,19.6-.39,29.52.18,2.49.14,5.51,1.87,8.71,3.71,2,1.16,5,2.9,6.18,3,38.17,2.61,87.48,2.53,123.48,2.47l14.11,0a3,3,0,0,1,0,6l-14.1,0Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M359.69,411.1a3,3,0,0,1-2.54-1.4l-.31-.47c-1.52-2.36-2.8-4.27-3.6-5.39-3.45-4.84-22.55-18.87-35.66-26.23-8.09-.09-78.94-.8-138.41,1.15a3,3,0,1,1-.2-6c63-2.06,138.69-1.15,139.45-1.14a3,3,0,0,1,1.41.38c11.73,6.49,33.47,21.59,38.3,28.36,1.08,1.52,2.64,3.89,3.75,5.61l.34.53a3,3,0,0,1-2.53,4.6Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M306,427H293a1.5,1.5,0,0,1,0-3h13a1.5,1.5,0,0,1,0,3Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M274.64,427H259a1.5,1.5,0,0,1,0-3h15.6a1.5,1.5,0,0,1,0,3Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M445.22,433h0c-3.08,0-10.67-1.47-18.7-3-7.55-1.46-15.36-3-18.12-3a1.5,1.5,0,0,1,0-3c3.05,0,10.65,1.47,18.69,3,7.54,1.46,15.34,3,18.13,3a1.5,1.5,0,0,1,0,3Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M445.78,442.32c-1.69-.06-3.77-.12-5.85-.17l-5.72-.18c-.8,0-14.62-5.63-15.46-6.61a45.75,45.75,0,0,0-5.48-4.21,42.57,42.57,0,0,1-6-4.7,1.5,1.5,0,1,1,2.25-2,45,45,0,0,0,5.5,4.23,46.74,46.74,0,0,1,5.87,4.53c1.55.86,12.11,5.33,13.58,5.75,1.56.06,3.56.11,5.56.17s4.18.11,5.8.17a1.52,1.52,0,0,1,1.46,1.53A1.5,1.5,0,0,1,445.78,442.32Zm-24.79-9,0,0Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M440.72,457.91c-3,0-6.35-.4-6.73-2.2-.31-1.41-.49-5.56.92-6.6.23-.17.46-.34.68-.52a5.21,5.21,0,0,1,2.91-1.45l2.67,0c1.49,0,3.1,0,3.9-.07a.5.5,0,1,1,0,1c-.8,0-2.42.05-3.91.07l-2.66,0a4.47,4.47,0,0,0-2.32,1.24c-.24.18-.47.37-.71.54-.76.56-.89,3.93-.54,5.58s6.25,1.63,10.23,1.15l.22,0a.5.5,0,0,1,.14,1l-.14,0h-.1A42.78,42.78,0,0,1,440.72,457.91Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M252,455a1,1,0,0,1-1-1c0-.83,0-2-.06-3.2s-.06-2.41-.06-3.25a1,1,0,0,1,2,0c0,.83,0,2,.06,3.2s.06,2.41.06,3.25A1,1,0,0,1,252,455Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M356.46,455.46h-2.37a1,1,0,0,1,0-2h2.37a1,1,0,0,1,0,2Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M354.09,455.46H251a1,1,0,0,1,0-2H354.09a1,1,0,0,1,0,2Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M338.41,455.46c-12,0-41.87-1.79-51.46-2.52-11.65-.88-23.69-1.79-35.35-4.45a1,1,0,0,1-.75-1.2,1,1,0,0,1,1.2-.75c11.51,2.63,23.48,3.53,35.05,4.41,11.33.86,40.12,2.51,51.31,2.51a1,1,0,0,1,0,2Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M211.9,485.07a25.67,25.67,0,0,1-24.2-17.14h0a25.64,25.64,0,1,1,49.84-8.5,26.3,26.3,0,0,1-1.39,8.33A25.62,25.62,0,0,1,211.9,485.07Zm-14.76-20.45a15.65,15.65,0,0,0,29.56-.12,14.64,14.64,0,0,0,.62-2.47,15,15,0,0,0,.22-2.6,15.64,15.64,0,1,0-31.28,0,15.46,15.46,0,0,0,.88,5.19Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M189.47,466.46a3,3,0,0,1-2.88-2.13,26.86,26.86,0,0,1-1.13-7.69A26.44,26.44,0,1,1,237.3,464a3,3,0,1,1-5.77-1.66,20.44,20.44,0,1,0-40.07-5.72,20.53,20.53,0,0,0,.88,6,3,3,0,0,1-2,3.73A2.9,2.9,0,0,1,189.47,466.46Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M374,467.64a3,3,0,0,1-2.87-2.12,26.15,26.15,0,0,1-1.14-7.7,26.44,26.44,0,1,1,51.83,7.4,3,3,0,0,1-5.76-1.69A20.44,20.44,0,1,0,376,457.82a20.23,20.23,0,0,0,.87,5.94,3,3,0,0,1-2,3.75A3,3,0,0,1,374,467.64Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M395.45,485.07a25.71,25.71,0,0,1-24.12-16.91c-.28-.79-.53-1.58-.72-2.34a26,26,0,0,1-.8-6.39,25.64,25.64,0,1,1,25.64,25.64Zm0-41.28a15.66,15.66,0,0,0-15.64,15.64,15.85,15.85,0,0,0,.49,3.93h0a13.85,13.85,0,0,0,.44,1.4,15.64,15.64,0,1,0,14.71-21Z" transform="translate(-145.93 -361.55)"/>
                    <path class="cls-1" d="M158.22,421.61c-2.11,0-4.09-.1-4.55-.48a1.5,1.5,0,0,1,1.4-2.6c1.08.13,7.31.05,8.29,0,3.87-.95,4.59-2.08,6.48-5.06l0-.05h0c-1.65,0-3.68,0-5.77,0-3.7,0-7.52-.08-9.33,0h-.15a1.5,1.5,0,0,1,0-3h.09c1.82-.08,5.68,0,9.42,0,3.4,0,6.92.07,8.49,0a1.5,1.5,0,0,1,1.3,2.35c-.6.87-1.09,1.65-1.54,2.35-2,3.21-3.27,5.15-8.38,6.38C164,421.43,161,421.61,158.22,421.61Z" transform="translate(-145.93 -361.55)"/>
                    <circle class="cls-1" cx="66.08" cy="98.61" r="6.83"/><circle class="cls-1" cx="250.09" cy="98.39" r="6.83"/>
                </g>

            </svg>

        <?php } elseif ($id == 4) { ?>
            ​<svg version="1.1" id="type-h<?= $id ?>" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="47.6 310.9 500 220" enable-background="new 47.6 310.9 500 220" xml:space="preserve">
                <g>
                    <path d="M207.9,399.4c-9.2,0-34.8-2.3-48.1-9.6c20.6-11,57.2-23.8,76-23.8c16.5,0,36.6,0,52.7,0c25.2,0,46.2,9.2,66.9,20.6
                        c-3.2,3.2-5,6.4-5.5,11.4c0,0.5,0,0.9,0,1.4H207.9L207.9,399.4z"></path>
                    <path d="M134.6,486.4c-21.1,0-45.3-12.4-46.7-12.8l-2.3-1.4v-32.1l-1.4-0.9c0.9-1.8,6-7.3,6-11.9v-29.8l17.9-4.1
                        c24.3-11.4,90.7-34.3,134.6-34.3h54.9c12.4,0.9,22.9,3.2,32.1,5.5c17.9,5.5,58.6,30.2,65,34.3c6.4,0.9,40.3,5,67.8,11.9
                        c33,8.2,44,21.5,45.3,27.5l2.7,47.2l-4.1-0.9c-7.8,1.8-14.2,2.7-31.1,2.7h-18.8v-9.2h13.7c12.8,0,22-0.5,27.5-1.8v-0.9v-35.7
                        c-0.5-1.4-9.6-11.9-38-19.2c-29.8-7.8-66.9-11.9-67.3-11.9l-1.8-0.5c-0.5-0.5-45.8-28.8-64.1-34.3c-8.2-2.3-18.3-4.1-29.3-5.5h-54
                        c-42.6,0-104.4,22.9-127.8,33.9l-4.6,1.4l-11,2.3v22c0,6.4-3.2,12.8-4.6,15.6v22.9c6,3.7,22.9,12.4,38,11.9h12.4v9.2h-12.4
                        C132.8,486.4,135.1,486.4,134.6,486.4L134.6,486.4z M402,486.4H200.6v-9.2H402V486.4L402,486.4z"></path>
                    <path d="M99.8,414.1c0,4.6-2.3,9.6-2.7,12.4h6.9c7.8,0,17.9-6,18.3-12.4v-6H99.4L99.8,414.1L99.8,414.1L99.8,414.1z"></path>
                    <path d="M471.6,433.3l9.2,16.5c2.7-1.8,7.3-2.7,11-2.7l0,0l0,0l0,0l0,0l0,0l0,0c4.6,0,9.6,0,14.2,0v-0.9c-0.5-1.4-5-9.2-9.6-12.8
                        C487.7,433.3,479.9,433.3,471.6,433.3L471.6,433.3z"></path>
                    <polygon points="310.5,426.9 287.6,426.9 287.6,422.3 310.5,422.3 	"></polygon>
                    <polygon points="214.3,426.9 191.4,426.9 191.4,422.3 214.3,422.3 	"></polygon>
                    <polygon points="232.6,459.9 232.6,468.1 381.9,468.1 	"></polygon>
                    <polygon points="502.8,468.1 493.6,468.1 493.6,463.5 502.8,463.5 	"></polygon>
                    <path d="M494.5,463.5h-6.9c-1.8,0-3.2-0.9-3.2,0.9v4.6c0,1.8,1.4,3.2,3.2,3.2h6.9c1.8,0,3.2-1.4,3.2-3.2v-2.3
                        C498.2,464.9,496.8,463.5,494.5,463.5L494.5,463.5z"></path>
                    <path d="M359,396.2L359,396.2c-2.7,2.7-4.1,6-4.1,9.6c0,1.4,0.5,0.5,1.4,1.4c0.9,0.9,1.8,1.4,3.2,1.4H370c1.8,0,3.2-0.9,4.1-2.3
                        c0.9-1.4,0.9-0.9,0-2.7c-1.8-3.2-5-6.4-10.1-8.2C362.2,394.4,360.4,394.8,359,396.2L359,396.2z"></path>
                    <path d="M367.7,415.5c-0.9,0-1.8-0.5-2.7-1.4l-6-8.2c-0.9-1.4-0.9-3.2,0.9-4.6c1.4-0.9,3.2-0.9,4.6,0.9l6,8.2
                        c0.9,1.4,0.9,3.2-0.9,4.6C369.1,415,368.6,415.5,367.7,415.5L367.7,415.5z"></path>
                    <path d="M95.2,463.5v13.3h35.3l-0.5-0.9C115.4,474.5,101.2,467.2,95.2,463.5L95.2,463.5z"></path>
                    <path d="M175.4,431L175.4,431c11,0,21.1,4.6,28.8,11.9l0,0h-1.4c7.3,7.3,11.9,17.4,11.9,28.8v11.9v2.7h-4.6h-8.7
                        c2.7-4.6,4.1-9.6,4.1-14.7c0-16-13.3-27.5-29.3-27.5s-29.3,11-29.3,27.5c0,5.5,1.4,10.5,4.1,14.7h-10.5h-3.2v-4.6v-10.5
                        c0-11,4.6-21.1,11.9-28.8h-1.8l0,0C153.9,435.6,163.9,431,175.4,431L175.4,431z"></path>
                    <path d="M151.1,449.3c6.4-6.4,14.7-10.1,24.3-10.1c9.6,0,17.9,3.7,24.3,10.1l0,0c6.4,6.4,10.1,14.7,10.1,24.3
                        c0,9.6-3.7,17.9-10.1,24.3l0,0c-6.4,6.4-14.7,10.1-24.3,10.1c-9.6,0-17.9-3.7-24.3-10.1c-6.4-6.4-10.1-14.7-10.1-24.3
                        C141,464,144.7,455.3,151.1,449.3L151.1,449.3L151.1,449.3L151.1,449.3z M175.4,449.3c-13.3,0-23.8,10.5-23.8,23.8
                        s10.5,23.8,23.8,23.8c13.3,0,23.8-10.5,23.8-23.8C199.2,460.3,188.7,449.3,175.4,449.3L175.4,449.3z"></path>
                    <path d="M175.4,464.9c-5,0-8.7,4.1-8.7,8.7c0,5,3.7,8.7,8.7,8.7c4.6,0,8.7-3.7,8.7-8.7C184.1,468.6,180,464.9,175.4,464.9
                        L175.4,464.9z"></path>
                    <path d="M432.7,431L432.7,431c11,0,21.1,4.6,28.8,11.9l0,0h1.8c7.3,7.3,11.9,17.4,11.9,28.8v11.9v2.7h-4.6h-11.9
                        c2.7-4.6,4.1-9.6,4.1-14.7c0-16-13.3-27.5-29.3-27.5s-29.3,11-29.3,27.5c0,5.5,1.4,10.5,4.1,14.7h-10.5h-4.6v-4.6v-10.5
                        c0-11,4.6-21.1,11.9-28.8h-0.5l0,0C411.7,435.6,421.7,431,432.7,431L432.7,431z"></path>
                    <path d="M408.5,449.3c6.4-6.4,14.7-10.1,24.3-10.1c9.6,0,17.9,3.7,24.3,10.1l0,0c6.4,6.4,10.1,14.7,10.1,24.3
                        c0,9.6-3.7,17.9-10.1,24.3l0,0c-6.4,6.4-14.7,10.1-24.3,10.1c-9.6,0-17.9-3.7-24.3-10.1c-6.4-6.4-10.1-14.7-10.1-24.3
                        C398.8,464,402.5,455.3,408.5,449.3L408.5,449.3L408.5,449.3L408.5,449.3z M432.7,449.3c-13.3,0-23.8,10.5-23.8,23.8
                        s10.5,23.8,23.8,23.8c13.3,0,23.8-10.5,23.8-23.8C457,460.3,446,449.3,432.7,449.3L432.7,449.3z"></path>
                    <path d="M432.7,464.9c-4.6,0-8.7,4.1-8.7,8.7c0,5,3.7,8.7,8.7,8.7c4.6,0,8.7-3.7,8.7-8.7C441.9,468.6,437.8,464.9,432.7,464.9
                        L432.7,464.9z"></path>
                </g>
            </svg>
        <?php } elseif ($id == 5) { ?>
            <svg version="1.1" id="type-h<?= $id ?>" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="47.6 310.9 500 220" enable-background="new 47.6 310.9 500 220" xml:space="preserve">
				<g>
					<path d="M199.2,342.6h95.7c23.8,2.3,47.2,17.4,68.7,31.1c-0.5,0.5-0.9,0.9-1.4,1.4l0,0c-3.7,3.2-5.5,7.8-5.5,12.4
						c0,0.5,0,0.9,0,1.4l-218.4-8.2C161.2,361.9,174.9,342.6,199.2,342.6L199.2,342.6z"></path>
					<path d="M115.4,475.4c-21.5,0-33.4-11.4-33.9-11.9l-1.4-1.4v-28.4l0.5-0.9c0.9-1.8,3.2-7.3,3.2-11.9c0-4.1,0.5-10.5,0.5-16.9v-11
						c0.5-7.3,27.5-36.6,36.6-44.9v-9.6l4.6-2.7c18.8-4.1,55.4-6.4,80.6-6.4h89.3c33.4,2.7,64.6,22.9,92,40.3c5,3.2,9.6,7.8,14.2,10.5
						c2.3,0,4.6,0.5,8.2,0.9c51.7,5,100.3,11.9,104.9,32.1v62.3l-3.7,2.7c-6.9,1.4-13.3,2.3-27.9,2.3h-13.7v-9.2h14.2
						c11.9,0,17.9-0.5,22.4-1.4v-56.3c-2.3-9.6-34.8-17.9-96.2-23.8c-3.7-0.5-6.9-0.5-9.6-0.9l-1.8-0.5c-5-3.2-10.1-8.2-15.6-11.4
						c-27.9-17.9-56.8-36.2-87.5-38.5h-89.7c-22.9,0-55.9,1.8-75.1,5.5v8.2l-4.1,1.8c-4.6,2.7-30.7,34.3-32.5,40.3v10.5
						c0,6.4-0.9,12.8-0.9,16.9c0,6.4-1.8,12.8-3.7,15.6v19.7c3.2,2.7,12.4,10.5,26.6,10.1h5.5v9.2L115.4,475.4
						C114.5,475.4,115.9,475.4,115.4,475.4L115.4,475.4z M396.1,475.4H194.6v-9.2h201.5V475.4L396.1,475.4z"></path>
					<path d="M365.4,378.4L365.4,378.4c-2.7,2.7-4.1,6-4.1,9.6c0,1.4,0.5,2.7,1.4,3.7c0.9,0.9,1.8,1.4,3.2,1.4h10.5
						c1.8,0,3.2-0.9,4.1-2.3c0.9-1.4,0.9-3.7,0-5c-1.8-3.2-5-6.4-10.1-8.2C368.6,376.5,366.8,377,365.4,378.4L365.4,378.4z"></path>
					<path d="M367.2,390.7c-0.9,0-1.8-0.5-2.7-1.4l-6-8.2c-0.9-1.4-0.9-3.2,0.9-4.6c1.4-0.9,3.2-0.9,4.6,0.9l6,8.2
						c0.9,1.4,0.9,3.2-0.9,4.6C368.2,390.3,367.7,390.7,367.2,390.7L367.2,390.7z"></path>
					<path d="M90.2,406.7h8.2c7.8,0,17.9-5.5,18.3-12.4v-6H92.5C92.5,394.8,90.2,400.3,90.2,406.7L90.2,406.7z"></path>
					<path d="M478.1,402.2l11,20.1c3.7-2.3,9.2-4.1,13.3-4.1l0,0l0,0l0,0l0,0l0,0l0,0c2.7,0,5.5-1.8,8.7-1.8c0-8.2,0.9-8.7-6.4-14.2
						H478.1L478.1,402.2z"></path>
					<polygon points="299.9,406.7 277,406.7 277,402.2 299.9,402.2 	"></polygon>
					<polygon points="194.6,402.2 171.7,402.2 171.7,397.6 194.6,397.6 	"></polygon>
					<polygon points="222.1,450.7 222.1,457.1 371.4,457.1 	"></polygon>
					<path d="M508.7,436.1c-6.9,0-10.1,0-16.9,0c-3.7,3.7-3.7,8.2-3.7,12.8c6.9,0,13.7,0,20.6,0C508.7,444.8,508.7,440.2,508.7,436.1
						L508.7,436.1z"></path>
					<path d="M488.6,457.1c-1.4-2.7-1.4-6.4-1.4-9.2c6.9,0,7.3,0.5,14.2,0.5v8.7H488.6L488.6,457.1z"></path>
					<path d="M138.3,347.7l-44.4,38.9v-8.7c9.2-12.4,28.4-33.4,32.1-35.7L138.3,347.7L138.3,347.7z"></path>
					<path d="M126.8,500.2c-6-5-10.5-12.4-12.8-20.1h-2.3h-3.7v-4.6v-16c0-12.8,5-24.3,13.7-32.5c8.2-8.2,18.8-13.7,31.6-13.7l0,0
						c12.8,0,24.3,5,32.5,13.7h0.5c8.2,8.2,13.7,19.7,13.7,32.5v14.2v6.9h-4.6h-2.7c-2.3,7.8-6.9,15.1-12.8,20.1c-6.9,6-16,7.8-26.1,7.8
						s-19.2-3.7-26.1-9.6v1.4H126.8z M427.2,440.6c-14.7,0-27,11.9-27,27c0,14.7,11.9,27,27,27c14.7,0,27-11.9,27-27
						C453.8,452.5,441.9,440.6,427.2,440.6L427.2,440.6L427.2,440.6z M152.9,440.6c-14.7,0-27,11.9-27,27c0,14.7,11.9,27,27,27
						c14.7,0,27-11.9,27-27C179.5,452.5,167.6,440.6,152.9,440.6L152.9,440.6L152.9,440.6z M427.2,413.2L427.2,413.2
						c12.8,0,24.3,5,32.5,13.7h0.9c8.2,8.2,13.7,19.7,13.7,32.5v14.2v6.9h-4.6h-3.2c-2.3,7.8-6.9,15.1-12.8,20.1c-6.9,6-16,7.8-26.1,7.8
						s-19.2-3.7-26.1-9.6v1.8c-6-5-10.5-12.4-12.8-20.1h-2.3h-3.7v-4.6v-16c0-12.8,5-24.3,13.7-32.5
						C404.3,418.2,414.4,413.2,427.2,413.2L427.2,413.2L427.2,413.2z M427.2,457.1c6,0,10.5,4.6,10.5,10.5s-4.6,10.5-10.5,10.5
						c-6,0-10.5-4.6-10.5-10.5S421.3,457.1,427.2,457.1L427.2,457.1L427.2,457.1z M152.9,457.1c-6,0-10.5,4.6-10.5,10.5
						s4.6,10.5,10.5,10.5c6,0,10.5-4.6,10.5-10.5C163,461.7,158.4,457.1,152.9,457.1L152.9,457.1z"></path>
				</g>
			</svg>
        <?php } elseif ($id == 6) { ?>
            <svg id="type-h<?= $id ?>"  data-name="Layer 1" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 308.16 143.94">
                <g>
                    <path class="cls-1" d="M161.57,384c0,10.19.53,43.17-5,44.39a18.1,18.1,0,0,1-4,0l-1.19-.09c.76-11.62,1-30.55,1.13-44.3h.06C156,383.89,158.22,384.16,161.57,384Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M373.93,477.9H230.34a3,3,0,0,1,0-6H373.93a3,3,0,0,1,0,6Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M428.05,477.79c-3.31,0-6.53-.14-9.31-.26l-2.07-.08c-.77,0-1.44-.05-2-.05a3,3,0,1,1,0-6c.61,0,1.36,0,2.22.06l2.1.08c17.57.74,26.61-.77,26.86-4.48,0-.14,0-.25,0-.35s0-.21,0-.31a3,3,0,0,1,6-.19c0,.07,0,.14,0,.21h0a7.9,7.9,0,0,1,0,1.1C451.25,476.27,439.12,477.79,428.05,477.79Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M448.84,470.4a3,3,0,0,1-3-3v-.14c0-.27,0-.53,0-.79,0-2,0-3.87.07-5.68,0-1.62.06-3.19.06-4.74a27.46,27.46,0,0,0-.78-4.76c-1.73-1.66-3.65-4.34-3.84-5.21a3.09,3.09,0,0,1,1.08-3.05,3,3,0,0,1,4.21.5,2.54,2.54,0,0,1,.45.8c.5.69,1.85,2.27,2.44,2.88,1.13.71,1.4,2.06,1.87,4.36a25.65,25.65,0,0,1,.57,4.51c0,1.57,0,3.16-.06,4.82s-.06,3.65-.07,5.64v.12c0,.2,0,.4,0,.6v.14A3,3,0,0,1,448.84,470.4Zm-3.34-18.84a3,3,0,0,0,1.5,1h0A5.09,5.09,0,0,1,445.5,451.56Zm1.46-4.8a3,3,0,0,1-.81,1A3,3,0,0,0,447,446.76Zm1.62.05Zm0,0h0Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M444.12,446.9h0a3,3,0,0,1-3-3c.21-16.33-10.69-20-23.32-24.2-5.23-1.75-10.64-3.56-15.2-6.4a3,3,0,1,1,3.17-5.09c4,2.46,8.81,4.08,13.93,5.8,13,4.34,27.69,9.26,27.42,30A3,3,0,0,1,444.12,446.9Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M190.32,477.71a3.28,3.28,0,0,1-.63-.06c-6.3-1.35-13.78-1.48-21.71-1.62-4.3-.07-8.74-.15-13.14-.43a11.77,11.77,0,0,1-11-11.7c0-7.51,0-13.9,0-18.77,0-5.87.8-6.73,1.37-7.36a5.57,5.57,0,0,1,2.28-1.43,69.83,69.83,0,0,0,.85-8.2c.81-12.34,1.05-32.94,1.12-44.13.08-9.67.06-16.87.06-16.94a3,3,0,0,1,.49-1.64c3.32-5.13,4-5.83,5.27-6.6a4.17,4.17,0,0,0,1.08-.94A21.79,21.79,0,0,1,171.46,351c32.18-1.17,159-3.51,180.12,2.49a2.7,2.7,0,0,1,.66.27l9.47,5.33a3.52,3.52,0,0,1,.45.3c7.79,6.46,18.08,18.92,27.15,29.91,5.87,7.13,11.43,13.86,14.94,17.24a3,3,0,1,1-4.16,4.33c-3.76-3.63-9.16-10.17-15.41-17.75-8.82-10.69-18.8-22.79-26.14-28.94l-8.92-5c-19.87-5.25-136.59-3.67-178-2.18a15.86,15.86,0,0,0-11,5,9.89,9.89,0,0,1-2.39,2l-.1.06a40.15,40.15,0,0,0-2.69,3.88c0,2.23,0,8.38-.07,16.11-.07,11.24-.31,32-1.13,44.47-.69,10.43-1.42,12.24-3.57,13.06l-.78.26c-.08.75-.14,1.93-.14,3.26,0,4.87,0,11.27,0,18.78a5.75,5.75,0,0,0,5.36,5.72c4.26.27,8.63.35,12.86.42,8.21.14,16,.28,22.8,1.74a3,3,0,0,1-.56,5.94ZM148.59,436h0Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M330.84,416.4h-13a1.5,1.5,0,0,1,0-3h13a1.5,1.5,0,1,1,0,3Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M352.26,425.77h-8a1.5,1.5,0,0,1,0-3h8a1.5,1.5,0,0,1,0,3Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M272.06,419.4H186.35a1.5,1.5,0,0,1,0-3h85.71a1.5,1.5,0,1,1,0,3Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M209.79,493.51a25.66,25.66,0,0,1-24.19-17.14,25.85,25.85,0,0,1-1.45-8.5,25.64,25.64,0,0,1,51.28,0,24.43,24.43,0,0,1-.35,4.24,24.75,24.75,0,0,1-1,4.09A25.63,25.63,0,0,1,209.79,493.51Zm0-41.28a15.62,15.62,0,0,0-15.39,18.4v0a14.33,14.33,0,0,0,.62,2.38,15.65,15.65,0,0,0,29.56-.11,14.82,14.82,0,0,0,.63-2.46,16.22,16.22,0,0,0,.21-2.61A15.66,15.66,0,0,0,209.79,452.23Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M187.36,474.9a3,3,0,0,1-2.87-2.13,26.82,26.82,0,0,1-1.14-7.69,26.44,26.44,0,1,1,51.85,7.39,3,3,0,1,1-5.77-1.67,20.69,20.69,0,0,0,.8-5.72,20.44,20.44,0,1,0-40,6,3,3,0,0,1-2,3.74A3.26,3.26,0,0,1,187.36,474.9Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M371.91,476.08a3,3,0,0,1-2.86-2.12,26.16,26.16,0,0,1-1.15-7.7,26.44,26.44,0,1,1,52.88,0,26.21,26.21,0,0,1-1,7.4A3,3,0,1,1,414,472a20.44,20.44,0,1,0-39.2.24,3,3,0,0,1-2.87,3.87Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M393.34,493.51a25.7,25.7,0,0,1-24.11-16.91c-.29-.81-.53-1.59-.72-2.33a25.65,25.65,0,1,1,24.83,19.24Zm0-41.28a15.66,15.66,0,0,0-15.64,15.64,15.86,15.86,0,0,0,.5,3.93h0c.11.43.26.91.44,1.41a15.65,15.65,0,0,0,29.64-.68,15.47,15.47,0,0,0,.7-4.66A15.66,15.66,0,0,0,393.34,452.23Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M154.12,430.05a5.23,5.23,0,0,1-2.48-.4A1.5,1.5,0,0,1,153,427a24.72,24.72,0,0,0,3.26-.06h0s2.21-.72,3.25-15.43c.61-8.75.58-18.92.56-25v-1c-1.05,0-2,0-3,0-1.4,0-2.84-.07-4.57,0a1.5,1.5,0,0,1-.12-3c1.83-.07,3.32,0,4.76,0s2.71.07,4.32,0a1.5,1.5,0,0,1,1.55,1.5v2.49c.1,30.6-1.59,42.35-6.22,43.37A25.39,25.39,0,0,1,154.12,430.05Zm-.75-2.85Zm0,0Zm-.43-.2Z" transform="translate(-143.82 -349.58)"/>
                    <circle class="cls-1" cx="65.97" cy="118.3" r="6.83"/>
                    <circle class="cls-1" cx="249.52" cy="118.25" r="6.83"/>
                    <path class="cls-1" d="M327.27,407.73H203l-28.69-15.86V371.68a5.5,5.5,0,0,1,5.67-5.29H327.27a5.5,5.5,0,0,1,5.67,5.29v30.76A5.5,5.5,0,0,1,327.27,407.73Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M394.55,412.08a4.92,4.92,0,0,1-3.34,8l-35.6.12-12.34-12.51V377.89a2.84,2.84,0,0,1,2.83-2.83h18.79l21.62,27.33Z" transform="translate(-143.82 -349.58)"/>
                    <path class="cls-1" d="M444.69,442.81l-5.86,0a2.23,2.23,0,0,1-1.61-.68l-9.11-9.23a2.24,2.24,0,0,1-.65-1.59v-8.14a2.26,2.26,0,0,1,4-1.48l15,17.36A2.26,2.26,0,0,1,444.69,442.81Z" transform="translate(-143.82 -349.58)"/>
                </g>
            </svg>
        <?php } elseif ($id == 7) { ?>
            <svg id="type-h<?= $id ?>" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 302.85 110.6">
                <g>
                <path class="cls-1" d="M445.49,425.18h0c.29.07.56,1.54.56,1.84,0,2.22,0,4.8,0,7.52-3.21-.12-8.29-.23-11.49-.35a4.77,4.77,0,0,1-2.22-.44,4.62,4.62,0,0,1-1.18-1.07c-1.86-2.11-3.57-5.39-5.42-7.5Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M445.38,447.19l.54,0c-.06,1.65-.15,3.23-.26,4.7-2.28.21-10.39.6-10.89-1.09a2.67,2.67,0,0,1,1.53-2.94,7.85,7.85,0,0,1,3.51-.62Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M356.3,409.78A1.53,1.53,0,0,1,356,411c-.41.46-1.15.35-1.74.19A40,40,0,0,1,344,406.78a25.91,25.91,0,0,1,4-7C351.6,401.82,356,405.65,356.3,409.78Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M338.7,448.18H252.24v-.5c0-1.67-.12-4.78-.12-6.45,11.54,2.64,23.4,3.54,35.2,4.43C297.8,446.46,327.24,448.18,338.7,448.18Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M338.15,401.19l-.74.49H173.07c3.17-4.55,6.61-11.17,11.06-17.57,68.11-9.44,123.44-5.5,123.44-5.5,3.15.19,6.33,1.39,9.41,2.1,6.9,1.57,15,6.42,19.09,12.18C337.59,395,338.15,401.19,338.15,401.19Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M158.48,410.19c3.12-.14,11.36.14,14.49,0a23.75,23.75,0,0,1-13.85,9.5c-.39.1-3.91.34-4.22.09C156.13,417.05,157.41,413.43,158.48,410.19Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M376.33,463.18H232.74a3,3,0,0,1,0-6H376.33a3,3,0,0,1,0,6Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M444.24,462.68H417.07a3,3,0,0,1,0-6h27.17a3,3,0,0,1,0,6Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M445.64,429.66a3.06,3.06,0,0,1-1.72-.53c-1.8-1.22-1.64-3.91-1.38-4.74a3.09,3.09,0,0,1,2.95-2.21,3,3,0,0,1,3,3c0,.11,0,.23,0,.35a3,3,0,0,1-.92,3.48A3.06,3.06,0,0,1,445.64,429.66Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M444.24,462.68a3.11,3.11,0,0,1-1.22-.26,3,3,0,0,1-1.52-4c.29-.66.83-2.42,1.17-6.78.11-1.49.19-3,.25-4.58.13-3.78.13-7.86.13-11.81v-.75c0-2.67,0-5.21,0-7.41,0-.08,0-.19-.06-.29a3,3,0,0,1,3.2-4.58c2.83.68,2.86,4.59,2.86,4.76,0,2.24,0,4.8,0,7.5v.77c0,4,0,8.14-.13,12-.06,1.63-.15,3.25-.27,4.82-.32,4.13-.85,6.92-1.67,8.76A3,3,0,0,1,444.24,462.68Zm.57-34.59Zm0,0h0Zm0,0Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M445.51,428.18a3,3,0,0,1-2.12-.88c-10.61-10.61-29.39-15.31-37-16.83a311.66,311.66,0,0,0-38.68-5.29,3,3,0,0,1,.44-6,317.66,317.66,0,0,1,39.42,5.4c8.11,1.63,28.25,6.7,40,18.47a3,3,0,0,1-2.12,5.12Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M192.72,463a3.6,3.6,0,0,1-.66-.07l-3.41-.75c-11.54-2.6-29-7.11-40.41-11.3a3,3,0,0,1-2-2.8l-.06-20.67a5.38,5.38,0,0,1,4.31-6l.11,0a15.3,15.3,0,0,0,1.52-2.82c1-2.19,2.15-5.32,3.47-9.3,1.36-4.16,2.37-7.73,2.38-7.76a3,3,0,0,1,.37-.82c6.26-9.62,13.05-19,20.18-28a3,3,0,0,1,2-1.11c.84-.1,84.76-9.84,140.22-2.87a2.94,2.94,0,0,1,.65.16l3.47,1.26a2.19,2.19,0,0,1,.49.23c15.34,8.95,30.3,19.43,44.32,29.39a3,3,0,0,1-3.48,4.89c-13.83-9.83-28.59-20.16-43.63-29l-2.9-1.05c-51.1-6.35-126.7,1.61-137.22,2.78-6.64,8.39-13,17.19-18.82,26.18-.32,1.09-1.2,4.08-2.33,7.55-1.41,4.25-2.61,7.48-3.7,9.89-1.61,3.58-2.86,5.22-4.48,5.84-.3.12-.6.21-.91.3h0v.23l.05,18.55c11.08,3.88,27,8,37.69,10.37l3.33.73a3,3,0,0,1-.57,5.95Zm-40.47-36.3Zm-1.74-5.15Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M337.41,404.68H173.07a3,3,0,0,1-2.46-4.72c1.39-2,2.9-4.52,4.49-7.18,1.92-3.21,4.1-6.84,6.57-10.39a3,3,0,1,1,4.92,3.43c-2.35,3.38-4.47,6.92-6.34,10l-1.69,2.82H337.41a3,3,0,0,1,0,6Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M338.15,404.19a3,3,0,0,1-3-2.73c-.23-2.54-.92-6-1.53-6.83-3.49-4.88-10.77-9.51-17.32-11-1-.24-2.08-.53-3.08-.81a29.31,29.31,0,0,0-5.84-1.22c-.58,0-55.86-3.81-122.85,5.48a3,3,0,0,1-.82-5.95c67.63-9.37,123.51-5.56,124.06-5.52a34.4,34.4,0,0,1,7.06,1.43c1,.28,1.91.53,2.81.74,8,1.81,16.54,7.31,20.86,13.36,1.85,2.59,2.48,8.14,2.63,9.78a3,3,0,0,1-2.72,3.25Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M306.24,420.68h-13a1.5,1.5,0,0,1,0-3h13a1.5,1.5,0,0,1,0,3Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M240.24,420.68h-15a1.5,1.5,0,0,1,0-3h15a1.5,1.5,0,1,1,0,3Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M355.17,412.78a4.73,4.73,0,0,1-1.28-.19,41,41,0,0,1-10.71-4.53,1.49,1.49,0,0,1-.63-1.82,27.4,27.4,0,0,1,4.26-7.37,1.51,1.51,0,0,1,1.89-.37c4.17,2.3,8.74,6.44,9.09,11.16a3,3,0,0,1-.68,2.32A2.47,2.47,0,0,1,355.17,412.78Zm-9.33-6.64a38.63,38.63,0,0,0,8.82,3.56l.13,0c-.32-2.92-3.28-6-6.43-7.94A24.15,24.15,0,0,0,345.84,406.14Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M445.51,426.68H425.74a1.5,1.5,0,0,1,0-3h19.75a1.5,1.5,0,0,1,0,3Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M446.07,436l-5.75-.18c-2.1-.06-4.2-.11-5.82-.17a5.11,5.11,0,0,1-4.47-2,36.93,36.93,0,0,1-2.85-3.94,35,35,0,0,0-2.57-3.56,1.5,1.5,0,1,1,2.26-2,37.39,37.39,0,0,1,2.81,3.89,37.6,37.6,0,0,0,2.6,3.61,3.72,3.72,0,0,0,.78.74,3.81,3.81,0,0,0,1.54.26c1.63.06,3.72.12,5.81.17l5.69.18a1.51,1.51,0,0,1,1.46,1.52A1.5,1.5,0,0,1,446.07,436Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M441,452.62c-3,0-6.29-.31-6.69-1.66a3.15,3.15,0,0,1,1.78-3.53,8.2,8.2,0,0,1,3.72-.67l5.58-.07h0a.5.5,0,0,1,0,1l-5.57.07a7.44,7.44,0,0,0-3.29.56,2.19,2.19,0,0,0-1.28,2.35c.27.91,5.89,1.15,10.36.74h.16a.5.5,0,0,1,.5.5.51.51,0,0,1-.5.5h-.11C445.21,452.45,443.2,452.62,441,452.62Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M252.24,448.68a1,1,0,0,1-1-1c0-.83,0-2-.06-3.2s-.06-2.41-.06-3.25a1,1,0,0,1,2,0c0,.82,0,2,.06,3.2s.06,2.4.06,3.25A1,1,0,0,1,252.24,448.68Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M338.7,449.18h-2a1,1,0,0,1,0-2h2a1,1,0,0,1,0,2Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M336.74,449.18h-84.5a1,1,0,0,1,0-2h84.5a1,1,0,0,1,0,2Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M338.7,449.18c-12,0-41.87-1.79-51.46-2.53-11.65-.87-23.69-1.78-35.34-4.45a1,1,0,1,1,.44-1.95c11.51,2.63,23.48,3.54,35,4.41,11.32.86,40.1,2.52,51.31,2.52a1,1,0,0,1,0,2Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M212.19,476.79A23.67,23.67,0,0,1,189.88,461h0a23.64,23.64,0,1,1,46-7.83,22.44,22.44,0,0,1-.33,3.89,21.14,21.14,0,0,1-.95,3.78A23.62,23.62,0,0,1,212.19,476.79ZM195.54,459a17.65,17.65,0,0,0,33.34-.12,15.82,15.82,0,0,0,.7-2.81,16.49,16.49,0,0,0,.25-2.91A17.64,17.64,0,1,0,195.54,459Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M189.76,460.18a3,3,0,0,1-2.87-2.14,26.43,26.43,0,1,1,50.7-.3,3,3,0,1,1-5.76-1.66,20.79,20.79,0,0,0,.8-5.72,20.44,20.44,0,1,0-40.88,0,20.81,20.81,0,0,0,.88,5.95,3,3,0,0,1-2,3.74A2.9,2.9,0,0,1,189.76,460.18Z" transform="translate(-146.22 -366.19)"/><path class="cls-1" d="M374.31,461.36a3,3,0,0,1-2.87-2.12,26.15,26.15,0,0,1-1.14-7.7,26.44,26.44,0,0,1,52.88,0,26.19,26.19,0,0,1-1.05,7.39,3,3,0,1,1-5.76-1.69,20.14,20.14,0,0,0,.81-5.7,20.44,20.44,0,0,0-40.88,0,20,20,0,0,0,.88,5.94,3,3,0,0,1-2.87,3.88Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M395.74,476.79a23.7,23.7,0,0,1-22.23-15.59c-.27-.75-.5-1.48-.67-2.15a24.09,24.09,0,0,1-.74-5.9,23.64,23.64,0,0,1,47.28,0,23.63,23.63,0,0,1-23.64,23.64Zm0-41.28a17.66,17.66,0,0,0-17.64,17.64,17.91,17.91,0,0,0,.56,4.42h0c.12.49.29,1,.49,1.59a17.64,17.64,0,0,0,33.43-.76,17.44,17.44,0,0,0,.8-5.25A17.66,17.66,0,0,0,395.74,435.51Z" transform="translate(-146.22 -366.19)"/>
                <path class="cls-1" d="M156.32,421.4a4.27,4.27,0,0,1-2.36-.46,1.5,1.5,0,0,1,1.46-2.57,24.1,24.1,0,0,0,3.38-.15,22.33,22.33,0,0,0,11-6.49l-4.11,0c-2.77,0-5.64-.07-7.15,0a1.5,1.5,0,0,1-.14-3c1.6-.07,4.38,0,7.33,0,2.77,0,5.64.07,7.16,0a1.5,1.5,0,0,1,1.3,2.35,25.35,25.35,0,0,1-14.73,10.11A24.33,24.33,0,0,1,156.32,421.4Zm-.48-2.79Z" transform="translate(-146.22 -366.19)"/><circle class="cls-1" cx="65.97" cy="86.96" r="6.83"/><circle class="cls-1" cx="249.52" cy="86.92" r="6.83"/>
                </g>
            </svg>
        <?php } else { ?>
            <svg version="1.1" id="type-h<?= $id ?>" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="47.6 310.9 500 220" enable-background="new 47.6 310.9 500 220" xml:space="preserve">
                <g>
                    <path d="M249.1,378.4h-0.9c-4.1,0.5-6,4.1-7.3,8.2l-2.3,8.7c-4.1,12.8,19.2,12.8,18.8,1.8v-11.4
                        C256.9,381.1,253.7,377.9,249.1,378.4L249.1,378.4z"></path>
                    <path d="M142,488.3c-21.1,0-41.7-14.2-42.6-14.7l-2.3-1.4v-32.1l2.3-1.4c0.9-1.8,2.3-7.3,2.3-11.9v-30.2l58.6-3.7
                        c25.2-1.4,40.8,1.4,58.2,4.1c9.6,1.4,19.7,3.2,31.6,4.1h95.2c5.5,0,11-0.9,16.9-1.4c6-0.9,11.9-1.8,18.3-1.8
                        c0.9,0,38.9,4.1,69.6,11.9c33,8.2,44,21.5,45.3,27.5l2.7,47.2l-4.1,0.9c-7.8,1.8-14.2,2.7-31.1,2.7h-18.3v-9.2h16
                        c12.8,0,19.7-0.5,25.2-1.8v-2.7v-35.7c-0.5-1.4-9.6-11.9-38-19.2c-29.8-7.8-67.3-11.9-67.8-11.9c-5,0-10.5,0.5-16.5,1.4
                        c-6,0.9-11.9,1.8-18.3,1.8h-95.7c-12.8-0.9-22.9-2.7-33-4.1c-16.5-2.7-31.6-4.6-55.9-3.7l-49.9,2.7v21.5c0,6.4-3.2,12.8-4.6,15.6
                        v23.8c6,3.7,22.9,12.4,38,11.9h12.4v9.2h-14.2C142,488.3,142.4,488.3,142,488.3L142,488.3z M394.7,488.3H207v-9.2h187.7V488.3
                        L394.7,488.3z"></path>
                    <path d="M106.2,415.9c0,4.6-1.8,9.6-1.8,12.4h6.4c7.8,0,17.9-6,18.3-12.4v-6h-22.9V415.9L106.2,415.9L106.2,415.9z"></path>
                    <path d="M458.8,433.3l9.2,16.5c3.2-1.8,7.3-2.7,11-2.7l0,0l0,0l0,0l0,0l0,0l0,0c4.6,0,9.6,0,14.2,0v-0.9c-0.5-1.4-5-9.2-9.6-12.8
                        C475.3,433.3,467.1,433.3,458.8,433.3L458.8,433.3z"></path>
                    <path d="M213.4,488.3c-1.8,3.7-4.1,6.9-6.9,9.6l0,0c-6.4,6.4-14.7,10.1-24.3,10.1s-17.9-4.1-24.3-10.1c-2.7-2.7-5-6-6.9-9.6h-4.6
                        h-3.7v-4.6v-12.4c0-11,4.6-21.5,11.9-28.8c7.3-7.3,16.5-11.9,27.5-11.9l0,0c11,0,21.1,4.1,28.8,11.4l0,0h2.3
                        c7.3,7.3,11.9,17.4,11.9,28.8v12.4v4.6h-4.6h-7.3V488.3L213.4,488.3z M420.4,449.3c-13.3,0-23.8,10.5-23.8,23.8
                        s10.5,23.8,23.8,23.8c13.3,0,23.8-10.5,23.8-23.8C444.6,460.3,433.6,449.3,420.4,449.3L420.4,449.3L420.4,449.3z M182.2,449.3
                        c-13.3,0-23.8,10.5-23.8,23.8S169,497,182.2,497s23.8-10.5,23.8-23.8C206.5,460.3,195.5,449.3,182.2,449.3L182.2,449.3L182.2,449.3
                        z M420.4,431L420.4,431c11,0,21.1,4.1,28.8,11.4l0,0h2.3c7.3,7.3,11.9,17.4,11.9,28.8v12.4v4.6h-4.6h-7.3c-1.8,3.7-4.1,6.9-6.9,9.6
                        c-6.4,6.4-14.7,10.1-24.3,10.1c-9.6,0-17.9-3.7-24.3-10.1l0,0c-2.7-2.7-5-6-6.9-9.6h-4.6H381v-4.6v-12.4c0-11,4.6-21.1,11.9-28.8
                        H392l0,0C399.3,435.6,409.4,431,420.4,431L420.4,431z"></path>
                    <path d="M420.4,464.9c-4.6,0-8.7,3.7-8.7,8.7c0,4.6,4.1,8.7,8.7,8.7s8.7-3.7,8.7-8.7C429.1,468.6,425.4,464.9,420.4,464.9
                        L420.4,464.9z"></path>
                    <polygon points="266.5,424.2 243.6,424.2 243.6,419.6 266.5,419.6 	"></polygon>
                    <path d="M182.2,464.9c-5,0-8.7,3.7-8.7,8.7c0,4.6,3.7,8.7,8.7,8.7c4.6,0,8.7-3.7,8.7-8.7C190.9,468.6,187.3,464.9,182.2,464.9
                        L182.2,464.9z"></path>
                    <polygon points="234.4,464 234.4,469.9 367.7,469.9 	"></polygon>
                    <polygon points="490.9,469.9 481.7,469.9 481.7,465.4 490.9,465.4 	"></polygon>
                    <path d="M483.1,460.8h-6.9c-1.8,0-3.2,1.8-3.2,3.7v2.3c0,1.8,1.4,3.2,3.2,3.2h6.9c1.8,0,3.2-1.4,3.2-3.2v-2.3
                        C486.3,462.2,484.9,460.8,483.1,460.8L483.1,460.8z"></path>
                    <path d="M101.7,465.4v13.3h36.6v-0.9C123.6,476.4,107.6,469,101.7,465.4L101.7,465.4z"></path>
                    <path d="M185,376.1L185,376.1c-4.1,0.5-6,4.1-6.9,8.2l-2.7,8.7c-0.5,0.9-0.5,1.4-0.5,1.8c6.4,0.5,11.9,0.9,18.3,1.4
                        c0-0.5,0-0.9,0-1.4v-11.4C192.8,378.8,189.6,375.6,185,376.1L185,376.1z"></path>
                    <path d="M383.3,398.5c0,0-46.7-28.4-65.9-34.3c-2.3-0.9-4.6-1.4-6.9-1.8l0,0c-2.3-0.5-5-0.9-7.8-1.4l-1.8,9.2
                        c24.3,6,33.9,21.1,54.9,33.9c3.2,1.8,19.2,0.9,22.4,2.7L383.3,398.5L383.3,398.5z"></path>
                    <path d="M337.5,400.8L337.5,400.8c-2.7,2.7-4.1,6-4.1,9.6c0,1.4,0.5,2.3,1.4,3.2c0.9,0.9,1.8,1.4,3.2,1.4H348
                        c1.8,0,3.2-0.9,4.1-2.3c0.9-1.4,0.9-3.2,0-4.6c-1.8-3.2-5-6.4-10.1-8.2C340.2,399,338.4,399.4,337.5,400.8L337.5,400.8z"></path>
                    <path d="M345.7,412.7c-0.9,0-1.8-0.5-2.7-1.4l-6-8.2c-0.9-1.4-0.9-3.2,0.5-4.6c1.4-0.9,3.2-0.9,4.6,0.9l6,8.2
                        c0.9,1.4,0.9,3.2-0.9,4.6C347.1,412.7,346.6,412.7,345.7,412.7L345.7,412.7z"></path>
                </g>
            </svg>
        <?php }

    }

    function maxPricesql() {
        $allSearch = new Search();
        $allSearch->order('i_price', 'DESC');
        $allSearch->limit(0, 1);

        $result = $allSearch->doSearch();
        $result = $result[0];

        $max_price = isset($result['i_price']) ? $result['i_price'] : 0;
        return $max_price/1000000;
    }

    if(!function_exists('san_auto_default_location_show_as')) {
        function san_auto_default_location_show_as() {
            return osc_get_preference('defaultLocationShowAs','san_auto');
        }
    }

    if(!function_exists('san_auto_default_image')) {
        function san_auto_default_image() {
            return osc_get_preference('defaultSlide','san_auto');
        }
    }

    if(!function_exists('pop_items')) {
        function pop_items() {
            return osc_get_preference('pop_items','san_auto');
        }
    }

    if(!function_exists('prem_items')) {
        function prem_items() {
            return osc_get_preference('prem_items','san_auto');
        }
    }

    if(!function_exists('make_items')) {
        function make_items() {
            return osc_get_preference('make_items','san_auto');
        }
    }

    if(!function_exists('lat_items')) {
        function lat_items() {
            return osc_get_preference('lat_items','san_auto');
        }
    }

    if(!function_exists('san_auto_location_show_as')) {
        function san_auto_location_show_as() {
            return osc_get_preference('loc_home','san_auto');
        }
    }

    // install update options
    if( !function_exists('san_auto_install') ) {
        function san_auto_install() {
            osc_set_preference('version', SAN_AUTO_VERSION, 'san_auto');
            // settings
            osc_set_preference('phone_text', '', 'san_auto');
            osc_set_preference('email_text', 'info@san-osclass.com', 'san_auto');
            osc_set_preference('fc_text', 'https://www.facebook.com/groups/1868560996730226/', 'san_auto');
            osc_set_preference('tw_text', 'https://twitter.com/OsclassSan', 'san_auto');
            osc_set_preference('ins_text', '', 'san_auto');
            osc_set_preference('pin_text', '', 'san_auto');
            osc_set_preference('vk_text', 'https://vk.com/osclass_themes', 'san_auto');
            osc_set_preference('wt_text', '', 'san_auto');
            osc_set_preference('viber_text', '', 'san_auto');
            osc_set_preference('tg_text', '', 'san_auto');
            osc_set_preference('you_text', '', 'san_auto');
            osc_set_preference('color', 'green', 'san_auto');
            osc_set_preference('text_color', '', 'san_auto');
            // home
            osc_set_preference('keyword_placeholder', 'ie. Aston Martin', 'san_auto');
            osc_set_preference('h1_text', 'Search and Find Your Auto', 'san_auto');
            osc_set_preference('h2_text', 'Auto for sale and for rent', 'san_auto');
            osc_set_preference('defaultSlide', 'image', 'san_auto');
            osc_set_preference('pop_items', 'on', 'san_auto');
            osc_set_preference('pop_count', '8', 'san_auto');
            osc_set_preference('prem_items', 'on', 'san_auto');
            osc_set_preference('prem_count', '8', 'san_auto');
            osc_set_preference('make_items', 'on', 'san_auto');
            osc_set_preference('make_count', '20', 'san_auto');
            osc_set_preference('lat_items', 'on', 'san_auto');
            osc_set_preference('loc_home', 'region', 'san_auto');
            osc_set_preference('prempos', '1', 'san_auto');
            osc_set_preference('makepos', '2', 'san_auto');
            osc_set_preference('lastpos', '3', 'san_auto');
            osc_set_preference('poppos', '4', 'san_auto');
            //register
            osc_set_preference('user_type', false, 'san_auto');
            osc_set_preference('phone', false, 'san_auto');
            osc_set_preference('loc', false, 'san_auto');
            //post
            osc_set_preference('cityarea', true, 'san_auto');
            osc_set_preference('cityarea_req', true, 'san_auto');
            osc_set_preference('price_req', true, 'san_auto');
            osc_set_preference('name_req', true, 'san_auto');
            osc_set_preference('address_req', true, 'san_auto');
            osc_set_preference('loc_req', true, 'san_auto');
            osc_set_preference('agree', false, 'san_auto');
            osc_set_preference('agree_link', '', 'san_auto');
            osc_set_preference('agree2', false, 'san_auto');
            osc_set_preference('agree_link2', '', 'san_auto');
            //search
            osc_set_preference('rtl', true,'san_auto');
			osc_set_preference('def_view', '1', 'san_auto');
            //item
            osc_set_preference('rtl2', true,'san_auto');
            osc_set_preference('useful', true,'san_auto');
            osc_set_preference('mark', true,'san_auto');
            // footer
            osc_set_preference('footer_link', true, 'san_auto');
            osc_set_preference('cat', true, 'san_auto');
            osc_set_preference('cat_count', '2', 'san_auto');
            osc_set_preference('cust', true, 'san_auto');
            osc_set_preference('about', true, 'san_auto');
            osc_set_preference('follow', true, 'san_auto');
            osc_set_preference('logo_footer', true, 'san_auto');
            // related
			osc_set_preference('related_num', '4','san_auto');

			if (!is_dir(osc_base_path().'oc-content/uploads/san_auto_users_images')) {
    			@mkdir(osc_base_path().'oc-content/uploads/san_auto_users_images', 0755, true);
			}

            osc_reset_preferences();
        }
    }


    function theme_san_auto_actions_admin() {

        switch( Params::getParam('action_specific') ) {
            case('general'):
                $defaultLogo = Params::getParam('default_logo');
                osc_set_preference('keyword_placeholder', Params::getParam('keyword_placeholder'), 'san_auto');

                osc_set_preference('phone_text', Params::getParam('phone_text'), 'san_auto');
                osc_set_preference('email_text', Params::getParam('email_text'), 'san_auto');
                osc_set_preference('fc_text', Params::getParam('fc_text'), 'san_auto');
    			osc_set_preference('tw_text', Params::getParam('tw_text'), 'san_auto');
    			osc_set_preference('ins_text', Params::getParam('ins_text'), 'san_auto');
    			osc_set_preference('pin_text', Params::getParam('pin_text'), 'san_auto');
    			osc_set_preference('vk_text', Params::getParam('vk_text'), 'san_auto');
    			osc_set_preference('wt_text', Params::getParam('wt_text'), 'san_auto');
    			osc_set_preference('viber_text', Params::getParam('viber_text'), 'san_auto');
    			osc_set_preference('tg_text', Params::getParam('tg_text'), 'san_auto');
    			osc_set_preference('you_text', Params::getParam('you_text'), 'san_auto');
                osc_set_preference('color', Params::getParam('color'), 'san_auto');
	            osc_set_preference('text_color', Params::getParam('text_color'), 'san_auto');

                osc_add_flash_ok_message(__('Basic settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#general')); exit;
            break;

            case('home'):
                osc_set_preference('defaultSlide', Params::getParam('defaultSlide'), 'san_auto');
                osc_set_preference('h1_text', Params::getParam('h1_text'), 'san_auto');
                osc_set_preference('h2_text', Params::getParam('h2_text'), 'san_auto');
				osc_set_preference('pop_items', Params::getParam('pop_items'), 'san_auto');
				osc_set_preference('pop_count', Params::getParam('pop_count'), 'san_auto');
                osc_set_preference('prem_items', Params::getParam('prem_items'), 'san_auto');
				osc_set_preference('prem_count', Params::getParam('prem_count'), 'san_auto');
                osc_set_preference('make_items', Params::getParam('make_items'), 'san_auto');
				osc_set_preference('make_count', Params::getParam('make_count'), 'san_auto');
                osc_set_preference('lat_items', Params::getParam('lat_items'), 'san_auto');
                osc_set_preference('loc_home', Params::getParam('loc_home'), 'san_auto');

                osc_set_preference('prempos', Params::getParam('prempos'), 'san_auto');
                osc_set_preference('makepos', Params::getParam('makepos'), 'san_auto');
                osc_set_preference('lastpos', Params::getParam('lastpos'), 'san_auto');
                osc_set_preference('poppos', Params::getParam('poppos'), 'san_auto');

                osc_add_flash_ok_message(__('Home settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#theme-settings')); exit;
            break;

            case 'background':
                $package = Params::getFiles('background_images');
                if( $package['error'] == UPLOAD_ERR_OK ) {
                    $img = ImageResizer::fromFile($package['tmp_name']);
                    $path = osc_base_path().'oc-content/themes/san_auto/images/header.jpg' ;
                    $img->saveToFile($path);
                    osc_add_flash_ok_message(__('The image has been uploaded correctly', 'san_auto'), 'admin');
                } else {
                    osc_add_flash_error_message(__("An error has occurred, please try again", 'san_auto'), 'admin');
                }
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#theme-settings'));
            break;

            case 'background_page':
                $package = Params::getFiles('background_pic');
                if( $package['error'] == UPLOAD_ERR_OK ) {
                    $img = ImageResizer::fromFile($package['tmp_name']);
                    $path = osc_base_path().'oc-content/themes/san_auto/images/page-cover.jpg' ;
                    $img->saveToFile($path);
                    osc_add_flash_ok_message(__('The image has been uploaded correctly', 'san_auto'), 'admin');
                } else {
                    osc_add_flash_error_message(__("An error has occurred, please try again", 'san_auto'), 'admin');
                }
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#general'));
            break;

            case 'register':
                $user_type  = Params::getParam('user_type');
                $phone  = Params::getParam('phone');
                $loc  = Params::getParam('loc');
                $info  = Params::getParam('info');
                $agree2  = Params::getParam('agree2');
                $agree_link2  = Params::getParam('agree_link2');

                osc_set_preference('user_type', ($user_type ? '1' : '0'), 'san_auto');
                osc_set_preference('phone', ($phone ? '1' : '0'), 'san_auto');
                osc_set_preference('loc', ($loc ? '1' : '0'), 'san_auto');
                osc_set_preference('info', ($info ? '1' : '0'), 'san_auto');
                osc_set_preference('agree2', ($agree2 ? '1' : '0'), 'san_auto');
                osc_set_preference('agree_link2', $agree_link2, 'san_auto');

                osc_add_flash_ok_message(__('Register settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#theme-settings')); exit;
            break;

            case 'post':
                $cityarea  = Params::getParam('cityarea');
                $cityarea_req  = Params::getParam('cityarea_req');
                $price_req  = Params::getParam('price_req');
                $name_req  = Params::getParam('name_req');
                $address_req  = Params::getParam('address_req');
                $loc_req  = Params::getParam('loc_req');
                $agree  = Params::getParam('agree');
                $agree_link  = Params::getParam('agree_link');

                osc_set_preference('cityarea', ($cityarea ? '1' : '0'), 'san_auto');
                osc_set_preference('cityarea_req', ($cityarea_req ? '1' : '0'), 'san_auto');
                osc_set_preference('price_req', ($price_req ? '1' : '0'), 'san_auto');
                osc_set_preference('name_req', ($name_req ? '1' : '0'), 'san_auto');
                osc_set_preference('address_req', ($address_req ? '1' : '0'), 'san_auto');
                osc_set_preference('loc_req', ($loc_req ? '1' : '0'), 'san_auto');
                osc_set_preference('agree', ($agree ? '1' : '0'), 'san_auto');
                osc_set_preference('agree_link', $agree_link, 'san_auto');

                osc_add_flash_ok_message(__('Item-post settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#theme-settings')); exit;
            break;

            case 'search':
                $rtl  = Params::getParam('rtl');

                osc_set_preference('rtl', ($rtl ? '1' : '0'), 'san_auto');
				osc_set_preference('def_view', Params::getParam('def_view'), 'san_auto');

                osc_add_flash_ok_message(__('Search settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#theme-settings')); exit;
            break;

            case 'item':
                $rtl2  = Params::getParam('rtl2');
                $mark  = Params::getParam('mark');
                $useful  = Params::getParam('useful');

                osc_set_preference('rtl2', ($rtl2 ? '1' : '0'), 'san_auto');
                osc_set_preference('mark', ($mark ? '1' : '0'), 'san_auto');
                osc_set_preference('useful', ($useful ? '1' : '0'), 'san_auto');

                osc_add_flash_ok_message(__('Item-page settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#theme-settings')); exit;
            break;

            case 'footer':
                $footerLink  = Params::getParam('footer_link');
                $cust  = Params::getParam('cust');
                $cat  = Params::getParam('cat');
                $catCount  = Params::getParam('cat_count');
                $about = Params::getParam('about');
                $follow = Params::getParam('follow');
                $logo_footer = Params::getParam('logo_footer');

                osc_set_preference('footer_link', ($footerLink ? '1' : '0'), 'san_auto');
                osc_set_preference('cust', ($cust ? '1' : '0'), 'san_auto');
                osc_set_preference('cat', ($cat ? '1' : '0'), 'san_auto');
                osc_set_preference('cat_count', $catCount, 'san_auto');
                osc_set_preference('about', ($about ? '1' : '0'), 'san_auto');
                osc_set_preference('follow', ($follow ? '1' : '0'), 'san_auto');
                osc_set_preference('logo_footer', ($logo_footer ? '1' : '0'), 'san_auto');

                osc_add_flash_ok_message(__('Footer settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#theme-settings')); exit;
            break;

            case 'ads':
                $hide_ads  = Params::getParam('hide_ads');
                osc_set_preference('hide_ads', ($hide_ads ? '1' : '0'), 'san_auto');
                osc_set_preference('header-728x90', trim(Params::getParam('header-728x90', false, false, false)),'san_auto');
                osc_set_preference('footer-728x90', trim(Params::getParam('footer-728x90', false, false, false)), 'san_auto');
                osc_set_preference('homepage-top-728x90', trim(Params::getParam('homepage-top-728x90', false, false, false)),'san_auto');
                osc_set_preference('homepage-728x90', trim(Params::getParam('homepage-728x90', false, false, false)), 'san_auto');
                osc_set_preference('sidebar-300x250', trim(Params::getParam('sidebar-300x250', false, false, false)), 'san_auto');
                osc_set_preference('search-results-top-728x90', trim(Params::getParam('search-results-top-728x90', false, false, false)), 'san_auto');
                osc_set_preference('search-results-bottom-728x90', trim(Params::getParam('search-results-bottom-728x90', false, false, false)),'san_auto');


                osc_add_flash_ok_message(__('Ads settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#ads-menagement')); exit;
            break;

            case 'related_san_auto':
		        osc_set_preference('related_num' , '4', 'san_auto', 'INTEGER');
	            osc_set_preference('related_category'   , '1','san_auto','INTEGER');

                osc_add_flash_ok_message(__('Related settings updated correctly', 'san_auto'), 'admin');
                header('Location: ' . osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php#related')); exit;
            break;

            case('upload_logo_header'):
                $package = Params::getFiles('logo');
                if( $package['error'] == UPLOAD_ERR_OK ) {
                    $img = ImageResizer::fromFile($package['tmp_name']);
                    $ext = $img->getExt();
                    $logo_name     = 'logo-header';
                    $logo_name    .= '.'.$ext;
                    $path = osc_uploads_path() . $logo_name ;
                    $img->saveToFile($path);

                    osc_set_preference('logo', $logo_name, 'san_auto');

                    osc_add_flash_ok_message(__('The logo image has been uploaded correctly', 'san_auto'), 'admin');
                } else {
                    osc_add_flash_error_message(__("An error has occurred, please try again", 'san_auto'), 'admin');
                }
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/san_auto/admin/header-logo.php'));
            break;

            case('remove_header'):
                $logo = osc_get_preference('logo','san_auto');
                $path = osc_uploads_path() . $logo ;
                if(file_exists( $path ) ) {
                    @unlink( $path );
                    osc_delete_preference('logo','san_auto');
                    osc_reset_preferences();
                    osc_add_flash_ok_message(__('The logo image has been removed', 'san_auto'), 'admin');
                } else {
                    osc_add_flash_error_message(__("Image not found", 'san_auto'), 'admin');
                }

                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/san_auto/admin/header-logo.php'));
            break;

            case('upload_logo_footer'):
                $package2 = Params::getFiles('logo_footer');
                if( $package2['error'] == UPLOAD_ERR_OK ) {
                    $img2 = ImageResizer::fromFile($package2['tmp_name']);
                    $ext2 = $img2->getExt();
                    $logo_name2     = 'logo-footer';
                    $logo_name2    .= '.'.$ext2;
                    $path2 = osc_uploads_path() . $logo_name2 ;
                    $img2->saveToFile($path2);

                    osc_set_preference('logo_footer', $logo_name2, 'san_auto');

                    osc_add_flash_ok_message(__('The logo image has been uploaded correctly', 'san_auto'), 'admin');
                } else {
                    osc_add_flash_error_message(__("An error has occurred, please try again", 'san_auto'), 'admin');
                }
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/san_auto/admin/footer-logo.php'));
            break;

            case('remove_footer'):
                $logo_footer = osc_get_preference('logo_footer','san_auto');
                $path2 = osc_uploads_path() . $logo_footer ;
                if(file_exists( $path2 ) ) {
                    @unlink( $path2 );
                    osc_delete_preference('logo_footer','san_auto');
                    osc_reset_preferences();
                    osc_add_flash_ok_message(__('The logo image has been removed', 'san_auto'), 'admin');
                } else {
                    osc_add_flash_error_message(__("Image not found", 'san_auto'), 'admin');
                }

                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/san_auto/admin/footer-logo.php'));
            break;

        }
    }
    osc_add_hook('init_admin', 'theme_san_auto_actions_admin');

    AdminMenu::newInstance()->add_menu(__('Theme Setting', 'san_auto'), osc_admin_render_theme_url('oc-content/themes/' . osc_current_web_theme() . '/admin/settings.php'), 'san_auto_menu');
    AdminMenu::newInstance()->add_submenu_divider( 'san_auto_menu', __('Theme Settings', 'san_auto'), 'san_auto_submenu');
    AdminMenu::newInstance()->add_submenu( 'san_auto_menu', __('Header logo', 'san_auto'), osc_admin_render_theme_url('oc-content/themes/' . osc_current_web_theme() . '/admin/header-logo.php'), 'header_san_auto', 'administrator');
    AdminMenu::newInstance()->add_submenu( 'san_auto_menu', __('Footer logo', 'san_auto'), osc_admin_render_theme_url('oc-content/themes/' . osc_current_web_theme() . '/admin/footer-logo.php'), 'footer_san_auto', 'administrator');
    AdminMenu::newInstance()->add_submenu( 'san_auto_menu', __('Theme settings', 'san_auto'), osc_admin_render_theme_url('oc-content/themes/' . osc_current_web_theme() . '/admin/settings.php'), 'settings_san_auto');


    function san_auto_admin_menu_fixed(){
      echo '<style>' . PHP_EOL;
      echo 'body.compact #san_auto_menu .ico-san_auto_menu {bottom:-6px!important;width:100%!important;height:28px!important;margin:0!important;background: #fff url(http://san-osclass.com/img/auto.png) no-repeat center center/cover !important;}' . PHP_EOL;
      echo 'body.compact #san_auto_menu .ico-san_auto_menu:hover {background-color:rgba(255,255,255,0.95)!important;}' . PHP_EOL;
      echo 'body.compact #menu_san_auto_menu > h3 {bottom:0!important;}' . PHP_EOL;
      echo 'body.compact #menu_san_auto_menu > ul {border-top-left-radius:0px!important;margin-top:1px!important;}' . PHP_EOL;
      echo 'body:not(.compact) #san_auto_menu .ico-san_auto_menu {background: transparent url(http://san-osclass.com/img/auto.png) no-repeat center center/cover !important;}' . PHP_EOL;
      echo '</style>' . PHP_EOL;
    }

    osc_add_hook('admin_header', 'san_auto_admin_menu_fixed');

    if( !function_exists('logo_header')) {
        function logo_header() {
             $logo = osc_get_preference('logo','san_auto');
             $html = '<a href="'.osc_base_url().'"><img border="0" alt="' . osc_esc_html(osc_page_title()) . '" src="' . san_auto_logo_url() . '"></a>';
             if( $logo!='' && file_exists( osc_uploads_path() . $logo )) {
                return $html;
             } else {
                return '<a href="'.osc_base_url().'"><img border="0" height="50" width="auto" alt="' . osc_page_title() . '" src="' . osc_current_web_theme_url('images/default-logo-header.png') . '" /></a>';
            }
        }
    }

    if( !function_exists('logo_footer')) {
        function logo_footer() {
             $logo = osc_get_preference('logo_footer','san_auto');
             $html = '<a href="'.osc_base_url().'"><img border="0" alt="' . osc_esc_html(osc_page_title()) . '" src="' . san_auto_logo_url() . '"></a>';
             if( $logo!='' && file_exists( osc_uploads_path() . $logo )) {
                return $html;
             } else {
                return '<a href="'.osc_base_url().'"><img border="0" height="50" width="auto" alt="' . osc_page_title() . '" src="' . osc_current_web_theme_url('images/default-logo-footer.png') . '" /></a>';
            }
        }
    }

    if( !function_exists('san_auto_logo_url')) {
        function san_auto_logo_url() {
            $logo = osc_get_preference('logo','san_auto');
            $logo2 = osc_get_preference('logo_footer','san_auto');
            if( $logo ) {
                return osc_uploads_url($logo);
            }
            if( $logo2 ) {
                return osc_uploads_url($logo2);
            }
            return false;
        }
    }

    if( !function_exists('osc_uploads_url')){
	    function osc_uploads_url($item = ''){
	        return osc_base_url().'oc-content/uploads/'.$item;
	    }
	}

    if(!function_exists('check_install_san_auto')) {
        function check_install_san_auto() {
            $current_version = osc_get_preference('version', 'san_auto');
            //check if current version is installed or need an update
            if( !$current_version ) {
                san_auto_install();
            }
        }
    }

    check_install_san_auto();



    /* ads  SEARCH */
    if (!function_exists('search_ads_listing_top_fn')) {
	    function search_ads_listing_top_fn() {
			if(osc_get_preference('hide_ads', 'san_auto') !== '0') {
		        if(osc_get_preference('search-results-top-728x90', 'san_auto')!='') {
					echo '<div class="figure-rek">' . PHP_EOL;
		            echo '<div class="i728-90">' . PHP_EOL;
		            echo osc_get_preference('search-results-top-728x90', 'san_auto');
		            echo '</div>' . PHP_EOL;
		            echo '</div>' . PHP_EOL;
		        }
			}
	    }
	}
	osc_add_hook('search_ads_listing_top', 'search_ads_listing_top_fn');

	if (!function_exists('search_ads_listing_bottom_fn')) {
	    function search_ads_listing_bottom_fn() {
			if(osc_get_preference('hide_ads', 'san_auto') !== '0') {
		        if(osc_get_preference('search-results-bottom-728x90', 'san_auto')!='') {
					echo '<div class="figure-rek">' . PHP_EOL;
		            echo '<div class="i728-90">' . PHP_EOL;
		            echo osc_get_preference('search-results-bottom-728x90', 'san_auto');
					echo '</div>' . PHP_EOL;
		            echo '</div>' . PHP_EOL;
		        }
			}
	    }
	}
	osc_add_hook('search_ads_listing_bottom', 'search_ads_listing_bottom_fn');

	if (!function_exists('search_ads_listing_medium_fn')) {
	    function search_ads_listing_medium_fn() {
			if(osc_get_preference('hide_ads', 'san_auto') !== '0') {
		        if(osc_get_preference('search-results-middle-728x90', 'san_auto')!='') {
		            echo '<div class="figure-rek">' . PHP_EOL;
		            echo '<div class="i728-90">' . PHP_EOL;
		            echo osc_get_preference('search-results-middle-728x90', 'san_auto');
		            echo '</div>' . PHP_EOL;
		            echo '</div>' . PHP_EOL;
		        }
			}
	    }
	}
	osc_add_hook('search_ads_listing_medium', 'search_ads_listing_medium_fn');


    /* remove theme */
    function san_auto_delete() {
      Preference::newInstance()->delete(array('s_section' => 'san_auto'));
    }
    osc_add_hook('theme_delete_san_auto', 'san_auto_delete');
?>
