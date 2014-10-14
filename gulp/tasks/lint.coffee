# lints css & coffeescript

path = require 'path'
gulp = require 'gulp'
coffeelint = require 'gulp-coffeelint'
csslint = require 'gulp-csslint'

config = require '../config'
log = require '../helpers/log'

gulp.task 'lint', ->
  log.info 'Liniting css & js'

  # coffeescript
  gulp
    .src(['./*.coffee', '!./node_modules/**'])
    .pipe coffeelint()
    .pipe coffeelint.reporter()
    .on 'error', (e) -> log.error e

  # css
  gulp
    .src path.join(config.dist.cssDir, config.dist.cssName)
    .pipe csslint()
    .pipe csslint.reporter()
    .on 'error', (e) -> log.error e
