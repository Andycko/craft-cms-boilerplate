# Craft CMS Boilerplate

This is a boilerplate for a basic craft install with a few plugins already installed and a basic file structure.

### Usage
Firstly you need to **create a database** on your localhost.

To set up the boilerplate, you can use **composer**:
```
composer create-project fortytwo-studio/craft-cms-boilerplate
```

Alternatively you can:
1. Clone the repo
2. Run `composer install`
3. Run `./craft setup`
4. Run `./craft db/restore ./storage/setup/default_db.sql` or manually import this to your db

