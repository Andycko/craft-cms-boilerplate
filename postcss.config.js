import postcssImport from "postcss-import";
// import tailwindNesting from "tailwindcss/nesting";
// import tailwindCss from "tailwindcss";
import autoprefixer from "autoprefixer";

//import tailwindConfig from "./tailwind.config.js";

export default {
    plugins: [
        postcssImport,
        // tailwindNesting,
        // tailwindCss(tailwindConfig),
        autoprefixer,
    ],
};
