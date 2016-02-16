Config = require "./configuration.json"
Server = require "./class/Server.class"

# Server Configuration
app = new Server "#{Config.path}/html/pong.html"
app.addStatic "js"
app.addStatic "css"

# Add Bot Battle
app.app.get "/botBattle", (req, res) ->
	res.sendFile "#{Config.path}/html/botBattle.html"
app.listen Config.port, "Server ready !"
