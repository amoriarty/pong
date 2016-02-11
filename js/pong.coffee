jQuery ->
	# TODO CREATION DES BALISE PLAYER SELON LES BESOIN (AFIN DE NE PAS AVOIR DES BALISES NON AFFICHER)
	# EFFACEMENT DES PLAYER 2 ET 3
	$("#player_2").css "display", "none"
	$("#player_3").css "display", "none"

	game = new Game

	game.setPlayer "player_1", 1, "LEFT"
	game.setPlayer "player_4", 4, "RIGHT"
	game.setBall()

	###
	# INITIALISATION PLAYER 1
	player_1 = new Player "player_1", game.pong, 1
	player_1.configureKeyboard "LEFT"

	# INITIALISATION PLAYER 2
	player_2 = new Player "player_4", game.pong, 4
	player_2.configureKeyboard "RIGHT"

	# INITIALISATION DE LA BALLE
	ball = new Ball "ball", game.pong
	###

