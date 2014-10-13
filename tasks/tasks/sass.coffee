# compile sass files

gulp = require 'gulp'
sass = require 'gulp-sass'
paths = require '../paths'

gulp.task 'sass', ->
  gulp
    .src(paths.src.sass)
    .pipe sass(
      errLogToConsole: true
      sourceComments: 'map'
    )
    .pipe gulp.dest(paths.dist.css)