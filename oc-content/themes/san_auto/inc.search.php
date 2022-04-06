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

     $sQuery = osc_get_preference('keyword_placeholder', 'san_auto');
?>


<form action="<?php echo osc_base_url(true); ?>" method="get" class="search" onsubmit="javascript:return doSearch();">
    <input type="hidden" name="page" value="search" />
    <fieldset class="main">
        <input type="text" name="sPattern"  id="query" value="<?php echo osc_esc_html( ( osc_search_pattern() != '' ) ? osc_search_pattern() : $sQuery ); ?>" />
        <?php  if ( osc_count_categories() ) { ?>
            <?php osc_categories_select('sCategory', null, __('Select a category', 'san_auto')); ?>
        <?php  } ?>
    	<button type="submit"><?php _e('Search', 'san_auto'); ?></button>
    </fieldset>
    <div id="search-example"></div>
</form>
