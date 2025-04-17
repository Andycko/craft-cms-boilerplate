import $ from 'jquery';
//import Flickity from 'flickity';
import Flickity from 'flickity-imagesloaded';


$(function(){
    if (document.querySelector('.productsSlider-block')) {
        const flkty = new Flickity('#productSlider', {
            autoPlay: 3000,
            cellAlign: 'left',
            setGallerySize: true, 
            adaptiveHeight: true,
            prevNextButtons: false,
            wrapAround: true,
            //imagesLoaded: true
        }); 
    };
});