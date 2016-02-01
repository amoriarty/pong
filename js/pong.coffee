jQuery ->
# DEBUG
# EFFECEMENT PLAYER 2 ET 3 + BALLE TEMPS
	$("#player-2").css "display", "none"
	$("#player-3").css "display", "none"
	$("#player-4").css "display", "none"
	$("#ball").css "display", "none"

	# RECUPERATION DU DOM DU JEUX
	pong = new Element "pong"

	# CALCUL DES LIMITES DU TERRAIN
	pong.limit = {
		top: pong.position.top
		bottom: pong.position.top + pong.position.height - $(".player").height() + Math.round parseFloat pong.$element.css "border-bottom-width"
	}

	# INITIALISATION PLAYER 1
	one = new Player "player-1", pong
	one.configureKeyboard "LEFT"
	one.setPlayer 1

###
# INITIALISATION PLAYER 2
two = new Player "player-4", pong.limit
two.configureKeyboard "RIGHT"

# INITIALISATION DE LA BALLE
ball = new Ball "ball"
ball.setService(one)
###
