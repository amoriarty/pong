class Player extends Element
	# TODO COMMENTAIRE !!!!
	constructor: (id, @pong, @place) ->
		super id
		@setPlayer @place
		@loop()
		@direction = {
			up: false
			down: false
		}

	setPlayer: (place) ->
		@position.top += @pong.position.height / 2 - @position.height / 2
		switch place
			when 1 then @position.left += 1.38 * @pong.position.width / 100
			when 2 then @position.left += 23.95 * @pong.position.width / 100
			when 3 then @position.left += 73.88 * @pong.position.width / 100
			when 4 then @position.left += 97.22 * @pong.position.width / 100
		@$element.css @position

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

	loop: ->
		setInterval =>
			if (@direction.up) then @move "UP", 1
			if (@direction.down) then @move "DOWN", 1
		, 1

	move: (direction, speed) ->
		switch direction
			when "UP"
				if @position.top - speed > @pong.limit.top
					@position.top -= speed
					@$element.css @position
			when "DOWN"
				if @position.top + 1 < @pong.limit.bottom - @position.height
					@position.top += 1
					@$element.css @position
