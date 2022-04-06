<?php
		   /*
 * Copyright 2015 osclass-pro.com
 *
 * You shall not distribute this plugin and any its files (except third-party libraries) to third parties.
 * Rental, leasing, sale and any other form of distribution are not allowed and are strictly forbidden.
 */
/*
  Plugin Name: SEO Plugin
  Plugin URI: https://osclass-pro.com
  Description: SEO on your Osclass
  Version: 2.3.5
  Short Name: seo_plugin
 */

require_once 'model/ModelSeo.php';
require_once 'model/ModelSeoPage.php';
require_once 'model/ModelSeoCategory.php';
require_once 'model/ModelSeoRegion.php';
require_once 'model/ModelSeoCity.php';
require_once 'model/ModelSeoHome.php';
require_once 'sitemap.php';

function seoplugin_call_after_install() {
  if(file_exists($_SERVER['DOCUMENT_ROOT']."/robots.txt")) {$rob = file_get_contents($_SERVER['DOCUMENT_ROOT']."/robots.txt");} else {$rob = '';}
  ModelSeo::newInstance()->import('seo_plugin/model/struct.sql');
  osc_set_preference('seoplugin_description', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_keywords', 'classifieds, ads, classifieds ads, buy, sell', 'plugin-seo_plugin', 'STRING');
  osc_set_preference('seoplugin_title_first', '0', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_keywords_enabled', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_robots', $rob, 'plugin-seo_plugin', 'STRING');
  osc_set_preference('seoplugin_robots_enabled', '0', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_delimiter', '|', 'plugin-seo_plugin', 'STRING');
  osc_set_preference('seoplugin_city_show', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_city_order', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_region_show', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_region_order', '2', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_country_show', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_country_order', '3', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_category_show', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_category_order', '4', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_title_show', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_title_order', '5', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_body_order', '6', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_sitemap_freq', 'weekly', 'plugin-seo_plugin', 'STRING');
  osc_set_preference('seoplugin_sitemap_items', '1', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_sitemap_items_limit', '1000', 'plugin-seo_plugin', 'INTEGER');
  osc_set_preference('seoplugin_allow_custom_meta', '1', 'plugin-seo_plugin', 'INTEGER');
}

function seoplugin_call_after_uninstall() {
  ModelSeo::newInstance()->uninstall();
  ModelSeoHome::newInstance()->uninstall();
  ModelSeoPage::newInstance()->uninstall();
  ModelSeoCategory::newInstance()->uninstall();
  ModelSeoCity::newInstance()->uninstall();
  ModelSeoRegion::newInstance()->uninstall();

  osc_delete_preference('seoplugin_description', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_keywords', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_title_first', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_keywords_enabled', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_robots', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_robots_enabled', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_delimiter', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_city_show', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_city_order', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_region_show', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_region_order', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_country_show', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_country_order', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_category_show', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_category_order', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_title_show', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_title_order', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_body_order', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_sitemap_freq', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_sitemap_items', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_sitemap_items_limit', 'plugin-seo_plugin');
  osc_delete_preference('seoplugin_allow_custom_meta', 'plugin-seo_plugin');
}

//HELPER functions

if(!function_exists('message_ok')) {
  function message_ok( $text ) {
    $final  = '<div style="padding: 1%;width: 98%;margin-bottom: 15px;" class="flashmessage flashmessage-ok flashmessage-inline">';
    $final .= $text;
    $final .= '</div>';
    echo $final;
  }
}

if(!function_exists('message_error')) {
  function message_error( $text ) {
    $final  = '<div style="padding: 1%;width: 98%;margin-bottom: 15px;" class="flashmessage flashmessage-error flashmessage-inline">';
    $final .= $text;
    $final .= '</div>';
    echo $final;
  }
}

function SeoCityShow(){
	if(osc_get_preference('seoplugin_city_show','plugin-seo_plugin') == 1){
		return osc_item_city();
	}
	return '';
}
function SeoRegionShow(){
	if(osc_get_preference('seoplugin_region_show','plugin-seo_plugin') == 1){
		return osc_item_region();
	}
	return '';
}
function SeoCountryShow(){
	if(osc_get_preference('seoplugin_country_show','plugin-seo_plugin') == 1){
		return osc_item_country();
	}
	return '';
}

function Delimiter(){
	return ' ' . osc_get_preference('seoplugin_delimiter','plugin-seo_plugin') . ' ';
}

function SeoLocationShow(){
	$sort_order = array();
	$elements = array();
	$del = Delimiter();
        $i = 0;
	if(osc_get_preference('seoplugin_city_show','plugin-seo_plugin') == 1){
		$elements[$i] = osc_item_city();
		$sort_order[$i] = osc_get_preference('seoplugin_city_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_region_show','plugin-seo_plugin') == 1){
		$elements[$i] = osc_item_region();
		$sort_order[$i] = osc_get_preference('seoplugin_region_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_country_show','plugin-seo_plugin') == 1){
		$elements[$i] = osc_item_country();
		$sort_order[$i] = osc_get_preference('seoplugin_country_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	
	array_multisort($sort_order, $elements);
        $elements = array_filter( $elements );
	return implode($del, $elements);
}

function SeoCompleteShow(){
	$sort_order = array();
	$elements = array();
	$del = Delimiter();
        $i = 0;
	if(osc_get_preference('seoplugin_city_show','plugin-seo_plugin') == 1){
		$elements[$i] = osc_item_city();
		$sort_order[$i] = osc_get_preference('seoplugin_city_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_region_show','plugin-seo_plugin') == 1){
		$elements[$i] = osc_item_region();
		$sort_order[$i] = osc_get_preference('seoplugin_region_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_country_show','plugin-seo_plugin') == 1){
		$elements[$i] = osc_item_country();
		$sort_order[$i] = osc_get_preference('seoplugin_country_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_title_show','plugin-seo_plugin') == 1){
                if( GetItemTitle() == '') {
		  $elements[$i] = osc_page_title();
                } else {
                  $elements[$i] = GetItemTitle();
                }
		$sort_order[$i] = osc_get_preference('seoplugin_title_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_category_show','plugin-seo_plugin') == 1){
		$elements[$i] = osc_item_category();
		$sort_order[$i] = osc_get_preference('seoplugin_category_order','plugin-seo_plugin');
                $i = $i + 1;
	}

	$elements[$i] = osc_item_title();
	$sort_order[$i] = osc_get_preference('seoplugin_body_order','plugin-seo_plugin');
        $i = $i + 1;
	
	array_multisort($sort_order, $elements);
        $elements = array_filter( $elements );
	return implode($del, $elements);
}

function CurrentOrder() {
	$sort_order = array();
	$elements = array();
	$del = Delimiter();
        $i = 0;
	if(osc_get_preference('seoplugin_city_show','plugin-seo_plugin') == 1){
		$elements[$i] = __('City', 'seo_plugin');
		$sort_order[$i] = osc_get_preference('seoplugin_city_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_region_show','plugin-seo_plugin') == 1){
		$elements[$i] = __('Region', 'seo_plugin');
		$sort_order[$i] = osc_get_preference('seoplugin_region_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_country_show','plugin-seo_plugin') == 1){
		$elements[$i] = __('Country', 'seo_plugin');
		$sort_order[$i] = osc_get_preference('seoplugin_country_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_title_show','plugin-seo_plugin') == 1){
                $elements[$i] = __('Site Title', 'seo_plugin');
		$sort_order[$i] = osc_get_preference('seoplugin_title_order','plugin-seo_plugin');
                $i = $i + 1;
	}
	if(osc_get_preference('seoplugin_category_show','plugin-seo_plugin') == 1){
		$elements[$i] = __('Category', 'seo_plugin');
		$sort_order[$i] = osc_get_preference('seoplugin_category_order','plugin-seo_plugin');
                $i = $i + 1;
	}

	$elements[$i] = __('Item Title', 'seo_plugin');;
	$sort_order[$i] = osc_get_preference('seoplugin_body_order','plugin-seo_plugin');
        $i = $i + 1;
	
	array_multisort($sort_order, $elements);
        $elements = array_filter( $elements );
	return implode($del, $elements);
}

/* ----------------- Details for Item Meta -------------------- */
function GetItemKeywords(){
  $detail = ModelSeo::newInstance()->getAttrByItemId(osc_item_id());
   if(isset($detail['seo_keywords'])) {
   return $detail['seo_keywords'];
  }  
}

function GetItemDesc(){
  $detail = ModelSeo::newInstance()->getAttrByItemId(osc_item_id()); 
   if(isset($detail['seo_description'])) {
   return $detail['seo_description'];
  }
}

function GetItemTitle(){
  $detail = ModelSeo::newInstance()->getAttrByItemId(osc_item_id()); 
     if(isset($detail['seo_title'])) {
   return $detail['seo_title'];
  }
}

/* ----------------- Details for Item Meta -------------------- */

function GetCatTitle( $cat_id ){
  $detail = ModelSeoCategory::newInstance()->getAttrByCategoryId( $cat_id ); 
   if(isset($detail['seo_title'])) {
   return $detail['seo_title'];
  }
}

function GetCatDesc( $cat_id ){
  $detail = ModelSeoCategory::newInstance()->getAttrByCategoryId( $cat_id ); 
   if(isset($detail['seo_description'])) {
   return $detail['seo_description'];
  }
}

function GetCatKeywords( $cat_id ){
  $detail = ModelSeoCategory::newInstance()->getAttrByCategoryId( $cat_id ); 
     if(isset($detail['seo_keywords'])) {
   return $detail['seo_keywords'];
  } 
}

/* ----------------- Details for Static Page Meta -------------------- */
function GetPageKeywords(){
  $detail = ModelSeoPage::newInstance()->getAttrByPageId(osc_static_page_id()); 
     if(isset($detail['seo_keywords'])) {
   return $detail['seo_keywords'];
  } 
}

function GetPageDesc(){
  $detail = ModelSeoPage::newInstance()->getAttrByPageId(osc_static_page_id()); 
     if(isset($detail['seo_description'])) {
   return $detail['seo_description'];
  }
}

function GetPageTitle(){
  $detail = ModelSeoPage::newInstance()->getAttrByPageId(osc_static_page_id()); 
    if(isset($detail['seo_title'])) {
   return $detail['seo_title'];
  }
}

function seopluginTitleFirst(){
	return (osc_get_preference('seoplugin_title_first','plugin-seo_plugin'));
}

 function seoplugin_title_filter($text) {

    $location = Rewrite::newInstance()->get_location();
    $section  = Rewrite::newInstance()->get_section();


    switch ($location) {
        case ('item'):
            switch ($section) {
                case 'item_add':    $text = __('Publish a listing'); break;
                case 'item_edit':   $text = __('Edit your listing'); break;
                case 'send_friend': $text = __('Send to a friend') . Delimiter() . osc_item_title(); break;
                case 'contact':     $text = __('Contact seller') . Delimiter() . osc_item_title(); break;
                default:            $text = SeoCompleteShow(); break;
            }
        break;
        case('page'):
            if( GetPageTitle() == '' ) {
              $text = osc_static_page_title();
            } else {
              $text = GetPageTitle();
            }
        break;
        case('error'):
            $text = __('Error');
        break;
        case('search'):
            $region   = osc_search_region();
            $city     = osc_search_city();
            $pattern  = osc_search_pattern();
            $category = osc_search_category_id();
            $s_page   = '';
            $i_page   = Params::getParam('iPage');


            if($i_page != '' && $i_page > 1) {
                $s_page = Delimiter() . __('page') . ' ' . $i_page ;
            }

            $b_show_all = ($region == '' && $city == '' & $pattern == '' && $category == '');
            $b_category = ($category != '');
            $b_pattern  = ($pattern != '');
            $b_city     = ($city != '');
            $b_region   = ($region != '');

            if($b_show_all) {
                $text = __('Show all listings') . Delimiter() . $s_page . osc_page_title();
            }

            $result = '';
            if($b_pattern) {
                $result .= $pattern . ' &raquo; ';
            }
            
            if($b_category && is_array($category) && count($category) > 0) {

                $cat = Category::newInstance()->findByPrimaryKey($category[0]);
                $cat_title= GetCatTitle( $category[0] ) ; 

                if( $cat_title == '' ) {
                  $cat = $cat['s_name'];
                } else {
                  $cat = $cat_title;
                }
                if( $cat ) {
                    $result .= $cat . ' ' ;
                }
            }

            $resultStatus = true;
            

            if($b_city ) {
                if (strlen(trim($result))>0){
                    $result = $city.Delimiter().$result;
                    $resultStatus = false;
                }
                else
                    $result .= $city . ' &raquo; ';
            } else if($b_region) {
                if (strlen(trim($result))>0) {
                    $result = $region.Delimiter().$result;
                    $resultStatus = false;
                }
                else
                    $result .= $region . '&raquo; ';
            }


            $result = preg_replace('|\s?&raquo;\s$|', '', $result);




            if($result == '') {
                $result = __('Search result', 'seo_plugin');
            }

            $text = $result . $s_page;



        break;
        case('login'):
            switch ($section) {
                case('recover'): $text = __('Recover your password');
                default:         $text = __('Login');
            }
        break;
        case('register'):
            $text = __('Create a new account');
        break;
        case('user'):
            switch ($section) {
                case('dashboard'):       $text = __('Dashboard'); break;
                case('items'):           $text = __('Manage my listings'); break;
                case('alerts'):          $text = __('Manage my alerts'); break;
                case('profile'):         $text = __('Update my profile'); break;
                case('pub_profile'):     $text = __('Public profile') . Delimiter() . osc_user_name(); break;
                case('change_email'):    $text = __('Change my email'); break;
                case('change_password'): $text = __('Change my password'); break;
                case('forgot'):          $text = __('Recover my password'); break;
            }
        break;
        case('contact'):
            $text = __('Contact','seo_plugin');
        break;
        default:
            $text = osc_page_title();
        break;
    }


    if( !osc_is_home_page() and !osc_is_ad_page() ) {
		
		    $b_category = ($category != '');
            $b_city     = ($city != '');
            $b_region   = ($region != '');

		if(seopluginTitleFirst() != 1) {
            if($b_city){
                if($resultStatus){
                    $seoTitleCityInfo = ModelSeoCity::newInstance()->getAttrCity();
					if(isset($seoTitleCityInfo['seo_title'])) {
        $seoTitleCity = $seoTitleCityInfo['seo_title'];
		}
                    if(strlen($seoTitleCity)>0){
                         $text .= Delimiter(). $seoTitleCity;
                    }
                }
            }
            elseif($b_region){
                if($resultStatus){
                    $seoTitleRegionInfo = ModelSeoRegion::newInstance()->getAttrRegion();
					if(isset($seoTitleRegionInfo['seo_title'])) {
        $seoTitleRegion = $seoTitleRegionInfo['seo_title'];
		}
                    if(strlen($seoTitleRegion)>0){
                         $text .= Delimiter(). $seoTitleRegion;
                    }
                }
            }
			elseif($b_category && is_array($category) && count($category) > 0) {

                $cat = Category::newInstance()->findByPrimaryKey($category[0]);
                $cat_title= GetCatTitle( $category[0] ) ; 

                if( $cat_title == '' ) {
                  $cat = $cat['s_name'];
                } else {
                  $cat = $cat_title;
                }
                if( $cat ) {
                    $result .= $cat . ' ' ;
                }
            }
            else {
			   $text .= Delimiter() . osc_page_title();
            }

		} else {
			$text = $text . Delimiter() .  osc_page_title();
		}
    }

     if(osc_is_home_page()){
         $seoTitleHomeInfo = ModelSeoHome::newInstance()->getAttrHome();
		 if(isset($seoTitleHomeInfo['seo_title'])) {
       $seoTitleHome = $seoTitleHomeInfo['seo_title'];
		}
         if(strlen($seoTitleHome)>0){
             $text = $seoTitleHome;
         }

     }



     /* -------- Testing item special title ------------- */
    if( osc_is_ad_page() ) { $text = SeoCompleteShow(); }
    return $text;
 }

 function seoplugin_description_filter($text) {
 	$text = '';
    // home page
    if( osc_is_home_page() ) {
        $seoDescriptionHomeInfo = ModelSeoHome::newInstance()->getAttrHome();
		if(isset($seoDescriptionHomeInfo['seo_description'])) {
        $seoDescriptionHome = $seoDescriptionHomeInfo['seo_description'];
		}
        if(strlen($seoDescriptionHome)>0){
            $text = $seoDescriptionHome;
        }else {
            $text = osc_page_description();
        }
    }
    // static page
    if( osc_is_static_page() ) {
      if ( GetPageDesc() == '' ) {
        $text = osc_highlight(osc_static_page_text(), 140, '', '');
      } else {
        $text = GetPageDesc();
      }
    }
    // search
    if( osc_is_search_page() ) {
	$categ = osc_search_category_id();
	if(isset($categ[0])) {
        $cat_id= $categ[0]; 
	}
	$b_categ = ($categ != '');

       if(osc_search_city() || osc_search_region() || osc_search_category() ) {
		   if(osc_search_city() != '' && $b_categ && is_array($categ) && count($categ) > 0 ) {
	
      if( GetCatDesc( $cat_id ) <> '' ) {
          $desc = osc_search_city() . ' ' . GetCatDesc( $cat_id );
        } else {
		if( osc_has_items() ) {
            $desc = osc_item_category() . ' ' . osc_item_city() . ', ' . osc_highlight(osc_item_description(), 120) . ', ' . osc_item_category() . ' ' . osc_item_city();
        }
        osc_reset_items();
        }
        $text = $desc;
				}
            elseif(osc_search_city() != ''){
				$seoDescriptionCityInfo = ModelSeoCity::newInstance()->getAttrCity();
				if(isset($seoDescriptionCityInfo['seo_description'])) {
        $seoDescriptionCity = $seoDescriptionCityInfo['seo_description'];
		}
                if(strlen($seoDescriptionCity)>0){
                        $text .= osc_search_city() . ' ' . $seoDescriptionCity;
                    }
                    
             else{
				if( osc_has_items() ) {
            $text = osc_item_category() . ' ' . osc_item_city() . ', ' . osc_highlight(osc_item_description(), 120) . ', ' . osc_item_category() . ' ' . osc_item_city();
        }
        osc_reset_items();
				}
            }
			elseif(osc_search_region() != '' && $b_categ && is_array($categ) && count($categ) > 0 ) {
	
      if( GetCatDesc( $cat_id ) <> '' ) {
          $desc = osc_search_region() . ' ' . GetCatDesc( $cat_id );
        } else {
		if( osc_has_items() ) {
            $desc = osc_item_category() . ' ' . osc_item_city() . ', ' . osc_highlight(osc_item_description(), 120) . ', ' . osc_item_category() . ' ' . osc_item_city();
        }
        osc_reset_items();
        }
        $text = $desc;
				}
            elseif(osc_search_region() != ''){
                    $seoDescriptionRegionInfo = ModelSeoRegion::newInstance()->getAttrRegion();
								if(isset($seoDescriptionRegionInfo['seo_description'])) {
        $seoDescriptionRegion = $seoDescriptionRegionInfo['seo_description'];
		}
                         if(strlen($seoDescriptionRegion)>0){
                            $text .= osc_search_region() . ' ' .$seoDescriptionRegion;
                    }
				   else{
					if( osc_has_items() ) {
            $text = osc_item_category() . ' ' . osc_item_city() . ', ' . osc_highlight(osc_item_description(), 120) . ', ' . osc_item_category() . ' ' . osc_item_city();
        }
        osc_reset_items();
				}
				}
				elseif($b_categ && is_array($categ) && count($categ) > 0) {
	
      if( GetCatDesc( $cat_id ) <> '' ) {
          $desc = GetCatDesc( $cat_id );
        } else {
		if( osc_has_items() ) {
            $desc = osc_item_category() . ' ' . osc_item_city() . ', ' . osc_highlight(osc_item_description(), 120) . ', ' . osc_item_category() . ' ' . osc_item_city();
        }
        osc_reset_items();
        }
        $text = $desc;
				}
            }
        } elseif(strlen(trim($text))== 0 ){

            while( osc_has_items() ) {
                $con = osc_item_description();
                $con = str_replace('.',' ',$con);
                $text .= ',' . osc_item_city() . ', ' . osc_highlight($con, 120);
            }
            $text = substr($text,1,strlen($text));
            $text = osc_highlight($text, 500);
            osc_reset_items();
        }
    
    // listing
    if( osc_is_ad_page() ) {
      if ( GetItemDesc() == '' ) {
        if( GetCatDesc( osc_item_category_id() ) <> '' ) {
          $desc = GetCatDesc( osc_item_category_id() );
        } else {
          $desc = osc_item_category();
        }
        $con = osc_item_description();

        $text = $desc .  ', ' . osc_highlight($con, 120) . ', ' . SeoLocationShow();
      } else {
        $text = GetItemDesc();
      }
    }
    return $text;
 }

function seoplugin_keywords_filter($text) {

  if( osc_is_ad_page() and GetItemKeywords() <> '' ) {
        $text = GetItemKeywords();
  } else if( osc_is_static_page() and GetPageKeywords() <> '' ) {
        $text = GetPageKeywords();
  } else
      if( osc_is_search_page() ) {
        $category = osc_search_category_id();
		if(isset($category[0])) {
        $seocat = $category[0];
		}
        if(GetCatKeywords(isset($seocat)) <> '' ) {
             $text= GetCatKeywords( $seocat );
        }

        if(osc_search_city() || osc_search_region()) {
            if( osc_search_city() != '' ) {
                if(strlen(trim($text))>0){
				$seoInfoCity = ModelSeoCity::newInstance()->getAttrCity();
                    $text = osc_search_city().','. $seoInfoCity['seo_keywords'];
                   
                }
            }

            if(osc_search_region() != ''){
                if(strlen(trim($text))>0){
                    $seoInfoRegion = ModelSeoRegion::newInstance()->getAttrRegion();
                    $text = osc_search_region().','. $seoInfoRegion['seo_keywords'];
                }
            }
        } elseif(strlen(trim($text))== 0 && !osc_get_preference('seoplugin_keywords_enabled','plugin-seo_plugin')){
            $text = osc_get_preference('seoplugin_keywords','plugin-seo_plugin');
        }

  }

  if(osc_get_preference('seoplugin_keywords_enabled','plugin-seo_plugin')) {
    if( $text <> '' ) {
      $text .= ', ';
    }
    $text .= osc_get_preference('seoplugin_keywords','plugin-seo_plugin');
  }

  if(osc_is_home_page()){
        $seoKeywordsHomeInfo = ModelSeoHome::newInstance()->getAttrHome();
		if(isset($seoKeywordsHomeInfo['seo_keywords'])) {
        $seoTitleHome = $seoKeywordsHomeInfo['seo_keywords'];
		}
        if(strlen($seoTitleHome)>0){
            $text = $seoTitleHome;
        }

    }
  return $text;
}

function seopluginTitle($title){
  $file = explode('/', Params::getParam('file'));
  if($file[0] == 'seo_plugin'){
    $title = 'SEO Plugin';	       
  }
  return $title;
}

// This is needed in order to be able to activate the plugin
osc_register_plugin(osc_plugin_path(__FILE__), 'seoplugin_call_after_install') ;

// This is a hack to show a Uninstall link at plugins table (you could also use some other hook to show a custom option panel)
osc_add_hook(osc_plugin_path(__FILE__) . '_uninstall', 'seoplugin_call_after_uninstall') ;

osc_add_filter('custom_plugin_title','seopluginTitle');

// This will add own meta
osc_add_filter('meta_title_filter', 'seoplugin_title_filter');
osc_add_filter('meta_description_filter', 'seoplugin_description_filter');

// This will add own keywords
osc_add_filter('meta_keywords_filter', 'seoplugin_keywords_filter');

  

// Display help
function seoplugin_conf() {
  osc_admin_render_plugin( osc_plugin_path( dirname(__FILE__) ) . '/home.php' ) ;
}

// This is a hack to show a Configure link at plugins table (you could also use some other hook to show a custom option panel)
osc_add_hook( osc_plugin_path( __FILE__ ) . '_configure', 'seoplugin_conf' ) ;	
function seo_menu() {
echo '<h3><a href="#" style="font-weight:bold">SEO Plugin</a></h3>
<ul> 
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/home.php') . '"><i class="fa fa-angle-right"></i> ' . __('home page', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/config.php') . '"><i class="fa fa-angle-right"></i> ' . __('listings', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/categories.php') . '"><i class="fa fa-angle-right"></i> ' . __('categories', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/regions.php') . '"><i class="fa fa-angle-right"></i> ' . __('regions', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/city.php') . '"><i class="fa fa-angle-right"></i> ' . __('cities', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/pages.php') . '"><i class="fa fa-angle-right"></i> ' . __('static pages', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/key.php') . '"><i class="fa fa-angle-right"></i> ' . __('custom keywords', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/generate.php') . '"><i class="fa fa-angle-right"></i> ' . __('sitemap', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/robots.php') . '"><i class="fa fa-angle-right"></i> ' . __('robots.txt', 'seo_plugin') . '</a></li>
  <li><a class="adm" href="' . osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/help.php') . '"><i class="fa fa-angle-right"></i> ' . __('help', 'seo_plugin') . '</a></li>
</ul>';
}

//Adding sub menu to plugins menu in dashboard
osc_add_hook('admin_menu','seo_menu', '1');

function config_menu() {
  echo '<link href="' . osc_base_url() . 'oc-content/plugins/seo_plugin/css/style.css" rel="stylesheet" type="text/css" />';
  echo '<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />';
  $text  = '';
  $text  = '<fieldset class="tabs seo" style="padding: 0px 10px;">';
  $text .= '<ul class="conf-menu">';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/home.php">' . __('Home Page', 'seo_plugin') . '</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/config.php">' . __('Listings', 'seo_plugin') . '</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/categories.php">' . __('Categories', 'seo_plugin') . '</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/regions.php">' . __('Regions', 'seo_plugin') . '</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/city.php">' . __('Cities', 'seo_plugin') . '</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/pages.php">' . __('Static Pages', 'seo_plugin') . '</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/key.php">' . __('Custom Keywords', 'seo_plugin') . '</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/generate.php">Sitemap</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/robots.php">robots.txt</a></li>';
  $text .= '<li class="btn-blue"><a href="' . osc_base_url() . 'oc-admin/index.php?page=plugins&action=renderplugin&file=seo_plugin/help.php">' . __('Help', 'seo_plugin') . '</a></li>';

  $text .= '</ul>';
  $text .= '</fieldset>';
  $text .= '<br /><br />';
  $text .= '<div style="clear:both"></div>';
  return $text;
}




?>