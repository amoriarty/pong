class Element
	constructor: (@canvas, @name, @conf) ->
	hit: (coor) ->
		layer = @canvas.getLayer @name
		if coor.x > layer.x - layer.width / 2 \
			and coor.x < layer.x + layer.width / 2 \
			and coor.y > layer.y - layer.height / 2 \
			and coor.y < layer.y + layer.height / 2 \
			then return true
		return false

	getCoor: ->
		layer = @canvas.getLayer @name
		{
			x: layer.x - layer.width / 2
			y: layer.y - layer.height / 2
			height: layer.height
			width: layer.width
		}

	remove: ->
		@canvas.removeLayer @name
