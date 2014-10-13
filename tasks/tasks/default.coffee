# runs local server with livereload

gulp = require 'gulp'
run = require 'run-sequence'

gulp.task 'default', (callback) ->
  run(
    'start',
    callback
  )
