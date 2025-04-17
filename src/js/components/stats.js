import $ from 'jquery';
$(function() {
    if ($(".stats-block").length) { 

        var element_position = $('.stats').offset().top;
        var screen_height = $(window).height();
        var activation_offset = -0.2;//determines how far up the page the element needs to be before triggering the function
        var activation_point = element_position - (screen_height * activation_offset);
        var max_scroll_height = $('body').height() - screen_height - 5;//-5 for a little bit of buffer
        var runCounter =  true;

        $(window).on('scroll', function () {
            var y_scroll_pos = window.pageYOffset;
            var element_in_view = y_scroll_pos > activation_point;
            var has_reached_bottom_of_page = max_scroll_height <= y_scroll_pos && !element_in_view;

            if (runCounter == true) {
                if (element_in_view || has_reached_bottom_of_page) {
                    runCounter = false;

                    document.querySelectorAll('.text-counter').forEach((el) => {
                        let endVal = el.getAttribute('data-number');
                        let numAnim = new countUp.CountUp(el, endVal, {
                            duration: 2.5,
                        });
                        if (!numAnim.error) {
                            numAnim.start();
                        } else {
                            console.error(numAnim.error);
                        }
                    })
                }
            }

        });
    }
});

