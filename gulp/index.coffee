# modules
fs = require 'fs'
dotenv = require('dotenv').load()

config = require './config'
isScript = require './helpers/isScript.coffee'

# load all the gulp task modules
tasks = fs.readdirSync(config.taskDir).filter(isScript)
tasks.forEach (task) ->
  require "#{config.taskDir}/#{task}"
