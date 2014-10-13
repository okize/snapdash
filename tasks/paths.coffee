path = require 'path'

# asset paths

module.exports =
  root: path.resolve '.'
  main: path.resolve 'app.coffee'
  src:
    sass: 'assets/sass/**/*.scss'
    coffee: 'assets/coffee/**/*.coffee'
    jade: 'views/**/*.jade'
  dist:
    css: 'public/stylesheets'
    js: 'public/javascripts'