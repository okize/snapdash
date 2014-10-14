# minifies static assets

path = require 'path'
gulp = require 'gulp'
paths = require '../paths'
rename = require 'gulp-rename'
uglify = require 'gulp-uglify'
minifycss = require 'gulp-minify-css'

paths = require '../paths'
log = require '../helpers/log.coffee'

gulp.task 'minify', ->
  log.info 'Minifying javascript'

  # js
  gulp
    .src path.join(paths.dist.jsDir, paths.dist.jsName)
    .pipe uglify()
    .pipe rename(suffix: '.min')
    .pipe gulp.dest paths.dist.jsDir
    .on 'error', (e) -> log.error e

  # css
  gulp
    .src path.join(paths.dist.cssDir, paths.dist.cssName)
    .pipe minifycss()
    .pipe rename(suffix: '.min')
    .pipe gulp.dest paths.dist.cssDir
    .on 'error', (e) -> log.error e