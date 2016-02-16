jQuery ->
	# EFFACEMENT DES PLAYER 2 ET 3
	$("#player_2").css "display", "none"
	$("#player_3").css "display", "none"

	# GAME
	game = new Game
	game.setBot "player_1", 1
	game.setBot "player_4", 4
	game.setBall()
	game.initGame()
