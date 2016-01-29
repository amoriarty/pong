jQuery ->
	# EFFECEMENT PLAYER 2 ET 3
	$("#player-2").css "display", "none"
	$("#player-3").css "display", "none"

	# INITIALISATION PLAYER 1
	one = new Player "player-1"
	one.configureKeyboard "LEFT"

	# INITIALISATION PLAYER 2
	two = new Player "player-4"
	two.configureKeyboard "RIGHT"

	#ELEMENT
	map = new Element "pong"
