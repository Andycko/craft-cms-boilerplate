import Splide from "@splidejs/splide";
import "@splidejs/splide/css";

/**
 * @title Init Slider
 * @description Initialise the splide library for Galleries
 */
export function initSlider(element) {
	const arrows = element.querySelector("[data-slider-arrows]");

	new Splide(element, {
		mediaQuery: "min",
		perPage: 1,
		arrows: arrows !== null,
		pagination: false,
		keyboard: true,
	}).mount();
}