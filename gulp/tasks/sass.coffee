# compile sass into css

path = require 'path'
gulp = require 'gulp'
sass = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'

config = require '../config'
log = require '../helpers/log'

gulp.task 'sass', ->
  log.info 'Compiling sass into css'
  gulp
    .src path.join(config.src.sassDir, '**/*.{sass,scss}')
    .pipe sourcemaps.init()
    .pipe sass(
      errLogToConsole: true
    )
    .pipe sourcemaps.write()
    .pipe gulp.dest config.dist.cssDir
    .on 'error', (e) -> log.error e
