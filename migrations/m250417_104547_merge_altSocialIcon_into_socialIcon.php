<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104547_merge_altSocialIcon_into_socialIcon migration.
 */
class m250417_104547_merge_altSocialIcon_into_socialIcon extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = 'a596aec7-c8ec-49d7-ab4d-97dcdf5ac990';
    public string $outgoingFieldUid = 'd9aafe6e-671c-45da-9958-ccb6470336d6';
}
