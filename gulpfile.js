const gulp = require('gulp');
const log = require('fancy-log')
const autoprefixer = require('gulp-autoprefixer');
const sass = require('gulp-sass')(require('sass'));
const sassGlob = require('gulp-sass-glob');
const cleanCSS = require('gulp-clean-css');
const concat = require('gulp-concat');
const source = require('vinyl-source-stream');
const babelify = require('babelify');
const browserify = require('browserify');
const uglify = require('gulp-uglify');
const streamify = require('gulp-streamify');
const wait = require('gulp-wait');
// const sourcemaps = require('gulp-sourcemaps');

/*
 |--------------------------------------------------------------------------
 | Same as browserify task, but will also watch for changes and re-compile.
 |--------------------------------------------------------------------------
*/
gulp.task('mainJS', function() {
    return browserify('./src/js/main.js')
        .transform(babelify, {presets: ["@babel/preset-env"]})
        .bundle()
        .pipe(wait(1500)) // time delay so ftp finished stransfering
        .on('error', function(e) {
            log(e);
        })
        .pipe(source('bundle.main.js'))
        .pipe(streamify(uglify()))
        .pipe(gulp.dest('./public/js'));
});

/*
 |--------------------------------------------------------------------------
 | Compile SASS stylesheets.
 |--------------------------------------------------------------------------
 */

var styleList = [
    './src/css/style.sass'
];

gulp.task('styles', function() {
    return gulp.src(styleList)
        .pipe(concat('style.css'))
        .pipe(wait(1500))
        .pipe(sassGlob())
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(cleanCSS())
        .pipe(autoprefixer({}))
        .pipe(gulp.dest('./public/css'));
});

gulp.task('watch', function () {
    gulp.watch('./src/css/**/*.sass', gulp.series('styles'));
    gulp.watch('./src/js/components/*.js', gulp.series('mainJS'));
    gulp.watch('./src/js/main.js', gulp.series('mainJS'));
});

gulp.task('default', gulp.parallel('styles', 'mainJS', 'watch'));
