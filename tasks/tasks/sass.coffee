# compile sass into css

gulp = require 'gulp'
sass = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'

config = require '../config'
log = require '../helpers/log.coffee'

gulp.task 'sass', ->
  log.info 'Compiling sass into css'
  gulp
    .src config.src.sass
    .pipe sourcemaps.init()
    .pipe sass(
      errLogToConsole: true
    )
    .pipe sourcemaps.write()
    .pipe gulp.dest config.dist.cssDir
    .on 'error', (e) -> log.error e
