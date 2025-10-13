// CSS
import "vidstack/player/styles/base.css";
import "vidstack/player/styles/plyr/theme.css";

// JS
import { PlyrLayout, VidstackPlayer } from "vidstack/global/player";

/**
 * @title Should Load
 * @description Determines whether or not the video element should be loaded.
 * @param {Element} target - The target element to be observed
 */
function shouldLoad(target) {
	/* The Intersection Observer's configuration object */
	const configuration = {
		rootMargin: "50% 0%",
	};

	return new Promise((resolve) => {
		const observer = new IntersectionObserver(([entry]) => {
			if (entry.isIntersecting) {
				/* Disconnect the observer once it's been triggered */
				observer.disconnect();

				resolve(true);
			}
		}, configuration);

		observer.observe(target);
	});
}

/**
 * @title "play" Callback
 * @description Logic to run when Plyr's "play" event has been fired.
 * @param {Event} event - The listener's event
 */
function playCallback(player) {
	const observer = new IntersectionObserver(
		([entry]) => {
			const target = entry.target;

			if (entry.isIntersecting) {
				if (target.paused) {
					target.play();
				}
			} else {
				target.pause();
			}
		},
		{
			rootMargin: "50% 0%",
		},
	);

	observer.observe(player);
}

/**
 * @title Vidstack
 * @description Initialise the Lazy Load library
 */
export async function initVidStack(element) {
	const videoSrc = element.getAttribute("data-video-src");
	const ratio = element.getAttribute("data-video-ratio");
	const allowFullScreen = !element.classList.contains("player-background");
	const videoLoad = element.getAttribute("load");

	// Check about lazy load
	if (videoLoad !== "eager") {
		const shouldLoadResult = await shouldLoad(element);
	}

	// Check if a poster exists
	const parent = element.parentNode;
	const videoPoster = parent ? parent.querySelector("[data-video-poster]") : null;

	// Options
	const options = {
		target: element,
		src: videoSrc,
		aspectRatio: ratio,
	};

	if (!element.hasAttribute("data-autoplay")) {
		options.layout = new PlyrLayout();
	}

	// Create Video
	const player = await VidstackPlayer.create(options);

	if (player.hasAttribute("autoplay")) {
		player.setAttribute("tabindex", "-1");

		const video = player.querySelector("video");

		if (video) {
			video.setAttribute("tabindex", "-1");
		}
	}

	if (videoPoster) {
		videoPoster.addEventListener("click", (e) => {
			player.play();
			videoPoster.classList.add("opacity-0", "invisible");
		});
	}

	/* When the player has started playing... */
	player.addEventListener("play", (e) => {
		playCallback(player);
		if (videoPoster) {
			videoPoster.classList.add("opacity-0", "invisible", "pointer-events-none");
		}
	});
}