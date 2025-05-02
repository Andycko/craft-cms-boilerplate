# Craft CMS Boilerplate

This is a boilerplate for a Craft 5 CMS install with a few plugins already installed, custom file structure, and some pages with nav and a footer.

### Usage
Firstly you need to **create a database** on your localhost.

To set up the boilerplate, you can use **composer**:
```
composer create-project fortytwo-studio/craft-cms-boilerplate [path]
```

1. Alternatively you can clone the repo: https://github.com/fortytwostudio/craft-cms-boilerplate
2. Run `composer install`
    - The `post-install-cmd` hook will run the setup, db import, npm install and finally removes the post-install-cmd scripts
3. Run `npm install`    
    
#### ViteJS
ViteJs is utilised in the project to watch and build **sass** and **js**.
Therefore you will need to have ```vite-cli``` installed to rebuild files. You can install it with node: ```npm install -D vite```.

After that, just use ```npm run dev``` in the terminal to turn on the file watchers.

!! Before deploying changes to staging or production, make sure to run ```npm run build``` !!
 
### Plugins installed
- [craftcms/aws-s3](https://plugins.craftcms.com/aws-s3)
- [supercool/buttonbox](https://plugins.craftcms.com/buttonbox)
- [craftcms/ckeditor](http://plugins.craftcms.com/ckeditor)
- [solspace/craft-freeform](https://plugins.craftcms.com/freeform)
- [johnhenry/matrix-block-anchor](https://plugins.craftcms.com/matrix-block-anchor)
- [verbb/navigation](https://plugins.craftcms.com/navigation)
- [ether/seo](https://plugins.craftcms.com/seo)
- [verbb/super-table](https://plugins.craftcms.com/super-table)
- [sebastianlenz/linkfield](https://plugins.craftcms.com/typedlinkfield?craft5)
- [nystudio107/craft-vite](https://plugins.craftcms.com/vite?craft5)
- [wrav/oembed](https://plugins.craftcms.com/oembed?craft5)

### Bootstrap
Bootstrap is installed as a node module and is imported via:
- CSS: ```@webroot/src/css/style.css```
- JS: ```@webroot/src/js/main.js```

### Splide (sliders)
Splide is installed as a node module and is imported and initialised in: <br>
```@webroot/src/js/libraries/splide.js```

### vanilla-lazyload (lazyload)
vanilla-lazyload is installed as a node module and is imported and initialised in: <br>
```@webroot/src/js/libraries/lazy-load.js```

### JQuery
JQuery is installed as a node module. Can be imported into JS files via: <br>
```import $ from 'jquery';```

### Dependencies
- [Composer 2](https://getcomposer.org/)
- [PHP >= 8.2](https://www.php.net/)
- [Craft 5 CMS Requirements](https://craftcms.com/docs/5.x/requirements.html)