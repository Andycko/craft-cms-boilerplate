<?php

namespace craft\contentmigrations;

use Craft;
use craft\migrations\BaseFieldMergeMigration;

/**
 * m250417_104530_merge_transparentNav_into_showOverlay migration.
 */
class m250417_104530_merge_transparentNav_into_showOverlay extends BaseFieldMergeMigration
{
    public string $persistingFieldUid = 'f4ab9061-e9c0-4e8c-9e1f-70b599725985';
    public string $outgoingFieldUid = '8d7e4ca7-1762-4215-b1e0-3022ed0176b3';
}
