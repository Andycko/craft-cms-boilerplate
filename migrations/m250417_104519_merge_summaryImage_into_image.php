<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104519_merge_summaryImage_into_image migration.
 */
class m250417_104519_merge_summaryImage_into_image extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = '0ffba24e-268b-4f2c-a3f2-ad976b64c979';
    public string $outgoingFieldUid = '4184d945-e90d-4433-b1f3-727edf65107e';
}
