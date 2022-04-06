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
         $make  = ModelCars::newInstance()->getCarMakes();
         function countMake($id){
             $count = ModelCars::newInstance()->countCarMakesItemid($id);
             return $count;
         }

     }



?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()); ?>">
    <head>
        <?php osc_current_web_theme_path('head.php'); ?>
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index, follow" />
    </head>
    <body>
        <?php osc_current_web_theme_path('header.php'); ?>
        <?php if(osc_get_preference('hide_ads', 'san_auto') !== '0') { ?>
            <?php if( osc_get_preference('homepage-top-728x90', 'san_auto') != '') { ?>
                <div class="figure-rek">
                    <div class="i728-90">
                        <?php echo osc_get_preference('homepage-top-728x90', 'san_auto'); ?>
                    </div>
                </div>
            <?php } ?>
        <?php } ?>
        <div class="home">
            <?php if (prem_items() == 'on'): ?>
                <?php osc_get_premiums(osc_get_preference('prem_count','san_auto')); ?>
                <?php if( osc_count_premiums() > 0 ) { ?>
                    <section id="prem" class="premium gray pos<?= osc_get_preference('prempos','san_auto') ?>">
                        <div class="wrapper">
                            <h2 class="main-title"><span><?php _e("Premium ", 'san_auto'); ?></span><?php _e("cars", 'san_auto'); ?></h2>
                            <div class="item-gallery">
                              <?php while ( osc_has_premiums() ) { ?>
                                  <?php draw_item_san_auto('gallery', true, true); ?>
                              <?php } osc_reset_premiums(); ?>
                            </div>
                            <a class="prem-left" href="#"><i class="ion ion-ios-arrow-back"></i></a>
                            <a class="prem-right" href="#"><i class="ion ion-ios-arrow-forward"></i></a>
                        </div>
                        <script type="text/javascript">
                            $('#prem .item-gallery').slick({
                                <?php if (osc_count_premiums() > 4): ?>
                                    slidesToShow: 4,
                                <?php else: ?>
                                    slidesToShow: <?= osc_count_premiums(); ?>,
                                <?php endif; ?>
                                slidesToScroll: 2,
                                dots: false,
                                arrows: true,
                                lazyLoad: 'ondemand',
                                prevArrow: $('#prem .prem-left'),
                                nextArrow: $('#prem .prem-right'),
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
                    </section>
                <?php } ?>
            <?php endif; ?>

            <?php if (make_items() == 'on'): ?>
            <section class="pos<?= osc_get_preference('makepos','san_auto') ?>">
                <div class="wrapper">
                <h2 class="main-title"><span><?php _e("Browse by", 'san_auto'); ?></span> <?php _e("make", 'san_auto'); ?></h2>
                <div class="make">
                    <div class="make-list">
                        <?php $i=0;$x = 1; foreach ($make as $key):$i++; $x++;
                        ?>
                            <?php if ($i < osc_get_preference('make_count','san_auto')):?>
                                <a href="<?= osc_search_url() . '&make='. $key['pk_i_id'].'' ;?>" class="make-item" title="<?= osc_esc_html($key['s_name']);?>">
                                    <div class="make-icon">
                                        <img data-lazy="<?= osc_current_web_theme_url('images/makes/'. $key['pk_i_id']. '.png'); ?>" alt="<?= osc_esc_html($key['s_name']);?>" style="transition: opacity <?= $x/5;?>s ease; visibility: visible;">
                                    </div>
                                    <div class="make-title">
                                        <span class="make-text"><?=  $key['s_name']; ?></span>
                                        <span class="make-count"><?= countMake($key['pk_i_id']); ?></span>
                                    </div>
                                </a>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </div>
                    <a class="make-list-left" href="#"><i class="ion ion-ios-arrow-back"></i></a>
                    <a class="make-list-right" href="#"><i class="ion ion-ios-arrow-forward"></i></a>
                </div>

                <script type="text/javascript">
                    $('.make-list').slick({
                        slidesToShow: 9,
                        slidesToScroll: 1,
                        dots: false,
                        arrows: true,
                        lazyLoad: 'ondemand',
                        prevArrow: $('.make-list-left'),
                        nextArrow: $('.make-list-right'),
                        //autoplay: true,// admin
                        autoplaySpeed: 2000,
                        responsive: [
                            {
                               breakpoint: 1024,
                               settings: {
                                 slidesToShow: 5,
                               }
                           },
                           {
                            breakpoint: 768,
                            settings: {
                              slidesToShow: 3,
                              slidesToScroll: 4,
                              dots: true,
                              arrows: false,
                              prevArrow: false,
                              nextArrow: false
                            }
                          }
                        ]
                    });
                </script>
            </section>
            <?php endif; ?>

            <section id="last" class="pos<?= osc_get_preference('lastpos','san_auto') ?>">
                <div class="wrapper">
                    <h2 class="main-title"><span><?php _e("Latest ", 'san_auto'); ?></span><?php _e("cars", 'san_auto'); ?></h2>
                    <div class="item-gallery">

                      <?php while ( osc_has_latest_items() ) { ?>

                          <?php draw_item_san_auto('gallery', false, false); ?>
                      <?php } ?>
                    </div>

                        <a class="prem-left" href="#"><i class="ion ion-ios-arrow-back"></i></a>
                        <a class="prem-right" href="#"><i class="ion ion-ios-arrow-forward"></i></a>
                        <script type="text/javascript">
                            $('#last .item-gallery').slick({
                                <?php if (osc_count_latest_items() > 4): ?>
                                    slidesToShow: 4,
                                <?php else: ?>
                                    slidesToShow: <?= osc_count_latest_items(); ?>,
                                <?php endif; ?>
                                slidesToScroll: 2,
                                dots: false,
                                arrows: true,
                                lazyLoad: 'ondemand',
                                prevArrow: $('#last .prem-left'),
                                nextArrow: $('#last .prem-right'),
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
                        <div class="main-more">
                            <a class="btn" href="<?= osc_search_url(); ?>"><?php _e("See all", 'san_auto'); ?></a>
                        </div>
                </div>
            </section>

            <?php if (pop_items() !== 'on'): ?>
                <section id="pop" class="pos<?= osc_get_preference('poppos','san_auto') ?>">
                    <div class="wrapper">
                        <?php osc_run_hook('main_popular'); ?>
                    </div>
                </section>
            <?php endif; ?>
        </div>


        <?php if(osc_get_preference('hide_ads', 'san_auto') !== '0') { ?>
            <?php if( osc_get_preference('homepage-728x90', 'san_auto') != '') { ?>
                <div class="figure-rek">
                    <div class="i728-90">
                        <?php echo osc_get_preference('homepage-728x90', 'san_auto'); ?>
                    </div>
                </div>
            <?php } ?>
        <?php } ?>

        <?php osc_current_web_theme_path('footer.php') ; ?>
    </body>
</html>
