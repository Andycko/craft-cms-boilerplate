<?php
/**
 * This script runs after the setup of the boilerplate finishes
 * and removes the post-install-cmd scripts so that after composer
 * install is run again, it won't run any scripts
 */

$json_in = json_decode(file_get_contents("composer.json"), true);     // Read composer.json and decode
unset($json_in["scripts"]["post-install-cmd"]);      // Remove the post-install-cmd hook scripts
file_put_contents("composer.json", json_encode($json_in,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));      // Write updated json to composer.json
