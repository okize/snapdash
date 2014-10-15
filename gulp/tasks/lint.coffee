# lints css & coffeescript

path = require 'path'
gulp = require 'gulp'
run = require 'run-sequence'
coffeelint = require 'gulp-coffeelint'
jsonlint = require 'gulp-jsonlint'
csslint = require 'gulp-csslint'

config = require '../config'
log = require '../helpers/log'

gulp.task 'lint', [
  'lint-coffeescript'
  'lint-json'
  'lint-css'
]

gulp.task 'lint-coffeescript', () ->
  gulp
    .src(['./**/*.coffee', '!./node_modules/**'])
    .pipe coffeelint()
    .pipe coffeelint.reporter()
    .on 'error', (e) -> log.error e

gulp.task 'lint-json', () ->
  gulp
    .src(['./**/*.json', '!./node_modules/**'])
    .pipe jsonlint()
    .pipe jsonlint.reporter()
    .on 'error', (e) -> log.error e

gulp.task 'lint-css', () ->
  gulp
    .src path.join(config.dist.cssDir, config.dist.cssName)
    .pipe csslint()
    .pipe csslint.reporter()
    .on 'error', (e) -> log.error e
