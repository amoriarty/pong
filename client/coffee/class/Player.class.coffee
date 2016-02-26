class Player extends Element
	constructor: (canvas, name, conf, @place, sound) ->
		super canvas, name, conf
		@sound = $("##{sound}")
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
		@loop_interval = requestAnimationFrame @loop


	move: (direction, speed) ->
		layer = @canvas.getLayer @name
		switch direction
			when "UP"
				if layer.y - layer.height / 2 - speed >= 0
					@canvas.animateLayer @name, { y: "-=#{speed}" }, 0
			when "DOWN"
				if layer.y + layer.height / 2 + speed <= 150
					@canvas.animateLayer @name, { y: "+=#{speed}" }, 0

	loop: =>
		if @direction.up then @move "UP", @conf["speed"]
		if @direction.down then @move "DOWN", @conf["speed"]
		requestAnimationFrame @loop

	clearLoop: ->
		window.cancelAnimationFrame @loop_interval

	reduce: ->
		layer = @canvas.getLayer @name
		if layer.height - @conf["height_speed"] >= @conf["height_min"]
			@canvas.animateLayer @name, {
				height: "-=#{@conf["height_speed"]}"
			}, 0
