import resolveConfig from "tailwindcss/resolveConfig";
import tailwindConfig from "../../tailwind.config.js";

/* Tailwind configuration */
export const tailwind = resolveConfig(tailwindConfig);

/* Class name that are referenced throughout the codebase */
export const classNames = {
	activeLink: "is-active",
};

/* The name of each cookie used by the site */
export const cookieNames = {
	notificationBannerDismissed: (id = "Default") => `notificationBanner${id}Dismissed`,
	cookiesAccepted: "cookiesAccepted",
};