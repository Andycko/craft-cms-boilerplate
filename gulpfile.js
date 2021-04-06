const gulp = require('gulp');
const gutil = require('gulp-util');
const autoprefixer = require('gulp-autoprefixer');
const sass = require('gulp-dart-sass');
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
    return browserify('./public/js/main.js')
        .transform(babelify, {presets: ["es2015"]})
        .bundle()
        .pipe(wait(1500)) // time delay so ftp finished stransfering
        .on('error', function(e) {
            gutil.log(e);
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
    './public/css/style.scss'
];

gulp.task('styles', function() {
    return gulp.src(styleList)
        .pipe(concat('style.css'))
        .pipe(wait(1500))
        .pipe(sassGlob())
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(cleanCSS())
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(gulp.dest('./public/css'));
});

gulp.task('watch', function () {
    gulp.watch('./public/css/**/*.sass', gulp.series('styles'));
    gulp.watch('./public/js/components/*.js', gulp.series('mainJS'));
    gulp.watch('./public/js/main.js', gulp.series('mainJS'));
});

gulp.task('default', gulp.parallel('styles', 'mainJS', 'watch'));
