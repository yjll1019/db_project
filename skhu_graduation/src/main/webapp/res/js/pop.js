/**
 *
 * 
 */
 $('.btn-layer').on('click', function() {
    var target = $(this).attr('href');
    $(target).fadeIn();
 });
 
 $('.btn-layerClose').on('click', function() {
    $('.layer-wrap').fadeOut();
 });