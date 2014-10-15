# starts up the application with nodemon
# and loads environment variables from .env

path = require 'path'
dotenv = require('dotenv').load()
gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
sync = require 'browser-sync'

log = require '../helpers/log'
config = require '../config'
debugPort = process.env.DEBUG_PORT or 5858
liveReloadPort = process.env.LIVE_RELOAD_PORT or 35729

gulp.task 'start', ->
  log.info 'Starting application server'
  nodemon(
    script: config.main
    ext: 'coffee'
    env: process.env
    nodeArgs: ['--nodejs', "--debug=#{debugPort}"]
    ignore: config.appIgnoreDirs
  ).on('restart', (files) ->
    log.info 'Application restarted'
    sync.reload(stream:false)
  ).on('quit', ->
    log.info 'Application closed'
    gutil.beep()
  )
