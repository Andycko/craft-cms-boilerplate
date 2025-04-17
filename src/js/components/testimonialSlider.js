import $ from 'jquery';
import Flickity from 'flickity';
// var Flickity = require('flickity-imagesloaded');


$(function(){
    if (document.querySelector('.testimonials-block')) {
        const flkty = new Flickity('#testimonialSlider', {
            autoPlay: true,
            cellAlign: 'left',
            setGallerySize: true, 
            adaptiveHeight: true,
            prevNextButtons: false,
            draggable: true
            //imagesLoaded: true
        }); 
    };
});