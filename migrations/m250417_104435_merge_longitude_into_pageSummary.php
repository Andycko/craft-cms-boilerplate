<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104435_merge_longitude_into_pageSummary migration.
 */
class m250417_104435_merge_longitude_into_pageSummary extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = '39237593-ff51-4bd3-851a-a9dfac329c0b';
    public string $outgoingFieldUid = 'd9a8f905-7705-41f9-a662-e8966f03085f';
}
