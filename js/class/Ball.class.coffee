class Ball extends Element
	constructor: (id, @pong) ->
		super id
		@velocity = {
			x: 0.5
			y: 0.5
		}
		@direction = {
			x: 0
			y: 0
		}

	setService: (player) ->
		if player instanceof Player
			@position.top = player.position.top + player.position.height / 2 - @position.height / 2
			switch player.place
				when 1, 2 then @position.left = player.position.left + player.position.width
				when 3, 4 then @position.left = player.position.left - @position.width
			@refreshPosition()
