# compile coffeescript into js

gulp = require 'gulp'
gutil = require 'gulp-util'
browserify = require 'browserify'
coffeeify = require 'coffeeify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
sourcemaps = require 'gulp-sourcemaps'

config = require '../config'
log = require '../helpers/log.coffee'

gulp.task 'browserify', ->
  log.start 'Bundling modules into javascript'
  browserify(
    entries: [config.src.coffee]
    extensions: ['.coffee']
    debug: true
  )
  .transform coffeeify
  .bundle()
  .pipe source config.dist.jsName
  .pipe buffer()
  .pipe sourcemaps.init(loadMaps: true)
  .pipe sourcemaps.write()
  .pipe gulp.dest config.dist.jsDir
  .on 'error', (e) -> log.error e
  .on 'end', () -> log.end 'bundling'
