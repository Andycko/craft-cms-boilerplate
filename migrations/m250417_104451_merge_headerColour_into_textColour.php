<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104451_merge_headerColour_into_textColour migration.
 */
class m250417_104451_merge_headerColour_into_textColour extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = 'e5b76ff1-163b-49c0-bd4d-718bc1b5db55';
    public string $outgoingFieldUid = 'd0dfc594-439a-40f9-8d15-a5ba6a0a5a1b';
}
