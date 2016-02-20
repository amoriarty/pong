class Ball extends Element
	constructor: (canvas, name, conf) ->
		super canvas, name, conf
		@speed = @conf["speed"]
		@velocity = @conf["velocity"]
		@direction = {
			x: if Math.random() < 0.5 then -1 else 1
			y: if Math.random() < 0.5 then -(Math.random()) else Math.random()
		}

	draw: ->
		@canvas.drawArc {
			layer: true
			name: @name
			fillStyle: @conf["color"]
			strokeWidth: @conf["width"]
			radius: @conf["radius"]
			x: 150, y: 75
		}

	getCoor: ->
		layer = @canvas.getLayer @name
		{
			x: if @direction.x < 0 then layer.x - layer.radius else layer.x + layer.radius
			y: if @direction.y < 0 then layer.y - layer.radius else layer.y + layer.radius
		}

	hit: (coor) ->
		layer = @canvas.getLayer @name
		if (coor.x - layer.x) * (coor.x - layer.x) + (coor.y - layer.y) - (coor.y - layer.y) > layer.radius * layer.radius then return false
		else return true

	hitBorder: (callback) ->
		layer = @canvas.getLayer @name
		if layer.x - layer.radius <= 0 then callback "LEFT"
		else if layer.x + layer.radius >= 300 then callback "RIGHT"
		else if layer.y - layer.radius <= 0 then callback "TOP"
		else if layer.y + layer.radius >= 150 then callback "BOTTOM"

	move: ->
		@canvas.animateLayer @name, {
			x: "+=#{@direction.x * @speed.x}"
			y: "+=#{@direction.y * @speed.y}"
		}, 0