class Ball extends Element
	constructor: (id, @pong) ->
		super id
		@parameter = {
			velocity: {
				x: 0.01
				y: 0.02
			}
			direction: {
				x: 0
				y: 0
			}
		}

	setService: (player) ->
		if player instanceof Player
			@position.top = player.position.top + player.position.height / 2 - @position.height / 2
			if player.position.left < @pong.position.left + @pong.position.width / 2
				@position.left = player.position.left + player.position.width
			else
				@position.left = player.position.left - @position.width
			@refreshPosition()
			$(document).bind "keydown", (touch) =>
				if touch.key == ' '
					@service()

	service: ->
		if @position.left < @pong.position.width / 2
			@parameter.direction.x = 1
		else
			@parameter.direction.x = -1
