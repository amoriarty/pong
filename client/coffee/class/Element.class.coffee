class Element
	constructor: (@canvas, @name, @conf) ->
	hit: (coor, callback) ->
		layer = @canvas.getLayer @name
		if coor.x > layer.x - layer.width / 2 \
			and coor.x < layer.x + layer.width / 2 \
			and coor.y > layer.y - layer.height / 2 \
			and coor.y < layer.y + layer.height / 2 \
			then callback()
