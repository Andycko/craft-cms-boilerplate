<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104416_merge_address_into_copy migration.
 */
class m250417_104416_merge_address_into_copy extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = '1d1c9f28-39de-4df6-b077-856d16c001ca';
    public string $outgoingFieldUid = '4af3caf9-e4e3-4acd-90f8-1e8cd585e497';
}
