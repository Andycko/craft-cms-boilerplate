import $ from 'jquery';
import Flickity from 'flickity';

$(function(){
    if (document.querySelector('.imageSlider-block')) {
        const flkty = new Flickity('#image-slider', {
            autoPlay: true
        });
    };
});