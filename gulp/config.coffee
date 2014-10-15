# configuration file for Gulp tasks

path = require 'path'
root = path.resolve(__dirname, '..')
assets = path.resolve(root, 'public')

module.exports =
  root: root
  taskDir: "#{root}/gulp/tasks"
  main: "#{root}/app.coffee"
  publicAssetsDir: assets

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
    cssDir: "#{assets}/stylesheets"
    jsName: 'scripts.js'
    jsDir: "#{assets}/javascripts"
