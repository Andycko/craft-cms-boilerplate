/* Imports */
import "@/css/style.css";
import { isOnPage } from "./helpers";

/* Elements */
import {
	getLazyLoadElements,
	getSlider,
} from "./elements"; 


// Import all of Bootstrap's JS
import * as bootstrap from 'bootstrap'

// Import custom js
import './components/nav.js'; 


/**
 * @title Lazy Load
 * @description Initialisation logic for the Lazy Load library
**/
const lazyLoadElements = getLazyLoadElements();
if (isOnPage(lazyLoadElements)) {
    const { initLazyLoad } = await import("./libraries/lazy-load");

    initLazyLoad();
}

/**
 * @title Sliders
 * @description Initialisation logic for the sliders.
**/
const sliders = getSlider();
if (isOnPage(sliders)) {
    const { initSlider } = await import("./libraries/splide");

    sliders.forEach((element) => initSlider(element));
}