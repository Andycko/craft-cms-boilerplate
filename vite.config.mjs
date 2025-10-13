import { defineConfig, loadEnv } from "vite";
import ViteRestart from "vite-plugin-restart";
import * as path from "path";

import tailwindcss from "@tailwindcss/vite";

export default defineConfig(({ command, mode }) => {
	const env = loadEnv(mode, process.cwd(), "");

	return {
		base: command === "serve" ? "" : "/dist/",
		build: {
			manifest: true,
			outDir: "web/dist",
			assetsDir: "assets",
			rollupOptions: {
				input: {
					app: "src/js/app.js",
				},
			},
		},
		publicDir: "src/public",
		resolve: {
			alias: {
				"@": path.resolve(__dirname, "src"),
			},
		},
		plugins: [
			tailwindcss(),
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