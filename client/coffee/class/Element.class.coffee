class Element
	constructor: (@canvas, @name, @conf) ->
	hit: (x, y, callback) ->
		layer = @canvas.getLayer @name
		if x > layer.x - layer.width / 2 \
			and x < layer.x + layer.width / 2 \
			and y > layer.y - layer.height / 2 \
			and y < layer.y + layer.height / 2 \
			then callback()
