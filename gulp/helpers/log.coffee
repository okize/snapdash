# small wrapper for gulp logging

gutil = require 'gulp-util'
prettyHrtime = require 'pretty-hrtime'
startTime = undefined

module.exports =

  # info logging
  info: (msg) ->
    gutil.log gutil.colors.blue(msg)

  # error logging
  error: (msg) ->
    gutil.log gutil.colors.red(msg)

  # start logging with timer
  start: (msg) ->
    startTime = process.hrtime()
    gutil.log gutil.colors.blue(msg)

  # displays task time since timer started
  end: (task) ->
    taskTime = prettyHrtime process.hrtime(startTime)
    gutil.log 'Finished', gutil.colors.cyan(task), 'after', gutil.colors.magenta(taskTime)
