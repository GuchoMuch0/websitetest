<div class="search-box">
    <div class="search-name">
        <h4><?php _e('Subscribe to this search', 'san_auto'); ?></h4>
    </div>
    <div class="search-form-alert">
        <form action="<?php echo osc_base_url(true); ?>" method="post" name="sub_alert" id="sub_alert">
            <fieldset>
                <?php AlertForm::page_hidden(); ?>
                <?php AlertForm::alert_hidden(); ?>

                <?php if(osc_is_web_user_logged_in()) { ?>
                    <?php AlertForm::user_id_hidden(); ?>
                    <?php AlertForm::email_hidden(); ?>
                <?php } else { ?>
                    <div class="search-input">
                        <?php AlertForm::user_id_hidden(); ?>
                        <?php AlertForm::email_text(); ?>
                    </div>
                <?php }; ?>
                <?php if(class_exists('ModelGdpr')): ?>
                    <div class="item-form-input">
                        <?php osc_run_hook('gdpr'); ?>
                    </div>
                <?php endif; ?>
                <button type="submit" class="btn" ><?php _e('Subscribe now', 'san_auto'); ?>!</button>
            </fieldset>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#sub_alert .btn").on('click touchend', function(){
            $.post('<?php echo osc_base_url(true); ?>', {
                email:$("#alert_email").val(), userid:$("#alert_userId").val(), alert:$("#alert").val(), page:"ajax", action:"alerts"
            },
                function(data){
                    if(data==1) { alert('<?php echo osc_esc_js(__('You have sucessfully subscribed to the alert', 'san_auto')); ?>'); }
                    else if(data==-1) { alert('<?php echo osc_esc_js(__('Invalid email address', 'san_auto')); ?>'); }
                    else { alert('<?php echo osc_esc_js(__('There was a problem with the alert', 'san_auto')); ?>');
                    };
            });
            return false;
        });
    });
</script>
