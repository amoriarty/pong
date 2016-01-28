class Player
	constructor: (id) ->
		@$player = $("##{id}")
		@position = @$player.position()
		@limit = {
			top: @position.top
			bottom: @position.top + $("#map").height() - (@$player.height() - 5)
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
				if @position.top - 5 >= @limit.top
					@position.top -= 5
					@$player.css "top", @position.top
			when "DOWN"
				if @position.top + 5 <= @limit.bottom
					@position.top += 5
					@$player.css "top", @position.top

jQuery ->
	one = new Player "player-1"
	one.configureKeyboard "LEFT"

	two = new Player "player-4"
	two.configureKeyboard "RIGHT"
