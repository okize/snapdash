# copies favicon from assets to public

path = require 'path'
gulp = require 'gulp'

log = require '../helpers/log'
config = require '../config'

gulp.task 'images', ->
  log.info 'Copying images to public folder'

  gulp
    .src "#{config.src.favicons}/**/*"
    .pipe gulp.dest "#{config.publicAssetsDir}/favicons"
