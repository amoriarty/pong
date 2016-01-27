class Player
	constructor: (id) ->
		@$player = $("##{id}")
		@position = @$player.position()
		@limit = {
			top: @position.top
			bottom: @position.top + $("#map").height() - (@$player.height() - 5)
		}

	configureKeyboard: (panel) ->
		switch panel
			when "LEFT"
				$(document).keypress (touch) =>
					switch touch.key
						when "w", "z" then @move("UP")
						when "s" then @move("DOWN")
			when "RIGHT"
				$(document).keypress (touch) =>
					switch touch.key
						when "ArrowUp" then @move("UP")
						when "ArrowDown" then @move("DOWN")


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
