express = require "express"

module.exports =
	class Server
		constructor: (index) ->
			@app = express()
			@app.get "/", (req, res) ->
				res.sendFile index

		addStatic: (directory) ->
			@app.use "/#{directory}", express.static directory

		listen: (port, ready) ->
			@app.listen "4242", ->
				console.log ready
