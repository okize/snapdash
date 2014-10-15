# watches source files and triggers a page refresh on change

path = require 'path'
gulp = require 'gulp'

config = require '../config'
log = require '../helpers/log'

gulp.task 'watch', ['sync'], ->
  log.info 'Watching assets for changes...'

  gulp.watch path.join(config.src.sassDir, '**/*.sass'), ['sass']
  gulp.watch path.join(config.src.coffeeDir, '**/*.coffee'), ['browserify']
