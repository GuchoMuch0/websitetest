

$(function() {
    var customSelect = $('.select-jsf, #sCategory, .search-select select, .user-step select');

    jcf.setOptions('Select', {
    wrapNative: false,
    wrapNativeOnMobile: false,
    maxVisibleItems: 7,
    useCustomScroll: true,
    alwaysPreventMouseWheel: true
    });

    jcf.replace(customSelect);

});



$(document).ready(function(){

    function close(block, e){
        if (!block.is(e.target) && block.has(e.target).length === 0 ) {
            block.removeClass("active");
        }
    }
    $(document).bind( 'mousewheel', function (e) {
        var nt = $(document.body).scrollTop()-(e.deltaY*e.deltaFactor*100);
        e.preventDefault();
        e.stopPropagation();
        $(document.body).stop().animate( {
             scrollTop : nt
         } , 500 , 'easeInOutCubic' );
    } )

    /* CAPCHA FIXED MOBILE */
    if (($(window).width()) < 767) {
        $(function() {
            var reCaptchaWidth = 304;
            var containerWidth = $(document).find('.g-recaptcha').parent().width();
            if(reCaptchaWidth > containerWidth) {
                var reCaptchaScale = containerWidth / reCaptchaWidth;
                $('.g-recaptcha').css({
                    'transform':'scale('+reCaptchaScale+')',
                    'transform-origin':'left top'
                });
            }
        });
    }

    $(document).on('click touchend', '.open_sort', function() {
        $t = $(this);
        if ($t.hasClass('open')) {
            $t.removeClass('open');
            $t.closest('.search-form').removeClass('open');
            $t.closest('.search-collum').find('.search-atributes').removeClass('active');

        } else {
            $t.addClass('open');
            $t.closest('.search-form').addClass('open');
            $t.closest('.search-collum').find('.search-atributes').addClass('active');
        }
        return false;
    });


    $('.user-input [type="text"], .user-input [type="password"], .user-input textarea').on('focus', function () {
        $(this).closest('.user-input').addClass('focus');
    }).on('blur', function(){
        $(this).closest('.user-input').removeClass('focus');
    });

    $(document).on('click touchend', '#register', function() {
        $t = $(this);
        $(document).find('.user-form-reg').toggleClass('show');
        $(document).find('.user-form-login').toggleClass('hide');

        if (($(window).width()) > 767) {
            $t.closest('.users_login').toggleClass('user-reserve');
            $(document).find('.user-right').removeClass('right').addClass('left');
        }
        $(document).find('.user-btn a .text').text(regText).closest('.user-btn a').attr('id', 'login');
        $(document).find('.user-right h1').text(regWelcText);
        $(document).find('.user-right h5').text(regsubcText);

        return false;
    });

    $(document).on('click touchend', '#login', function() {
        $t = $(this);
        $(document).find('.user-form-reg').toggleClass('show');
        $(document).find('.user-form-login').toggleClass('hide');

        if (($(window).width()) > 767) {
            $t.closest('.users_login').toggleClass('user-reserve');
            $(document).find('.user-right').removeClass('left').addClass('right');
        }
        $(document).find('.user-btn a .text').text(logText).closest('.user-btn a').attr('id', 'register');
        $(document).find('.user-right h1').text(logWelcText);
        $(document).find('.user-right h5').text(logsubcText);

        return false;
    });


    $(document).on('click touchend', '.item-more-attr', function() {
        $t = $(this);
        $t.closest('.item').addClass('transform');
        $t.closest('.item-wrap').css('perspective', '1000px');
        return false;
    });

    $(document).on('click touchend', '.item-back-close', function() {
        $t = $(this);
        $t.closest('.item').removeClass('transform');
        return false;
    });

    $('.search-radio .atributes-type [type="radio"]').on('change', function(){
        $('.search-radio .atributes-type').removeClass('checked');
        if ( $('.search-radio .atributes-type [type="radio"]').is(':checked')) {
            $(this).parent().addClass('checked');
        }
    });

    $(document).on('click touchend', '.search-all', function(){
        $('[name=sCompany]').val('');
        $('#search_form').submit();
    });

    $(document).on('click touchend', '.search-private', function(){
        $('[name=sCompany]').val('0');
        $('#search_form').submit();
    });

    $(document).on('click touchend', '.search-companyes', function(){
        $('[name=sCompany]').val('1');
        $('#search_form').submit();
    });


    $(document).on('click touchend', '.pagesize', function(){
        var $val = $(this).data('val');
        $('[name=iPagesize]').val($val);
        $('#search_form').submit();
    });

    $('.flashmessage .ico-close').on('click', function(){
        $(this).parent('.flashmessage').hide();

    });

    $('.back-to-top').on('click touchend', function() {
        $('html, body').animate({scrollTop: 0}, 700);
        return false;
    });

    $('.mobile-left-menu').on('click touchend', function() {
        $( "#mobile-left" ).show("slide", {direction: "left" });
        $('#modal').addClass('active');
        $('body, html').css({
            'overflow': 'hidden'
        });
        return false;
    });

    $('.mobile-right-menu').on('click touchend', function() {
        $( "#mobile-right" ).show("slide", {direction: "right", });
        $('#modal').addClass('active');
        $('body, html').css({
            'overflow': 'hidden'
        });
        return false;
    });

    $('#mobile-right .ion-md-close').on('click touchend', function() {
        $( "#mobile-right" ).hide("slide", {direction: "right"}, function() {
            $('#modal').removeClass('active');
            $('body, html').css({
                'overflow': 'visible'
            });
        });
        return false;
    });

    $('#mobile-left .ion-md-close').on('click touchend', function() {
        $( "#mobile-left" ).hide("slide", {direction: "left"}, function () {
            $('#modal').removeClass('active');
            $('body, html').css({
                'overflow': 'visible'
            });
        });
        return false;
    });

    if (($(window).width()) < 767) {
        $(document).on('click touchend', '#modal.active' ,function(e) {
            if ($('#mobile-left').is(':visible'))  {
                $('#mobile-left').hide("slide", {direction: "left"}, function () {
                    $('#modal').removeClass('active');
                    $('body, html').css({
                        'overflow': 'visible'
                    });
                });
            } else if ( $('#mobile-right').is(':visible')) {
                $( "#mobile-right" ).hide("slide", {direction: "right"}, function () {
                    $('#modal').removeClass('active');
                    $('body, html').css({
                        'overflow': 'visible'
                    });
                });
            }
        });
    }


});
