# configuration file for Gulp tasks

path = require 'path'
root = path.resolve(__dirname, '..')

module.exports =
  root: root
  taskDir: "#{root}/gulp/tasks"
  main: "#{root}/app.coffee"

  # DO NOT restart node app when files change in these directories
  appIgnoreDirs: [
    'node_modules/',
    'gulp',
    'assets',
    'public/'
  ]

  # asset sources
  src:
    sassDir: "#{root}/assets/sass/"
    coffeeEntry: "app.coffee"
    coffeeDir: "#{root}/assets/coffee/"

  # asset compilation targets
  dist:
    cssName: 'styles.css'
    cssDir: "#{root}/public/stylesheets"
    jsName: 'scripts.js'
    jsDir: "#{root}/public/javascripts"
