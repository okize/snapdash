# builds front-end assets

gulp = require 'gulp'
run = require 'run-sequence'

gulp.task 'build', (callback) ->
  run(
    'clean',
    'sass',
    callback
  )
