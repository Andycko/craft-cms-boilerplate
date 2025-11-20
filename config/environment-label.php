<?php
/**
 * Environment Label Configuration
 *
 * Configuration related to the Environment Label plugin by Top Shelf Craft.
 * https://github.com/TopShelfCraft/Environment-Label
 */

use craft\helpers\App;

return [
	'showLabel' => true,
	'labelText' => strtoupper(App::env('CRAFT_ENVIRONMENT')),
	'prefixText' => null,
	'suffixText' => null,
	'labelColor' => '#60a5fa',
	'textColor' => '#ffffff',
	'targetSelector' => '#global-header .flex:before',
];