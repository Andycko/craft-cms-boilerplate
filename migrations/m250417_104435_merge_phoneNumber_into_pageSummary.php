<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104435_merge_phoneNumber_into_pageSummary migration.
 */
class m250417_104435_merge_phoneNumber_into_pageSummary extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = '39237593-ff51-4bd3-851a-a9dfac329c0b';
    public string $outgoingFieldUid = '386e1cf1-acc9-4336-90e1-fb74daefd6f5';
}
