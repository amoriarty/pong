Config = require "./conf.json"
express = require "express"
app = express()

app.get "/", (req, res) ->
	res.sendFile "#{Config.path}/client/index.html"

app.get "/conf", (req, res) ->
	res.sendFile "#{Config.path}/client/conf.json"
app.get "/style", (req, res) ->
	res.sendFile "#{Config.path}/client/stylesheet.css"

app.use "/js", express.static "#{Config.path}/client/coffee"
app.use "/misc", express.static "#{Config.path}/client/misc"

app.listen Config.port, ->
	console.log "Server ready !"
