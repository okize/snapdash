# compile sass into css

gulp = require 'gulp'
sass = require 'gulp-sass'

paths = require '../paths'
log = require '../helpers/log.coffee'

gulp.task 'sass', ->
  log.info 'Compiling sass into css'
  gulp
    .src(paths.src.sass)
    .pipe sass(
      errLogToConsole: true
      sourceComments: 'map'
    )
    .pipe(gulp.dest(paths.dist.css))
    .on('error', log.error)