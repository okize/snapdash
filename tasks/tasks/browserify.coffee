# compile coffeescript into js

gulp = require 'gulp'
gutil = require 'gulp-util'
browserify = require 'browserify'
coffeeify = require 'coffeeify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
sourcemaps = require 'gulp-sourcemaps'

paths = require '../paths'
log = require '../helpers/log.coffee'

gulp.task 'browserify', ->
  log.start 'Bundling modules into javascript'
  browserify(
    entries: [paths.src.coffee]
    extensions: ['.coffee']
    debug: true
  )
  .transform coffeeify
  .bundle()
  .pipe source 'scripts.js'
  .pipe buffer()
  .pipe sourcemaps.init(loadMaps: true)
  .pipe sourcemaps.write()
  .pipe gulp.dest paths.dist.js
  .on 'error', (e) -> log.error e
  .on 'end', () -> log.end 'bundling'
