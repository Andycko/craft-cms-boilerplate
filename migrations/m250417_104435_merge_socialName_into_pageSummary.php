<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104435_merge_socialName_into_pageSummary migration.
 */
class m250417_104435_merge_socialName_into_pageSummary extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = '39237593-ff51-4bd3-851a-a9dfac329c0b';
    public string $outgoingFieldUid = '1f6a1dc8-82d8-47a8-ae54-01af20652730';
}
