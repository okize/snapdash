# compile coffeescript into js

gulp = require 'gulp'
gutil = require 'gulp-util'
browserify = require 'browserify'
coffeeify = require 'coffeeify'
source = require 'vinyl-source-stream'

paths = require '../paths'
log = require '../helpers/log.coffee'

gulp.task 'browserify', ->
  log.start 'Bundling modules into javascript'

  browserify({
    entries: [paths.src.coffee]
    extensions: ['.coffee']
    debug: false
  })
  .transform coffeeify
  .bundle()
  .on 'error', (e) -> log.error e
  .pipe source 'scripts.js'
  .pipe gulp.dest(paths.dist.js)
  .on 'end', () -> log.end 'bundling'
