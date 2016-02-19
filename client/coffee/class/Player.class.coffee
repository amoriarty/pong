class Player extends Element
	constructor: (canvas, name, conf, @place) ->
		super canvas, name, conf
		@direction = {
			up: false
			down: false
		}

	draw: ->
		@canvas.drawRect {
			layer: true
			name: @name
			groups: ['player']
			fillStyle: @conf["color"]
			x: @conf["place"][@place]["x"]
			y: @conf["place"][@place]["y"]
			height: @position.height
			width: @position.width
			}

	setKeyboard: (panel) ->
		switch panel
			when "LEFT"
				$(document).keydown (touch) =>
					switch touch.keyCode
						when 87, 90 then @direction.up = true
						when 83 then @direction.down = true
				$(document).keyup (touch) =>
					switch touch.keyCode
						when 87, 90 then @direction.up = false
						when 83 then @direction.down = false
			when "RIGHT"
				$(document).keydown (touch) =>
					switch touch.keyCode
						when 38 then @direction.up = true
						when 40 then @direction.down = true
				$(document).keyup (touch) =>
					switch touch.keyCode
						when 38 then @direction.up = false
						when 40 then @direction.down = false


	move: (direction, speed) ->
		layer = @canvas.getLayer @name
		switch direction
			when "UP"
				if layer.y - layer.height / 2 - speed >= 0
					@canvas.setLayer @name, {
						y: "-= #{speed}"
					}
			when "DOWN"
				if layer.y + layer.height / 2 + speed <= 150
					@canvas.setLayer @name, {
						y: "+= #{speed}"
					}
