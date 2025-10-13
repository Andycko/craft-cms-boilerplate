import tailwindForms from "@tailwindcss/forms";
import tailwindDebug from "./tailwind.debug.js";

export default {
	content: [
		"templates/**/*.{html,twig}",
		"src/**/*.js",
		"config/project/fields/*.yaml",
		"config/colour-swatches.php",
		"config/project/matrixBlockTypes/*.yaml",
	],
	safelist: [
		{
			pattern: /p(b|t)-\d*/,
			variants: ["md", "lg", "xl", "2xl", "3xl"],
		},
		{
			pattern: /m(b|t)-\d*/,
			variants: ["md", "lg", "xl", "2xl", "3xl"],
		},
		{
			pattern: /w-\d*/,
			variants: ["md", "lg", "xl", "2xl", "3xl"],
		},
	],
	theme: {
		extend: {
			container: {
				center: true,
			},
			spacing: {
				base: "2rem", // E.G. p-8
				"base-sm": "3rem", // E.G. p-12
				"base-md": "4rem", // E.G. p-16
			},
			zIndex: {
				"-1": "-1",
			},
		},
		fontFamily: {
			sans: ["Helvetica", "Arial", "sans-serif"],
		},
		colors: {
			transparent: "transparent",
			current: "currentColor",
			inherit: "inherit",
			black: "#000",
			white: "#fff",
			gray: {
				DEFAULT: "#4b5563",
				light: "#9ca3af",
			},
			error: "#ef4444",
			success: "#22c55e",
		},
	},
	plugins: [tailwindForms, tailwindDebug],
};