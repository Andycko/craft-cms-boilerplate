<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104435_merge_header2_into_pageSummary migration.
 */
class m250417_104435_merge_header2_into_pageSummary extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = '39237593-ff51-4bd3-851a-a9dfac329c0b';
    public string $outgoingFieldUid = '6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8';
}
