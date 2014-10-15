# modules
path = require 'path'
express = require 'express'
assets = require 'express-asset-versions'
compression = require 'compression'
logger = require 'morgan'

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

# init router
router = express.Router()

# Initial dummy route for testing
router.get '/', (req, res) ->
  res.render 'index.jade'

# register routes
app.use router

# logger
app.use logger 'dev'

# await connections
app.listen app.get('port'), ->
  console.log "#{app.get('app name')} running on port #{app.get('port')} " +
              "in [#{app.get('env')}]"
