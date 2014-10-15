# this file boostraps all the gulp tasks

# load env vars here so they'll be available to all gulp tasks
dotenv = require('dotenv').load()

config = require './config'
log = require './helpers/log'
tasks = require('./helpers/getTaskList')()

# load all the gulp task modules
log.start 'bootstrapping Gulp tasks'
tasks.forEach (task) ->
  require "#{config.taskDir}/#{task}"
log.end 'bootsrap'