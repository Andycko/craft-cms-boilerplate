# Craft CMS Boilerplate

This is a boilerplate for a basic craft install with a few plugins already installed and a basic file structure.

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
    

