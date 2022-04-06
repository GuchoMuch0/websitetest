
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
    if ( (!defined('ABS_PATH')) ) exit('ABS_PATH is not loaded. Direct access is not allowed.');
    if ( !OC_ADMIN ) exit('User access is not allowed.');
 ?>
<div class="admin-content">
        <form action="<?php echo osc_admin_render_theme_url('oc-content/themes/san_auto/admin/settings.php'); ?>" method="post" class="nocsrf">
        <input type="hidden" name="action_specific" value="ads" />
        <h2 class="admin-title"><i class="fas fa-filter"></i> <?php _e('Ads management', 'san_auto'); ?></h2>
        <div class="admin-helping">
            <p class="help"><i class="fas fa-info-circle"></i> <?php _e('In this section you can configure your site to display ads and start generating revenue.', 'san_auto'); ?></p>
            <p class="help"> <i class="fas fa-info-circle"></i> <?php _e('If you are using an online advertising platform, such as Google Adsense, copy and paste here the provided code for ads.', 'san_auto'); ?></p>
        </div>
        <div class="form-horizontal">
            <div class="form-row">&nbsp;</div>
            <div class="form-row">
                <div class="form-label"><?php _e('Advertising', 'san_auto'); ?></div>
                    <div class="form-controls">
                        <input type="checkbox" name="hide_ads" id="hide_ads" value="1" <?php echo (osc_get_preference('hide_ads', 'san_auto') ? 'checked' : ''); ?>  />
                        <label for="hide_ads"><?php _e('Show banners', 'san_auto'); ?></label>
                </div>
            </div>

          <div class="form-row">
              <div class="form-label"><?php _e('Header', 'san_auto'); ?></div>
              <div class="form-controls">
                  <textarea style="height: 115px;" name="header-728x90"><?php echo osc_esc_html( osc_get_preference('header-728x90', 'san_auto') ); ?></textarea>
                  <br/><br/>
                  <div class="help-box"><?php _e('This ad will be shown at the top of your website, under the site title and above the search.', 'san_auto'); ?></div>
              </div>
          </div>

          <div class="form-row">
              <div class="form-label"><?php _e('Footer', 'san_auto'); ?></div>
              <div class="form-controls">
                <textarea style="height: 115px;" name="footer-728x90"><?php echo osc_esc_html( osc_get_preference('footer-728x90', 'san_auto') ); ?></textarea>
                  <br/><br/>
                  <div class="help-box"><?php _e('This ad will be shown at the bottom of your website, just above the footer.', 'san_auto'); ?></div>
              </div>
          </div>

          <div class="form-row">
              <div class="form-label"><?php _e('Homepage top', 'san_auto'); ?></div>
              <div class="form-controls">
                <textarea style="height: 115px;" name="homepage-top-728x90"><?php echo osc_esc_html( osc_get_preference('homepage-top-728x90', 'san_auto') ); ?></textarea>
                  <br/><br/>
                  <div class="help-box"><?php _e('This ad will be shown on the main page of your website. It will appear just before latest listings.', 'san_auto'); ?></div>
              </div>
          </div>

          <div class="form-row">
              <div class="form-label"><?php _e('Homepage bottom', 'san_auto'); ?></div>
              <div class="form-controls">
                <textarea style="height: 115px;" name="homepage-728x90"><?php echo osc_esc_html( osc_get_preference('homepage-728x90', 'san_auto') ); ?></textarea>
                  <br/><br/>
                  <div class="help-box"><?php _e('This ad will be shown on the main page of your website. It will appear at the bottom of your site homepage.', 'san_auto'); ?></div>
              </div>
          </div>

          <div class="form-row">
              <div class="form-label"><?php _e('Search results (top of the page)', 'san_auto'); ?></div>
              <div class="form-controls">
                <textarea style="height: 115px;" name="search-results-top-728x90"><?php echo osc_esc_html( osc_get_preference('search-results-top-728x90', 'san_auto') ); ?></textarea>
                  <br/><br/>
                  <div class="help-box"><?php _e('This ad will be shown at the bottom of the search results of your site.', 'san_auto'); ?></div>
              </div>
          </div>

          <div class="form-row">
              <div class="form-label"><?php _e('Search results (bottom of the page)', 'san_auto'); ?></div>
              <div class="form-controls">
                <textarea style="height: 115px;" name="search-results-bottom-728x90"><?php echo osc_esc_html( osc_get_preference('search-results-bottom-728x90', 'san_auto') ); ?></textarea>
                  <br/><br/>
                  <div class="help-box"><?php _e('This ad will be shown at the bottom of the search results of your site.', 'san_auto'); ?></div>
              </div>
          </div>

          <div class="form-row">
              <div class="form-label"><?php _e('Sidebar 300x250', 'san_auto'); ?></div>
              <div class="form-controls">
                  <textarea name="sidebar-300x250" style="height: 115px;"><?php echo osc_esc_html( osc_get_preference('sidebar-300x250', 'san_auto') ); ?></textarea>
                  <div class="help-box">
                      <?php _e('This ad will be shown at the sidebars of your website. Note that the width of the ad can\'t be more than 300 pixels.', 'san_auto'); ?>
                  </div>
              </div>
          </div>

      </div>
    <div class="admin-actions">
        <button type="submit" ><i class="save-ico"></i> <?php echo osc_esc_html(__('Save','san_auto')); ?></button>
    </div>
</form>
</div>
