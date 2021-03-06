<link href="<?php echo osc_base_url(); ?>oc-content/plugins/instant_messenger/css/tipped.css" rel="stylesheet" type="text/css" />
<script src="<?php echo osc_base_url(); ?>oc-content/plugins/instant_messenger/js/tipped.js"></script>
<script src="<?php echo osc_base_url(); ?>oc-content/plugins/instant_messenger/js/user.js"></script>


<?php 
  $secret = Params::getParam('secret');
  $att_enable = osc_get_preference('att_enable','plugin-instant_messenger');
  $message_delete = osc_get_preference('message_delete','plugin-instant_messenger');

  $thread = ModelIM::newInstance()->getThreadById( Params::getParam('thread-id') ); 
  $item = Item::newInstance()->findByPrimaryKey( $thread['fk_i_item_id'] ); 

  $item_details = im_get_item_details( $thread['fk_i_item_id'] );

  // Message types: 0 - FROM user send message to TO user, 1 - TO user send message to FROM user
  if( (osc_is_web_user_logged_in() && osc_logged_user_id() == $thread['i_from_user_id']) || $secret == $thread['s_from_secret']) {
    $type = 0;
  } else {
    $type = 1;
  }



  // MARK AS VIEWED FOR THIS USER
  $is_read = ModelIM::newInstance()->getThreadIsRead( $thread['i_thread_id'], osc_logged_user_id(), $secret );
 
  if( $is_read['pk_i_id'] <> '' && $is_read['pk_i_id'] > 0 && $is_read['i_read'] == 0 ) {
    ModelIM::newInstance()->updateMessagesRead( $thread['i_thread_id'], ($type*(-1) + 1) );
  }


  $offer = im_get_offer($thread['i_offer_id']);

  if($offer) {
    if($offer['fk_i_item_id'] == $thread['fk_i_item_id']) {
      $offer_item = $item;
    } else {
      $offer_item = Item::newInstance()->findByPrimaryKey($offer['fk_i_item_id']);
    }

    $currency = Currency::newInstance()->findByPrimaryKey($item['fk_c_currency_code']);

    $t_title = sprintf(__('New offer on %s - %s', 'instant_messenger'), osc_highlight($item['s_title'], 50), $offer['i_price']/1000000 . $currency['s_description']);
  } else if($thread['s_title'] <> '') {
    $t_title = osc_highlight($thread['s_title'], 60);
  } else {
    $t_title =  __('No subject', 'instant_messenger');
  }



  // MESSAGE SENT TO USER
  if(Params::getParam('im-action') == 'send_message') {
    im_insert_message($thread['i_thread_id'], nl2br(htmlspecialchars(Params::getParam('im-message', false, false))), $type, Params::getFiles('im-file') );
  }


  // DELETE MESSAGE
  if( Params::getParam('del-message-id') <> '' && Params::getParam('del-message-id') > 0 && $message_delete == 1 ) {
    $del_message = ModelIM::newInstance()->getMessageById( Params::getParam('del-message-id') );

    if( $del_message['fk_i_thread_id'] == $thread['i_thread_id'] && $del_message['i_type'] == $type ) {
      ModelIM::newInstance()->deleteMessageById( Params::getParam('del-message-id') );
      osc_add_flash_ok_message( __('Message removed', 'instant_messenger') );

      header('Location: ' . osc_route_url( 'im-messages', array('thread-id' => $del_message['fk_i_thread_id'], 'secret' => $secret)));
    } else {
      osc_add_flash_error_message( __('This is not your message, you cannot remove it!', 'instant_messenger') );
    }

  }


  // DELETE ATTACHMENT
  if(  Params::getParam('del-att-message-id') <> '' && Params::getParam('del-att-message-id') > 0 && Params::getParam('del-file-name') <> '' ) {
    $del_message = ModelIM::newInstance()->getMessageById( Params::getParam('del-att-message-id') );

    if( $del_message['fk_i_thread_id'] == $thread['i_thread_id'] && $del_message['i_type'] == $type ) {
      @unlink( osc_base_path() . 'oc-content/plugins/instant_messenger/download/' . Params::getParam('del-file-name') );
      ModelIM::newInstance()->deleteMessageAttachment( Params::getParam('del-att-message-id') );
      osc_add_flash_ok_message( __('Attachment removed', 'instant_messenger') );

      header('Location: ' . osc_route_url( 'im-messages', array('thread-id' => $del_message['fk_i_thread_id'], 'secret' => $secret)));
    } else {
      osc_add_flash_error_message( __('This is not your message, you cannot remove attachment on it!', 'instant_messenger') );
    }
  }


  $messages = ModelIM::newInstance()->getMessagesByThreadId( Params::getParam('thread-id') ); 
