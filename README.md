# Craft CMS Boilerplate

This is a boilerplate for a craft install with a few plugins already installed, custom file structure, and a few pages with nav and a footer.

### Usage
Firstly you need to **create a database** on your localhost.

To set up the boilerplate, you can use **composer**:
```
composer create-project fortytwo-studio/craft-cms-boilerplate [path]
```

Alternatively you can:
1. Clone the repo
2. Run `composer install`
    - The `post-install-cmd` hook will run the setup, db import and finally removes the post-install-cmd scripts
    
### Plugins installed
- [craftcms/aws-s3](https://plugins.craftcms.com/aws-s3)
- [supercool/buttonbox](https://plugins.craftcms.com/buttonbox)
- [solspace/craft-freeform](https://plugins.craftcms.com/freeform)
- [spicyweb/craft-neo](https://plugins.craftcms.com/neo)
- [verbb/navigation](https://plugins.craftcms.com/navigation)
- [craftcms/redactor](https://plugins.craftcms.com/redactor)
- [ether/seo](https://plugins.craftcms.com/seo)
- [verbb/super-table](https://plugins.craftcms.com/super-table)