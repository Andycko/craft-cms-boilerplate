<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104435_merge_latitude_into_pageSummary migration.
 */
class m250417_104435_merge_latitude_into_pageSummary extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = '39237593-ff51-4bd3-851a-a9dfac329c0b';
    public string $outgoingFieldUid = '42ffab40-fc4c-47cc-a21b-f6998da1d15a';
}
