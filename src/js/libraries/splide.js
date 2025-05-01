import Splide from "@splidejs/splide";
import "@splidejs/splide/css";

/**
 * @title Init Slider
 * @description Initialise the splide library for Galleries
 */

export function initSlider(element) {
	//const arrows = element.querySelector("[data-slider-arrows]");

	const splide = new Splide(element, {
		mediaQuery: "min",
		perPage: 1,
		autoWidth: true,
		pagination: false,
		gap: "1rem",
		keyboard: true,
		breakpoints: {
			600: {
				padding: {
					right: "5%",
				},
			},
			1500: {
				padding: {
					right: "30%",
				},
			},
		},
	});

	splide.mount();
}