?>


<?php if( (($thread['i_from_user_id'] == osc_logged_user_id() || $thread['i_to_user_id'] == osc_logged_user_id()) && osc_is_web_user_logged_in()) || ($secret == $thread['s_from_secret'] || $secret == $thread['s_to_secret'])) { ?>

  <h2 class="im-head"><?php _e('Thread', 'instant_messenger'); ?>: <?php echo $t_title; ?></h2>

  <div class="im-row im-item-related im-body">
    <div class="im-col-3 im-item-resource"><img src="<?php echo $item_details['resource']; ?>" /></div>
    <div class="im-col-21">
      <div class="im-line im-item-title"><a target="_blank" href="<?php echo osc_item_url_ns( $item['pk_i_id'] ); ?>"><?php echo osc_highlight($item['s_title'], 50); ?></a></div>
      <div class="im-line im-item-price"><?php echo $item_details['price']; ?></div>
      <div class="im-line im-item-location"><?php echo $item_details['location']; ?></div>
    </div>
  </div>

  <?php if($offer) { ?>
    <a href="<?php echo osc_route_url('mo-show-offers', array('offerId' => $thread['i_offer_id'])); ?>" class="im-row im-body im-offer">
      <div class="im-line"><?php echo sprintf(__('Offer: %sx %s for %s%s', 'instant_messenger'), $offer['i_quantity'], $offer_item['s_title'], $offer['i_price']/1000000, $currency['s_description']); ?></div>
      <div class="im-line"><?php _e('Click to view offer', 'instant_messenger'); ?> <i class="fa fa-angle-double-right"></i></div>
    </a>
  <?php } ?>


  <ul id="im-error-list" class="error-list im-error-list im-body"></ul>


  <?php if( count($messages) > 0 ) { ?>
    <div class="im-table im-messages im-body">
      <div class="im-vertical">
        <span class="top"></span>
        <span class="bot"></span>
      </div>

      <?php foreach( $messages as $m ) { ?>
        <?php 
          // CHECK IF LOGGED USER IS OWNER OF THIS MESSAGE
          if( (osc_is_web_user_logged_in() && (osc_logged_user_id() == $thread['i_from_user_id'] && $m['i_type'] == 0 || osc_logged_user_id() == $thread['i_to_user_id'] && $m['i_type'] == 1)) || ($secret == $thread['s_from_secret'] && $m['i_type'] == 0 || $secret == $thread['s_to_secret'] && $m['i_type'] == 1) ) {
            $logged_is_owner = true;
          } else {
            $logged_is_owner = false;
            
            if($m['i_type'] == 0) {
              $identify_name = __('customer', 'instant_messenger');
            } else {
              $identify_name = __('seller', 'instant_messenger');
            }
          } 
        ?>



        <?php 
          if($thread['i_from_user_id'] == osc_logged_user_id()) {
            $u_id = $thread['i_to_user_id'];
          } else {
            $u_id = $thread['i_from_user_id'];
          }

          if($logged_is_owner) {
            $def_img = osc_base_url() . 'oc-content/plugins/instant_messenger/img/profile-default.png';
            $u_id = osc_logged_user_id();
          } else {
            $def_img = osc_base_url() . 'oc-content/plugins/instant_messenger/img/profile-default-alt.png';
            $u_id = ($thread['i_from_user_id'] == osc_logged_user_id() ? $thread['i_to_user_id'] : $thread['i_from_user_id']);
          }


          $img = im_get_user_image($u_id);

/*
          $img = '';
          if(function_exists('profile_picture_show')) {
            $picture = ModelIM::newInstance()->getPictureByUserId($u_id);
          
            if(file_exists(osc_base_path() . 'oc-content/plugins/profile_picture/images/profile' . $u_id . $picture['pic_ext'])) { 
              $img = osc_base_url() . 'oc-content/plugins/profile_picture/images/profile' . $u_id . $picture['pic_ext'];
            } 
          }
*/
        ?>

        <div class="im-table-row <?php if( $logged_is_owner ) { ?>im-from<?php } ?>">
          <div class="im-horizontal">
            <span class="left"></span>
            <span class="right"><img src="<?php echo ($img <> '' ? $img : $def_img); ?>"></span>
          </div>

          <div class="im-line">
            <div class="im-col-12 im-name im-align-left">
              <strong><?php if( $m['i_type'] == 0 ) { echo $thread['s_from_user_name']; } else { echo $thread['s_to_user_name']; } ?></strong> 
              <span class="im-identifier"><?php if( $logged_is_owner ) { ?><?php _e('you', 'instant_messenger'); ?><?php } else { ?><?php echo $identify_name; ?><?php } ?></span>
            </div>
            <div class="im-col-12 im-date im-align-right im-i im-gray" title="<?php echo date('d/m/Y H:i:s', strtotime($m['d_datetime'])); ?>"><?php echo im_get_time_diff($m['d_datetime']); ?></div>
          </div>

          <div class="im-line im-message-content">
            <div class="im-col-24 im-align-left"><?php echo $m['s_message']; ?></div>
          </div>

          <div class="im-line im-message-extra <?php if($m['s_file'] <> '' && $att_enable == 1) { ?>im-box-gray<?php } ?>">
            <div class="im-col-10" class="im-align-left">
              <?php if($m['s_file'] <> '' && $att_enable == 1) { ?>
                <a class="im-download" href="<?php echo osc_base_url(); ?>oc-content/plugins/instant_messenger/download/<?php echo $m['s_file']; ?>" target="_blank"><?php echo im_get_extension_icon($m['s_file']); ?><?php echo $m['s_file']; ?></a>
              <?php } ?>
              &nbsp;
            </div>

            <?php if( $logged_is_owner ) {?>
              <div class="im-col-14 im-align-right">
                <?php if( $message_delete == 1 ) { ?>
                  <a class="im-hide" href="<?php echo osc_route_url( 'im-delete-message', array('thread-id' => $thread['i_thread_id'], 'del-message-id' => $m['pk_i_id'], 'secret' => $secret) ); ?>" onclick="return confirm('<?php echo osc_esc_js(__('Are you sure you want to delete this message', 'instant_messenger')); ?>?')"><?php _e('Remove message', 'instant_messenger'); ?></a>
                <?php } ?>

                <?php if($m['s_file'] <> '' && $att_enable == 1) { ?>
                  <a class="im-hide" href="<?php echo osc_route_url( 'im-delete-attachment', array('thread-id' => $thread['i_thread_id'], 'del-att-message-id' => $m['pk_i_id'], 'del-file-name' => $m['s_file'], 'secret' => $secret) ); ?>" onclick="return confirm('<?php echo osc_esc_js(__('Are you sure you want to delete attachment', 'instant_messenger')); ?>?')"><?php _e('Remove file', 'instant_messenger'); ?></a>
                <?php } ?>
              </div>
            <?php } ?>
          </div>
        </div>
      <?php } ?>
    </div>
  <?php } else { ?>
    <div class="im-empty flashmessage flashmessage-warning"><?php _e('You do not have any messages', 'instant_messenger'); ?></div>
  <?php } ?>


  <form id="im-message-form" class="im-row im-body im-form-validate" action="<?php echo osc_route_url( 'im-messages', array('thread-id' => $thread['i_thread_id'], 'secret' => $secret) ); ?>" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="im-action" id="im-action" value="send_message" />
   
    <textarea name="im-message" id="im-message" class="im-textarea" placeholder="<?php echo osc_esc_js(__('Write your message here...', 'instant_messenger')); ?>"></textarea>

    <button type="submit" class="im-button-green"><?php _e('Send message', 'instant_messenger'); ?></button>

    <?php if($att_enable == 1) { ?>
      <div class="im-attachment">
        <div class="im-att-box">
          <label class="im-status">
            <span class="im-wrap"><i class="fa fa-paperclip"></i> <span><?php _e('Upload file', 'instant_messenger'); ?></span></span>
            <input type="file" name="im-file" id="im-file" class="im-file" />
          </label>
        </div>
      </div>
    <?php } ?>
  </form>


<?php } else { ?>
  <div class="im-empty flashmessage flashmessage-warning"><?php _e('This is not your thread, you cannot read communication of other users!', 'instant_messenger'); ?></div>
<?php } ?>