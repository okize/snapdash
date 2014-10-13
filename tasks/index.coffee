#modules
fs = require 'fs'
path = require 'path'
isScript = require path.join(__dirname, 'helpers', 'isScript.coffee')

# load all the gulp task modules
tasks = fs.readdirSync(path.join(__dirname, 'tasks')).filter(isScript)
tasks.forEach (task) ->
  require "./tasks/#{task}"
