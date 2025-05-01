import fs from "fs";
import chalk from "chalk";
import favicons from "favicons";

const path = "/dist/favicons";
const source = "src/images/favicon.svg";
const destination = "src/public/favicons";
const output = destination + "/favicons.html";

const configuration = {
    path: path,
    background: "#ffffff",
    theme_color: "#ffffff",
    loadManifestWithCredentials: true,
    icons: {
        android: true,
        appleIcon: true,
        appleStartup: false,
        coast: false,
        favicons: true,
        windows: true,
        yandex: false,
    },
};

console.log("Generating Favicons...");

try {
    const response = await favicons(source, configuration);

    if (fs.existsSync(destination)) fs.rmSync(destination, { recursive: true });
    if (!fs.existsSync(destination)) fs.mkdirSync(destination);

    response.images.map((image) => {
        fs.writeFileSync(destination + `/${image.name}`, image.contents);
    });
    response.files.map((file) => {
        fs.writeFileSync(destination + `/${file.name}`, file.contents);
    });

    // Add ico image to web folder
    response.images.map((image) => {
        if (image.name === "favicon.ico") {
            fs.writeFileSync(`web/${image.name}`, image.contents);
        }
    });

    let html = response.html;
    const forDeletion = [
        '<meta name="application-name">',
        '<meta name="apple-mobile-web-app-title">',
    ];

    html = html.filter((item) => !forDeletion.includes(item));

    fs.writeFileSync(output, html.join(""));
    fs.copyFileSync(source, destination + "/" + source.split("/").pop());

    console.log(chalk.gray(`Generated: ${destination}`));
    console.log(chalk.green.bold("Favicons successfully generated! 🎉"));
} catch (error) {
    if (error) console.log(chalk.red.bold("ERROR:", error.message));
}
