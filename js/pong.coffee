jQuery ->
	$("#player-2").css "display", "none"
	$("#player-3").css "display", "none"
	one = new Player "player-1"
	one.configureKeyboard "LEFT"

	two = new Player "player-4"
	two.configureKeyboard "RIGHT"
