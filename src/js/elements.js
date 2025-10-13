/* The site's header menu container */
export const getHeaderMenuContainer = () => document.querySelector("#menu-btn");

/* An instance of an element using the LazyLoad library. I.E. Images */
export const getLazyLoadElements = () => document.querySelectorAll(".lazy");

/* Splide Sliders */
export const getSliders = () => document.querySelectorAll(".splide");

// /* Videos */
// export const getVideos = () => document.querySelectorAll("[data-video]"); 

/* All instances of accordions */
// export const getAccordions = () => document.querySelectorAll("[data-accordion]");

/* All instances of accordion + image */
export const getAccordionImage = () => document.querySelectorAll(".accordionImage-block");

/* All instances of stats */
export const getStats = () => document.querySelectorAll("[data-counter]");

/* All instances of tickers */
export const getTicker = () => document.querySelectorAll(".ticker"); 