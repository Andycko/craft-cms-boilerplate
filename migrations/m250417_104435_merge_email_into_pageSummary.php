<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104435_merge_email_into_pageSummary migration.
 */
class m250417_104435_merge_email_into_pageSummary extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = '39237593-ff51-4bd3-851a-a9dfac329c0b';
    public string $outgoingFieldUid = '3cca813e-09a9-4025-8efa-d5ba11d4dd89';
}
