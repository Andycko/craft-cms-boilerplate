import $ from 'jquery';
import Flickity from 'flickity';
require('flickity-imagesloaded');

$(function(){
    if (document.querySelector('.imageSlider-block')) {
        const flkty = new Flickity('#image-slider', {
            autoPlay: true,
            cellAlign: 'left',
            setGallerySize: true,
            adaptiveHeight: true,
            imagesLoaded: true
        });
    };
});