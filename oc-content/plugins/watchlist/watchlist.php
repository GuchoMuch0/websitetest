<?php
    $i_userId = osc_logged_user_id();
	if(Params::getParam('delete') != '' && osc_is_web_user_logged_in()){
		delete_item(Params::getParam('delete'), $i_userId);
	}

    $itemsPerPage = (Params::getParam('itemsPerPage') != '') ? Params::getParam('itemsPerPage') : 5;
    $iPage        = (Params::getParam('iPage') != '') ? Params::getParam('iPage') : 0;



    Search::newInstance()->addConditions(sprintf("%st_item_watchlist.fk_i_user_id = %d", DB_TABLE_PREFIX, $i_userId));
    Search::newInstance()->addConditions(sprintf("%st_item_watchlist.fk_i_item_id = %st_item.pk_i_id", DB_TABLE_PREFIX, DB_TABLE_PREFIX));
    Search::newInstance()->addTable(sprintf("%st_item_watchlist", DB_TABLE_PREFIX));
    Search::newInstance()->page($iPage, $itemsPerPage);

    $aItems      = Search::newInstance()->doSearch();
    $iTotalItems = Search::newInstance()->count();
    $iNumPages   = ceil($iTotalItems / $itemsPerPage) ;

    View::newInstance()->_exportVariableToView('items', $aItems);
    View::newInstance()->_exportVariableToView('search_total_pages', $iNumPages);
    View::newInstance()->_exportVariableToView('search_page', $iPage) ;

	// delete item from watchlist
	function delete_item($item, $uid){
		$conn = getConnection();
		$conn->osc_dbExec("DELETE FROM %st_item_watchlist WHERE fk_i_item_id = %d AND fk_i_user_id = %d LIMIT 1", DB_TABLE_PREFIX , $item, $uid);
	}

    function countFavorite() {
        $itemsPerPage = (Params::getParam('itemsPerPage') != '') ? Params::getParam('itemsPerPage') : 5;
        $iPage        = (Params::getParam('iPage') != '') ? Params::getParam('iPage') : 0;
        $i_userId = osc_logged_user_id();
        Search::newInstance()->addConditions(sprintf("%st_item_watchlist.fk_i_user_id = %d", DB_TABLE_PREFIX, $i_userId));
        Search::newInstance()->addConditions(sprintf("%st_item_watchlist.fk_i_item_id = %st_item.pk_i_id", DB_TABLE_PREFIX, DB_TABLE_PREFIX));
        Search::newInstance()->addTable(sprintf("%st_item_watchlist", DB_TABLE_PREFIX));
        Search::newInstance()->page($iPage, $itemsPerPage);
        $iTotalItems = Search::newInstance()->count();
        return $iTotalItems;
    }


?>
<div class="content user_account">
    <h1>
        <strong><?php _e('Your watchlist', 'watchlist'); ?></strong>
    </h1>
    <div id="main">
        <?php if (osc_count_items() == 0) { ?>
        <h3 class="item-form-help"><?php _e('You don\'t have any items yet', 'watchlist'); ?></h3>
        <?php } else { ?>
        <h3 class="item-form-help"><?php printf(_n('You are watching %d item', 'You are watching %d items', countFavorite(), 'watchlist'), countFavorite()) ; ?></h3>
        <div class="ad_list">
            <?php
            if( file_exists(WebThemes::newInstance()->getCurrentThemePath() . 'loop.php') ){
                 osc_current_web_theme_path('loop.php');
            } else {
            ?>

            <div id="list_head"></div>
            <div class="item-gallery">
                  <?php while ( osc_has_items() ) { ?>
                      <?php draw_item_modern_san_auto('gallery', false, false, false); ?>
                  <?php } osc_reset_items(); ?>
                </div>
            <?php }  ?>
        </div>
        </div>
        <div class="paginate">
            <?php echo osc_pagination(array('url' => osc_render_file_url(osc_plugin_folder(__FILE__) . 'watchlist.php') . '&iPage={PAGE}', 'list_class' => 'pagination') ); ?>
        </div>
        <?php } ?>
    </div>
