import $ from 'jquery';

$(function(){
    if (document.querySelector('.collapsiblePillars-block')) {
        $('.pillar-nav').on('mouseover', 'button', function() {
            $(this).trigger('click');
        });
    };
});