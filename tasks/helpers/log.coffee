gulp = require 'gulp'
gutil = require 'gulp-util'

# export log methods
module.exports =

  # info logging
  info: (msg) ->
    gutil.log gutil.colors.blue(msg)

  # error logging
  error: (msg) ->
    gutil.log gutil.colors.red(msg)
