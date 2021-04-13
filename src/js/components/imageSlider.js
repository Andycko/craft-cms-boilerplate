const $ = require('jquery');
const Flickity = require('flickity');

$(function(){
    if (document.querySelector('.imageSlider-block')) {
        const flkty = new Flickity('#image-slider', {
            autoPlay: true
        });
    };
});