# modules
path = require 'path'
express = require 'express'
middlewares = require './middlewares'
basicAuthentication = require './lib/authentication'

# create application instance
app = express()

# configuration
app.set 'env', process.env.NODE_ENV or 'development'
app.set 'port', process.env.PORT or 2222
app.set 'app name', 'Snapdash'
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

middlewares.before app

# authenticate when in production and if auth env vars have been set
if process.env.NODE_ENV is 'production' and process.env.REMOTE_USER? and process.env.REMOTE_PASS?
  app.all '*', basicAuthentication

# index
app.get '/', (req, res) ->
  res.render 'index.jade'

middlewares.after app

# await connections
app.listen app.get('port'), ->
  console.log "#{app.get('app name')} running on port #{app.get('port')} " +
              "in [#{app.get('env')}]"
