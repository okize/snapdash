# minifies static assets

path = require 'path'
gulp = require 'gulp'
rename = require 'gulp-rename'
uglify = require 'gulp-uglify'
minifycss = require 'gulp-minify-css'

config = require '../config'
log = require '../helpers/log'

gulp.task 'minify', ->
  log.info 'Minifying javascript'

  # js
  gulp
    .src path.join(config.dist.jsDir, config.dist.jsName)
    .pipe uglify()
    .pipe rename(suffix: '.min')
    .pipe gulp.dest config.dist.jsDir
    .on 'error', (e) -> log.error e

  # css
  gulp
    .src path.join(config.dist.cssDir, config.dist.cssName)
    .pipe minifycss()
    .pipe rename(suffix: '.min')
    .pipe gulp.dest config.dist.cssDir
    .on 'error', (e) -> log.error e
