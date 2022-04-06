<?php

if( !function_exists('osc_plugin_path') ) {
    function osc_plugin_path($file) {
        $file = preg_replace('|/+|','/', str_replace('\\','/',$file));
        $plugin_path = preg_replace('|/+|','/', str_replace('\\','/', PLUGINS_PATH));
        $file = $plugin_path . preg_replace('#^.*oc-content\/plugins\/#','',$file);
        return $file;
    }
}

function seo_sitemap_generator() {
    $min = 1;

    $show_items            = '';
    $dao_preference = new Preference();
    if(Params::getParam('sitemap_items') != '') {
      $show_items = Params::getParam('sitemap_items');
    } else {
      $show_items = (osc_get_preference('seoplugin_sitemap_items', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_sitemap_items', 'plugin-seo_plugin') : '' ;
    }

    $limit_items            = '';
    $dao_preference = new Preference();
    if(Params::getParam('sitemap_items_limit') != '') {
      $limit_items = Params::getParam('sitemap_items_limit');
    } else {
      $limit_items = (osc_get_preference('seoplugin_sitemap_items_limit', 'plugin-seo_plugin') != '') ? osc_get_preference('seoplugin_sitemap_items_limit', 'plugin-seo_plugin') : '' ;
    }

    //$show_items = osc_get_preference('seoplugin_sitemap_items', 'plugin-seo_plugin');
    //$limit_items = osc_get_preference('seoplugin_sitemap_items_limit', 'plugin-seo_plugin');
    //$limit_items = intval( $limit_items );

    $locales = osc_get_locales();

    $filename = osc_base_path() . 'sitemap.xml';
    @unlink($filename);
    $start_xml = '<?xml version="1.0" encoding="UTF-8"?>' . PHP_EOL . '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . PHP_EOL;
    file_put_contents($filename, $start_xml);

    // INDEX
    seo_sitemap_add_url(osc_base_url(), date('Y-m-d'), 'always');
 // Category

    if(osc_count_categories () > 0) {
        while ( osc_has_categories() ) {
            seo_sitemap_add_url(osc_search_category_url(), date('Y-m-d'), 'hourly');
            if ( osc_count_subcategories() > 0 ) {
                while ( osc_has_subcategories() ) {
                    seo_sitemap_add_url(osc_search_category_url(), date('Y-m-d'), 'hourly');
                }
            }
        }
    }


    // Regions

    if(osc_count_list_regions() > 0) {
        while ( osc_has_list_regions() ) {
            seo_sitemap_add_url(osc_list_region_url(), date('Y-m-d'), 'weekly');
         }
    }

    // Cities

    if(osc_count_list_cities() > 0) {
        while ( osc_has_list_cities() ) {
            seo_sitemap_add_url(osc_list_city_url(), date('Y-m-d'), 'weekly');
         }
    }

    
    // ITEMS
    $mSearch = new Search() ;
    $mSearch->limit(0,$limit_items) ; // fetch number of item for sitemap
    $aItems = $mSearch->doSearch(); 
	View::newInstance()->_exportVariableToView('items', $aItems); //exporting our searched item array

    if(osc_count_items() > 0) {
        while(osc_has_items()) {
            
                    seo_sitemap_add_url(osc_item_url(), substr(osc_item_mod_date()!=''?osc_item_mod_date():osc_item_pub_date(), 0, 10), 'weekly');
            
        }
    }   



    $end_xml = '</urlset>';
    file_put_contents($filename, $end_xml, FILE_APPEND);
    
    // PING SEARCH ENGINES
    seo_sitemap_ping_engines();
}

function seo_sitemap_add_url($url = '', $date = '', $freq = 'daily') {
    if( preg_match('|\?(.*)|', $url, $match) ) {
        $sub_url = $match[1];
        $param = explode('&', $sub_url);
        foreach($param as &$p) {
            list($key, $value) = explode('=', $p);
            $p = $key . '=' . urlencode($value);
        }
        $sub_url = implode('&', $param);
        $url = preg_replace('|\?.*|', '?' . $sub_url, $url);
    }

    $filename = osc_base_path() . 'sitemap.xml';
    $xml  = '    <url>' . PHP_EOL;
    $xml .= '        <loc>' . htmlentities($url, ENT_QUOTES, "UTF-8") . '</loc>' . PHP_EOL;
    $xml .= '        <lastmod>' . $date . '</lastmod>' . PHP_EOL;
    $xml .= '        <changefreq>' . $freq . '</changefreq>' . PHP_EOL;
    $xml .= '    </url>' . PHP_EOL;
    file_put_contents($filename, $xml, FILE_APPEND);
}


function seo_sitemap_ping_engines() {
   //YANDEX
  osc_doRequest('http://webmaster.yandex.ru/wmconsole/sitemap_list.xml?host='.urlencode(osc_base_url() . 'sitemap.xml'), array());
  // GOOGLE
  osc_doRequest( 'http://www.google.com/webmasters/sitemaps/ping?sitemap='.urlencode(osc_base_url() . 'sitemap.xml'), array());
  // BING
  osc_doRequest( 'http://www.bing.com/webmaster/ping.aspx?siteMap='.urlencode(osc_base_url() . 'sitemap.xml'), array());
}


// Frequency of generate
// CHANGE THIS LINE TO  'cron_hourly' or 'cron_daily' to modify the frequent of running it
// REMOVE IT if you want to generate the sitemap manually
$freq = osc_get_preference('seoplugin_sitemap_freq', 'plugin-seo_plugin');
if( $freq == 'weekly' ) {
  osc_add_hook('cron_weekly', 'seo_sitemap_generator');
} else if ( $freq == 'daily' ) {
  osc_add_hook('cron_daily', 'seo_sitemap_generator');
} else if ( $freq == 'hourly' ) {
  osc_add_hook('cron_hourly', 'seo_sitemap_generator');
} 