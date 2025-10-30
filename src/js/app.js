import "@/css/app.css";
import "preline"; 

/* Imports */
import { isOnPage } from "./helpers";

// Import Infinite Scroll
import { InfiniteScroll } from 'infinite-scroll';

/* Elements */
import {
	getHeaderMenuContainer,
	getLazyLoadElements,
	getSliders,
	getStats,
	getTicker,
	getAccordionImage
	//getVideos,
	//getAccordions,
} from "./elements";

async function initApp() {
	document.documentElement.classList.remove("no-js");
	window.onload = () => document.documentElement.classList.remove("preload");

	// Libraries
	// __________________________________________________

	/**
	 * @title Lazy Load
	 * @description Initialisation logic for the Lazy Load library
	 **/
	const lazyLoadElements = getLazyLoadElements();
	if (isOnPage(lazyLoadElements)) {
		const { initLazyLoad } = await import("./libraries/lazy-load");

		initLazyLoad();
	}

	// /**
	//  * @title Videos
	//  * @description Initialisation logic for the videos.
	//  **/
	// const videos = getVideos();
	// if (isOnPage(videos)) {
	// 	const { initVidStack } = await import("./libraries/vidstack");

	// 	videos.forEach((element) => initVidStack(element));
	// }

	// /**
	//  * @title Sliders
	//  * @description Initialisation logic for the sliders.
	//  **/
	// const sliders = getSliders();
	// if (isOnPage(sliders)) {
	// 	const { initSlider } = await import("./libraries/splide");

	// 	sliders.forEach((element) => initSlider(element));
	// }

	// // Modules
	// // __________________________________________________

	/**
	 * @title Navigation Menu
	 * @description Initialise the site's navigation menu
	 **/
	const headerMenuContainer = getHeaderMenuContainer();
	if (isOnPage(headerMenuContainer)) {
		const { initNavigation } = await import("./components/nav");

		initNavigation(); 
	}

	// /**
	//  * @title Accordions
	//  * @description Initialisation logic for the accordions
	//  **/
	// const accordions = getAccordions();
	// if (isOnPage(accordions)) {
	// 	const { initAccordion } = await import("./components/accordion");

	// 	accordions.forEach((element) => initAccordion(element));
	// } 

	/**
	 * @title Stats
	 * @description Initialise Count Up for Stats
	 **/ 
	const statsContainer = getStats();
	if (isOnPage(statsContainer)) {
		const { initStats } = await import("./components/stats");

		initStats(); 
	}

	/**
	 * @title Ticker
	 * @description Initialise ticker
	 **/ 
	const tickerContainer = getTicker();
	if (isOnPage(tickerContainer)) {
		const { initTicker } = await import("./components/ticker");

		initTicker(); 
	}
}

initApp();