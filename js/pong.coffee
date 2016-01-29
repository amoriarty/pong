jQuery ->
	# DEBUG
	# EFFECEMENT PLAYER 2 ET 3 + BALLE TEMPS
	# $("#player-2").css "display", "none"
	# $("#player-3").css "display", "none"
	$("#ball").css "display", "none"

	# RECUPERATION DU DOM DU JEUX
	$pong = $("#pong")
	position = $pong.position()

	# CALCUL DES LIMITES DU TERRAIN
	limit = {
		top: position.top
		bottom: position.top + $pong.height() - $(".player").height() + Math.round parseFloat $pong.css "border-bottom-width"
	}

	# INITIALISATION PLAYER 1
	one = new Player "player-1", limit
	one.configureKeyboard "LEFT"

	# INITIALISATION PLAYER 2
	two = new Player "player-4", limit
	two.configureKeyboard "RIGHT"

	###
	# INITIALISATION DE LA BALLE
	ball = new Ball "ball"
	ball.setService(one)
	###
