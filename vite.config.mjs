import { defineConfig, loadEnv } from "vite";
import ViteRestart from "vite-plugin-restart";
import * as path from "path";

import postcss from "./postcss.config.js";

export default defineConfig(({ command, mode }) => {
    const env = loadEnv(mode, process.cwd(), "");
    return {
        base: command === "serve" ? "" : "/dist/",
        build: {
            chunkSizeWarningLimit: 1700,
            manifest: true,
            outDir: "web/dist",
            assetsDir: "assets",
            rollupOptions: {
                input: {
                    main: "src/js/main.js",
                },
            },
        },
        css: {
            postcss,
        },
        publicDir: "src/public",
        resolve: {
            alias: {
                "@": path.resolve(__dirname, "src"),
                "~bootstrap": path.resolve(__dirname, "node_modules/bootstrap"),
            },
        },
        plugins: [
            ViteRestart({
                reload: ["/templates/**/*"],
            }),
        ],
        server: {
            host: "0.0.0.0",
            port: 3000,
            strictPort: true,
            cors: true,
            origin: `${env.PRIMARY_SITE_URL}:3000`,
        },
    };
});
