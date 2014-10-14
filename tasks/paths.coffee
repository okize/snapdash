path = require 'path'
root = path.resolve(__dirname, '..')

# asset paths

module.exports =
  root: root
  main: "#{root}/app.coffee"
  src:
    sass: "#{root}/assets/sass/**/*.sass"
    coffee: "#{root}/assets/coffee/app.coffee"
  dist:
    css: "#{root}/public/stylesheets"
    js: "#{root}/public/javascripts"