class Player
	constructor: (id) ->
		@$player = $("##{id}")
		@position = @$player.position()
		@limit = {
			top: @position.top
			bottom: @position.top + $("#map").height() - (@$player.height() - 5)
		}

	configureKeyboard: ->
		$(document).keypress (touch) =>
			switch touch.key
				when "ArrowUp"
					if @position.top - 5 >= @limit.top
						@position.top -= 5
						@$player.css "top", @position.top
				when "ArrowDown"
					if @position.top + 5 <= @limit.bottom
						@position.top += 5
						@$player.css "top", @position.top

jQuery ->
	player = new Player "player"
	player.configureKeyboard()
