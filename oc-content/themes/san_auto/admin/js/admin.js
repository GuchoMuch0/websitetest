$(document).ready(function(){
    $(function(){
        $('#tabContainer, #tabContainer2').tabs();
    });

    if ($('.form-controls #hide_ads').is(':checked')){
        $(document).find('.form-controls textarea').prop('disabled', false);
    } else {
        $(document).find('.form-controls textarea').prop('disabled', 'disabled');
    }

    $('#hide_ads').click(function(){
        if ($('.form-controls #hide_ads').is(':checked')){
            $(document).find('.form-controls textarea').prop('disabled', false);
        } else {
            $(document).find('.form-controls textarea').prop('disabled', 'disabled');
        }
    });

    if ($('#premium').is(':checked')){
        $('#count').removeAttr('disabled');
    } else {
        $('#count').attr('disabled', 'disabled');
    }

    $('#premium').click(function(){
        if ($(this).is(':checked')){
            $('#count').removeAttr('disabled');
        } else {
            $('#count').attr('disabled', 'disabled');
        }
    });

    $(document).on('click', '#rtl', function(){
        if ($(this).is(':checked')){
            $('#images').attr('src', '../oc-content/themes/modern/admin/img/leftsidebar.png');
        } else {
            $('#images').attr('src', '../oc-content/themes/modern/admin/img/rightsidebar.png');
        }
    });

    $(document).on('click', '#rtl2', function(){
        if ($(this).is(':checked')){
            $('#images2').attr('src', '../oc-content/themes/modern/admin/img/leftsidebar.png');
        } else {
            $('#images2').attr('src', '../oc-content/themes/modern/admin/img/rightsidebar.png');
        }
    });


    $(document).on('click', function(){
        $('.form-radio').each(function() {
            if ($(this).find('input').is(':checked')){
                $(this).closest('.form-row').find('.form-custom-color').css('display', 'inline-flex');
            } else {
                $(this).closest('.form-row').find('.form-custom-color').hide();
            }
        });
    });







});
