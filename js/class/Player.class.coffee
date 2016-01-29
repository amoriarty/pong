class Player extends Element
	constructor: (id) ->
		super id
		@limit = {
			top: @position.x
			# TODO PRENDRE EN COMPTE LA BORDURE (EN DUR DANS LE CODE POUR L'INSTANT)
			bottom: @position.x + $("#pong").height() - (@$element.height() - 5)
		}
		@direction = {
			up: false
			down: false
		}
		@moveInt()

	configureKeyboard: (panel) ->
		switch panel
			when "LEFT"
				$(document).keydown (touch) =>
					switch touch.key
						when "w", "z" then @direction.up = true
						when "s" then @direction.down = true
				$(document).keyup (touch) =>
					switch touch.key
						when "w", "z" then @direction.up = false
						when "s" then @direction.down = false
			when "RIGHT"
				$(document).keydown (touch) =>
					switch touch.key
						when "ArrowUp" then @direction.up = true
						when "ArrowDown" then @direction.down = true
				$(document).keyup (touch) =>
					switch touch.key
						when "ArrowUp" then @direction.up = false
						when "ArrowDown" then @direction.down = false

	moveInt: ->
		setInterval =>
			if (@direction.up) then @move "UP"
			if (@direction.down) then @move "DOWN"
		, 10

	move: (direction) ->
		switch direction
			when "UP"
				if @position.x - 5 >= @limit.top
					@position.x -= 5
					@$element.css "top", @position.x
			when "DOWN"
				if @position.x + 5 <= @limit.bottom
					@position.x += 5
					@$element.css "top", @position.x