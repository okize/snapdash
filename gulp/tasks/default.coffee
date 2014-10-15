# starts application server and monitors files for changes

gulp = require 'gulp'

gulp.task 'default', [
  'dbtest'
  'start'
  'watch'
]