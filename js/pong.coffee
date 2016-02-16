jQuery ->
	# TODO CREATION DES BALISE PLAYER SELON LES BESOIN (AFIN DE NE PAS AVOIR DES BALISES NON AFFICHER)
	# TODO MODE MULTI ?
	# TODO CHOIX DU CONTROLE CLAVIER ?
	# TODO THERE'S SOME PRETTY FUCKING GLITCH IN THIS THING !
	# TODO DEPLACEMENT SANS ALLER RETOUR DU BOT
	# TODO RESIZE WINDOW

	# EFFACEMENT DES PLAYER 2 ET 3
	$("#player_2").css "display", "none"
	$("#player_3").css "display", "none"

	# GAME
	game = new Game
	game.setPlayer "player_1", 1, "RIGHT"
	game.setBot "player_4", 4
	game.setBall()
	game.initGame()
