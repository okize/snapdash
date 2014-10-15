# modules
path = require 'path'
express = require 'express'
assets = require 'express-asset-versions'
compression = require 'compression'
logger = require 'morgan'
basicAuthentication = require './lib/authentication'

# create application instance
app = express()

# configuration
app.set 'env', process.env.NODE_ENV or 'development'
app.set 'port', process.env.EXPRESS_PORT or 8000
app.set 'app name', 'Snapdash'
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

# gzip assets
app.use compression(threshold: 1024)

# static assets
assetPath = path.join(__dirname, 'public')
app.use express.static(assetPath, maxAge: 86400000)
app.use assets('', assetPath)

# authenticate when in production and if auth env vars have been set
if process.env.NODE_ENV is 'production' and process.env.REMOTE_USER? and process.env.REMOTE_PASS?
  app.all '*', basicAuthentication

# index
app.get '/', (req, res) ->
  res.render 'index.jade'

# logger
app.use logger 'dev'

# await connections
app.listen app.get('port'), ->
  console.log "#{app.get('app name')} running on port #{app.get('port')} " +
              "in [#{app.get('env')}]"
