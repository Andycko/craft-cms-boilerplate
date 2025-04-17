import $ from 'jquery';
//import Flickity from 'flickity';
import Flickity from 'flickity-imagesloaded';

$(function(){
    if (document.querySelector('.imageSlider')) {

        const imageSliders = document.querySelectorAll('.imageSlider');

        console.log(imageSliders);

        imageSliders.forEach(carousel => {
            new Flickity(carousel, {
                autoPlay: true,
                cellAlign: 'left',
                setGallerySize: true, 
                adaptiveHeight: false,
                prevNextButtons: false,
                imagesLoaded: true,
                resize: true
            });
        });

        
    };
});