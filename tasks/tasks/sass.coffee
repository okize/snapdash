# compile sass into css

gulp = require 'gulp'
sass = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'

paths = require '../paths'
log = require '../helpers/log.coffee'

gulp.task 'sass', ->
  log.info 'Compiling sass into css'
  gulp
    .src paths.src.sass
    .pipe sourcemaps.init()
    .pipe sass(
      errLogToConsole: true
    )
    .pipe sourcemaps.write()
    .pipe gulp.dest paths.dist.cssDir
    .on 'error', (e) -> log.error e
