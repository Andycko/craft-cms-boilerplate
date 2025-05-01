module.exports = {
	printWidth: 100,
	useTabs: true,
	trailingComma: "all",
	overrides: [
		{
			files: "*.php",
			options: {
				singleQuote: true,
			},
		},
		{
			files: ["*.twig"],
			options: {
				twigPrintWidth: 100,
				twigFollowOfficialCodingStandards: false,
				twigMultiTags: [
					"nav,endnav",
					"switch,case,default,endswitch",
					"ifchildren,endifchildren",
					"cache,endcache",
					"apply,endapply",
					"tag,endtag",
				],
			},
		},
	],
};
