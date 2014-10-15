# applies basic authorization; checks against REMOTE_USER && REMOTE_PASSWORD

basicAuth = require 'basic-auth'

module.exports = (req, res, next) ->
  unauthorized = (res) ->
    res.set 'WWW-Authenticate', 'Basic realm=Authorization Required'
    res.status(401).end()
  user = basicAuth(req)
  if not user or not user.name or not user.pass
    return unauthorized(res)
  if user.name == process.env.REMOTE_USER && user.pass == process.env.REMOTE_PASS
    next()
  else
    unauthorized(res)