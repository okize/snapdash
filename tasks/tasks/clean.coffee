# deletes public folder

gulp = require 'gulp'
clean = require 'del'
paths = require '../paths'

gulp.task 'clean', ->
  clean [paths.dist.css, paths.dist.js]