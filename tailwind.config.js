import tailwindForms from "@tailwindcss/forms";
import tailwindDebug from "./tailwind.debug.js";

export default {
	content: [
		"templates/**/*.{html,twig}",
		"src/**/*.js",
		"config/project/fields/*.yaml",
		"config/project/matrixBlockTypes/*.yaml",
	],
	safelist: [
		"col-span-8",
		"col-span-6",
		"col-start-3",
		"col-start-4",
		"col-span-full",
		{
			pattern: /w-(1)\/(2|3|4)/,
			variants: ["md", "lg"],
		},
	],
	theme: {
		extend: {
			container: {
				center: true,
				screens: {
					xl: "3000px",
				},
			},
			screens: {
				"3xl": "1900px",
			},
			spacing: {
				base: "1rem",
				"base-md": "1.875rem",
			},
			aspectRatio: {
				"4/3": "4 / 3",
			},
			zIndex: {
				"-1": "-1",
			},
		},
		fontFamily: {
			sans: ["proxima-nova", "Verdana", "Verdana"],
			alternative: ["Helvetica", "sans-serif"],
		},
		colors: {
			current: "currentColor",
			transparent: "transparent",
			inherit: "inherit",
			black: "#1D1D1B",
			white: "#fff",
			grey: {
				DEFAULT: "#898A8D",
				80: "#4D4D4E",
				10: "#F3F3F3",
			},
			red: "#E43D30",
		},
		fontSize: {
			sm: "0.875rem", // H5 | Mobile
			base: "1rem", // Tag
			lg: "1.125rem", // Body | Mobile // Caption // Button | Mobile // H5 | Desktop
			xl: "1.25rem", // H4 // Body | Desktop // Button | Desktop
			"2xl": "1.375rem", // Introduction | Mobile
			"3xl": "1.875rem", // H3 | Mobile // Numbering | Mobile
			"4xl": "2rem", // H1 | Mobile // H3 | Desktop // Numbering | Desktop // Introduction | Desktop
			"5xl": "2.125rem", // H2 | Mobile
			"6xl": "2.375rem", // Display | Mobile
			"7xl": "2.75rem", // H2 | Desktop
			"8xl": "3rem", // H1 | Desktop
			"9xl": "4.125rem", // Display | Desktop
			"10xl": "6.125rem", // Statistic | Mobile
			"11xl": "7.5rem", // Statistic | Desktop
		},
		lineHeight: {
			none: "1",
			xs: "1.1",
			sm: "1.2",
			lg: "1.3",
			xl: "1.4",
			"2xl": "1.6",
		},
		letterSpacing: {
			xl: "0.01em",
		},
	},
	plugins: [tailwindForms, tailwindDebug],
};
