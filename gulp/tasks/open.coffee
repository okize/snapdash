# open application in default browser
# TODO: command line args to pick which browser to open

path = require 'path'
gulp = require 'gulp'
open = require 'gulp-open'

log = require '../helpers/log'
config = require '../config'

gulp.task 'open', ->
  log.info 'Opening application in browser'
  if (process.env.NODE_ENV == 'development')
    port = process.env.BROWSER_SYNC_PORT
  else
    port = process.env.EXPRESS_PORT
  options =
    url: "http://localhost:#{port}"
    # app: 'firefox'

  gulp
    .src config.main
    .pipe open('', options)
