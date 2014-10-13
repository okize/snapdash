# TASK: starts up LiveReload server and the app with nodemon

path = require 'path'
dotenv = require('dotenv').load()
gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
log = require path.join(__dirname, '..', 'helpers', 'log.coffee')

# configuration
app = path.join(__dirname, '..', '..', 'app.coffee')
debugPort = process.env.DEBUG_PORT or 5858
liveReloadPort = process.env.LIVE_RELOAD_PORT or 35729

gulp.task 'start', ->
  nodemon(
    script: app
    ext: 'coffee'
    env: process.env
    nodeArgs: ['--nodejs', "--debug=#{debugPort}"]
    ignore: [
      'node_modules/',
      'public/'
    ]
  ).on('restart', (files) ->
    log.info 'app restarted'
  ).on('quit', ->
    log.info 'app closed'
    gutil.beep()
  )
