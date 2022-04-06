<?php
$i_userId = osc_logged_user_id();

if (Params::getParam('delete') != '' && osc_is_web_user_logged_in()) {
    delete_item(Params::getParam('delete'), $i_userId);
    ob_get_clean();
    osc_redirect_to( osc_route_url('watchlist-user', array('iPage' => null)) );
}
$itemsPerPage = (Params::getParam('itemsPerPage') != '') ? Params::getParam('itemsPerPage') : 2;
$iPage = (Params::getParam('iPage') != '') ? Params::getParam('iPage')-1 : 0;

Search::newInstance()->addConditions(sprintf("%st_item_watchlist.fk_i_user_id = %d", DB_TABLE_PREFIX, $i_userId));
Search::newInstance()->addConditions(sprintf("%st_item_watchlist.fk_i_item_id = %st_item.pk_i_id", DB_TABLE_PREFIX, DB_TABLE_PREFIX));
Search::newInstance()->addTable(sprintf("%st_item_watchlist", DB_TABLE_PREFIX));
Search::newInstance()->page($iPage, $itemsPerPage);

$aItems = Search::newInstance()->doSearch();
$iTotalItems = Search::newInstance()->count();
$iNumPages = ceil($iTotalItems / $itemsPerPage);

View::newInstance()->_exportVariableToView('items', $aItems);
View::newInstance()->_exportVariableToView('search_total_pages', $iNumPages);
View::newInstance()->_exportVariableToView('search_page', $iPage);

// delete item from watchlist
function delete_item($item, $uid) {
    $conn = getConnection();
    $conn->osc_dbExec("DELETE FROM %st_item_watchlist WHERE fk_i_item_id = %d AND fk_i_user_id = %d LIMIT 1", DB_TABLE_PREFIX, $item, $uid);
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
<style>

.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
}

.pagination > li {
    display: inline;
}

.pagination > li:first-child > a, .pagination > li:first-child > span {
    margin-left: 0;
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
}
.pagination > li > a, .pagination > li > span {
    position: relative;
    float: left;
    padding: 6px 12px;
    line-height: 1.42857143;
    text-decoration: none;
    color: #337ab7;
    background-color: #fff;
    border: 1px solid #ddd;
    margin-left: -1px;
}

.pagination > li > span.searchPaginationSelected {
    z-index: 3;
    color: #fff;
    background-color: #337ab7;
    border-color: #337ab7;
    cursor: default;
}
</style>
<div class="content user_account">
    <h1>
        <strong><?php _e('Your watchlist', 'watchlist'); ?></strong>
    </h1>
    <div id="main">
        <?php if (osc_count_items() == 0) { ?>
            <h3 class="item-form-help"><?php _e('You don\'t have any items yet', 'watchlist'); ?></h3>
        <?php } else { ?>
            <h3 class="item-form-help"><?php printf(_n('You are watching %d item', 'You are watching %d items', countFavorite(), 'watchlist'), countFavorite()); ?></h3>
            <div class="ad_list">
                <?php
                if (file_exists(WebThemes::newInstance()->getCurrentThemePath() . 'loop.php')) {
                    osc_current_web_theme_path('loop.php');
                } else {
                    ?>
                    <div id="list_head"></div>
                    <div class="search-list">
                        <div class="item-gallery">
                          <?php while ( osc_has_items() ) { ?>
                              <?php draw_item_san_auto('gallery', false, false, false); ?>
                          <?php } osc_reset_items(); ?>
                        </div>
                    </div>
    <?php }  ?>
            </div>
            <div class="paginate">
            <?php if(osc_version()<320) {
                echo osc_pagination(array('url' => osc_render_file_url(osc_plugin_folder(__FILE__) . 'watchlist_route.php') . '?iPage={PAGE}', 'list_class' => 'pagination'));
            } else {
                echo osc_pagination(array('url' => osc_route_url('watchlist-user', array('iPage' => '{PAGE}')), 'list_class' => 'pagination' ));
            } ?>
            </div>
<?php } ?>
    </div>
</div>
