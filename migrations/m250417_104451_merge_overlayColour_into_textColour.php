<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104451_merge_overlayColour_into_textColour migration.
 */
class m250417_104451_merge_overlayColour_into_textColour extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = 'e5b76ff1-163b-49c0-bd4d-718bc1b5db55';
    public string $outgoingFieldUid = '7bbfb4fd-f907-4f9c-8c1a-f2a2c7e60aa2';
}
