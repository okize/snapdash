# tests if database connection is working

path = require 'path'
gulp = require 'gulp'
pg = require 'pg'

config = require '../config'
log = require '../helpers/log'

exec = require("child_process").exec

gulp.task 'dbtest', (done) ->
  log.info 'Checking database connection'
  pg.connect process.env.DATABASE_URL, (error, client, close) ->
    if error
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
