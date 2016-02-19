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

	hit: (x, y, callback) ->
		layer = @canvas.getLayer @name
		if (x - layer.x) * (x - layer.x) + (y - layer.y) * (y - layer.y) > layer.radius * layer.radius then false
		else callback()

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