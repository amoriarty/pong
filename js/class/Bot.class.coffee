class Bot extends Player
	# PERMET DE CONFIGURER LA REFERENCE A LA BALLE, PERMETTANT DE CONNAITRE SA POSITION
	setBall: (@ball) ->
		@loop()

	# REDEFINITION DE LA METHODE LOOP HERITER DE PLAYER
	loop: ->
		if @ball
			setInterval =>
				if @ball.position.top + @ball.position.height / 2 > @position.top + @position.height / 2
					@move "DOWN", 5
				else
					@move "UP", 5
			, 1
