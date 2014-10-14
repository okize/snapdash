# deletes public asset directories

gulp = require 'gulp'
clean = require 'del'
paths = require '../paths'
log = require '../helpers/log.coffee'

gulp.task 'clean', ->
  log.info 'Deleting public assets'
  clean [paths.dist.css, paths.dist.js]