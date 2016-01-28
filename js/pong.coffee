class Player
	constructor: (id) ->
		@$player = $("##{id}")
		@position = @$player.position()
		@limit = {
			top: @position.top
			bottom: @position.top + $("#map").height() - (@$player.height() - 5)
		}

	###
	configureKeyboard: (panel) ->
		touch = []
		switch panel
			when "LEFT"
				$(document).keydown (event) =>
					switch event.key
						when "w", "z"
							touch.push event.key
							@move "UP"
						when "s"
							touch.push event.key
							@move "DOWN"
			when "RIGHT"
				$(document).keydown (event) =>
					switch event.key
						when "ArrowUp"
							touch.push event.key
							@move "UP"
						when "ArrowDown"
							touch.push event.key
							@move "DOWN"

	###
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
					return true
			when "DOWN"
				if @position.top + 5 <= @limit.bottom
					@position.top += 5
					@$player.css "top", @position.top
					return true
		return false

jQuery ->
	one = new Player "player-1"
	one.configureKeyboard "LEFT"

	two = new Player "player-4"
	two.configureKeyboard "RIGHT"
