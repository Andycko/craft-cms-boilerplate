export default ({ addBase, theme }) => {
	if (process.env.NODE_ENV !== "development") return;

	const icon = `data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 54 33'%3E%3Cpath fill='%2338bdf8' d='M27 0c-7.2 0-11.7 3.6-13.5 10.8 2.7-3.6 5.85-4.95 9.45-4.05 2.054.513 3.522 2.004 5.147 3.653C30.744 13.09 33.808 16.2 40.5 16.2c7.2 0 11.7-3.6 13.5-10.8-2.7 3.6-5.85 4.95-9.45 4.05-2.054-.513-3.522-2.004-5.147-3.653C36.756 3.11 33.692 0 27 0zM13.5 16.2C6.3 16.2 1.8 19.8 0 27c2.7-3.6 5.85-4.95 9.45-4.05 2.054.514 3.522 2.004 5.147 3.653C17.244 29.29 20.308 32.4 27 32.4c7.2 0 11.7-3.6 13.5-10.8-2.7 3.6-5.85 4.95-9.45 4.05-2.054-.513-3.522-2.004-5.147-3.653C23.256 19.31 20.192 16.2 13.5 16.2z'/%3E%3C/svg%3E%0A`;

	const tailwindBreakpoints = () => {
		const screens = theme("screens", {});
		const breakpoints = Object.keys(screens);

		addBase({
			"body::after": {
				content: `"< ${screens[breakpoints[0]]}"`,
				position: "fixed",
				inset: "auto auto 10px 10px",
				padding: "6px 10px 6px 40px",
				background: `#000000 url("${icon}") no-repeat 10px center / 24px`,
				color: "#ffffff",
				font: "bold 14px sans-serif",
				borderRadius: "10px",
			},
			...breakpoints.reduce((acc, current) => {
				acc[`@media (min-width: ${screens[current]})`] = {
					"body::after": {
						content: `"${current}"`,
					},
				};
				return acc;
			}, {}),
		});
	};

	tailwindBreakpoints();
};
