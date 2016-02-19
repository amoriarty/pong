class Element
	constructor: (@canvas, @name, @conf) ->
		@position = {
			height: @conf["height"]
			width: @conf["width"]
		}
