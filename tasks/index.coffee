fs = require 'fs'
path = require 'path'
gulp = require 'gulp'

tasks = fs.readdirSync path.join(__dirname, 'plugins')

for task in tasks
  parts = task.split '.'
  extension = parts[parts.length - 1]
  if extension is 'js' or extension is 'coffee'
    require "./plugins/#{task}"