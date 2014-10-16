# modules
fs = require 'fs'
path = require 'path'
moment = require 'moment'

getFilename = (type) ->
  path.join(__dirname, '..', 'data', "#{type}_#{moment().format('YYYY-MM-DDTHH-MM-SS')}.json")

jsonIfy = (data) ->
  JSON.stringify(data, null, 2)

# save results to disk as json
module.exports = (type, results, cb) ->

  filename = getFilename(type)
  fs.writeFile filename, jsonIfy(results), (error) ->
    if error
      cb error, null
    else
      cb null, "#{filename} saved successfully"
