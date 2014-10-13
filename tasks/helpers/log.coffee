# small wrapper for gulp logging

gutil = require 'gulp-util'

module.exports =

  # info logging
  info: (msg) ->
    gutil.log gutil.colors.blue(msg)

  # error logging
  error: (msg) ->
    gutil.log gutil.colors.red(msg)
