<?php
/**
 * Vite plugin for Craft CMS 3.x
 *
 * Allows the use of the Vite.js next generation frontend tooling with Craft CMS.
 *
 * @link      https://nystudio107.com
 * @copyright Copyright (c) 2021 nystudio107
 */

use craft\helpers\App;

$currentSite = Craft::$app->getSites()->currentSite;

return [
    /**
     * @var bool Should the dev server be used?
     */
    "useDevServer" => App::env("CRAFT_ENVIRONMENT") === "dev",

    /**
     * @var string File system path (or URL) to the Vite-built manifest.json
     */
    "manifestPath" => "@webroot/dist/.vite/manifest.json",

    /**
     * @var string The public URL to the dev server (what appears in `<script src="">` tags
     */
    "devServerPublic" => App::env("PRIMARY_SITE_URL") . ":3000",

    /**
     * @var string The public URL to use when not using the dev server
     */
    "serverPublic" => $currentSite->baseUrl . "dist/",

    /**
     * @var string The JavaScript entry from the manifest.json to inject on Twig error pages
     *              This can be a string or an array of strings
     */
    "errorEntry" => "",

    /**
     * @var string String to be appended to the cache key
     */
    "cacheKeySuffix" => "",

    /**
     * @var string The internal URL to the dev server, when accessed from the environment in which PHP is executing
     *              This can be the same as `$devServerPublic`, but may be different in containerized or VM setups.
     *              ONLY used if $checkDevServer = true
     */
    "devServerInternal" => "http://localhost:3000",

    /**
     * @var bool Should we check for the presence of the dev server by pinging $devServerInternal to make sure it's running?
     */
    "checkDevServer" => true,

    /**
     * @var bool Whether the react-refresh-shim should be included
     */
    "includeReactRefreshShim" => false,

    /**
     * @var bool Whether the modulepreload-polyfill shim should be included
     */
    "includeModulePreloadShim" => true,

    /**
     * @var string File system path (or URL) to where the Critical CSS files are stored
     */
    "criticalPath" => "",

    /**
     * @var string the suffix added to the name of the currently rendering template for the critical css file name
     */
    "criticalSuffix" => "",
];
