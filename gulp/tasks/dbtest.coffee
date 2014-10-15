# tests if database connection is working

path = require 'path'
gulp = require 'gulp'
gutil = require 'gulp-util'
pg = require 'pg'

config = require '../config'
log = require '../helpers/log'

conn = process.env.DATABASE_URL

gulp.task 'dbtest', (done) ->
  log.info 'Checking database connection'
  if !conn
    log.error 'DATABASE_URL env var has not been set'
  else
    pg.connect conn, (error, client, close) ->
      if error
        gutil.beep()
        if error.code is 'ECONNREFUSED'
          log.error 'Unable to connect to the database'
        else
          log.error error
      else
        client.query "SELECT $1::int AS number", ["1"], (error, result) ->
          if error
            log.error error
          else
            log.info 'Successfully connected to the database'
          close()
      pg.end()
