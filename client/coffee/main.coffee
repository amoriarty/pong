#TODO CALLBACK FIN DE JEU
#TODO MENU

jQuery ->
	$.getJSON "/conf", (conf) ->
		game = new Game "pong", conf
		game.setPlayer "hero", 1, "LEFT"
		game.setBot "bad_guy", 4
		game.startGame()
