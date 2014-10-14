# configuration file for Gulp tasks

path = require 'path'
root = path.resolve(__dirname, '..')

module.exports =
  root: root
  main: "#{root}/app.coffee"
  src:
    sass: "#{root}/assets/sass/**/*.sass"
    coffee: "#{root}/assets/coffee/app.coffee"
  dist:
    cssName: 'styles.css'
    cssDir: "#{root}/public/stylesheets"
    jsName: 'scripts.js'
    jsDir: "#{root}/public/javascripts"
