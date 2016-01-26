express = require "express"
app = express()

app.get "/", (req, res) ->
	res.sendFile __dirname + "/views/pong.html"

app.use "/img", express.static "img"
app.use "/css", express.static "css"
app.use "/client", express.static "client"

app.listen "4242", ->
	console.log "Listening"
