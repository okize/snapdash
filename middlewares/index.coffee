path = require 'path'
express = require 'express'
assets = require 'express-asset-versions'
compression = require 'compression'
favicon = require 'serve-favicon'
logger = require '../lib//logger'

exports.before = (app) ->

  # gzip assets
  app.use compression(threshold: 1024)

  # static assets
  assetPath = path.join(__dirname, '..', 'public')
  app.use express.static(assetPath, maxAge: 86400000)
  app.use favicon path.join(assetPath, 'favicons', 'favicon.ico')
  app.use assets('', assetPath)

  # http logger
  app.use logger.http

exports.after = (app, db) ->

  # error logger
  app.use logger.error
