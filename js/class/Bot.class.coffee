class Bot extends Player
	setBall: (@ball) ->
		@loop()

	loop: ->
		if @ball
			setInterval =>
				if @ball.position.top + @ball.position.height / 2 > @position.top + @position.height / 2
					@move "DOWN", 5
				else
					@move "UP", 5
			, 1
