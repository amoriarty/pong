jQuery ->
	# TODO CREATION DES BALISE PLAYER SELON LES BESOIN (AFIN DE NE PAS AVOIR DES BALISES NON AFFICHER)
	# TODO MENU
	# TODO AFFICHAGE DU CHRONO
	# TODO MODE MULTI ?
	# TODO CHOIX DU CONTROLE CLAVIER ?
	# TODO ONCLICK BALISE BON POUR EVITER LES RECUPERATIONS CLAVIERS DE LEUR PAGE DE BASE (CE SERAI CON)
	# TODO REDUISSEMENT DU JOUEUR
	# TODO THERE'S SOME PRETTY FUCKING GLITCH IN THIS THING !
	# TODO DEPLACEMENT SANS ALLER RETOUR DU BOT
	# EFFACEMENT DES PLAYER 2 ET 3
	$("#player_2").css "display", "none"
	$("#player_3").css "display", "none"

	game = new Game

	game.setPlayer "player_1", 1, "LEFT"
	game.setBot "player_4", 4
	game.setBall()

