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
			height: @conf["height"]
			width: @conf["width"]
			}

	setKeyboard: (panel) ->
		@loop()
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
					@canvas.animateLayer @name, { y: "-=#{speed}" }, 0
			when "DOWN"
				if layer.y + layer.height / 2 + speed <= 150
					@canvas.animateLayer @name, { y: "+=#{speed}" }, 0

	loop: ->
		@loop_interval = setInterval =>
			if @direction.up then @move "UP", @conf["speed"]
			if @direction.down then @move "DOWN", @conf["speed"]
		, 0

	clearLoop: ->
		clearInterval @loop_interval
