#TODO SPEED LIMIT BALL
#TODO MENU
#TODO RESTART
#TODO CHRONOMETRE
#TODO START WITH SPACE

jQuery ->
	$.getJSON "/conf", (conf) ->
		game = new Game "pong", conf
		game.setPlayer "hero", 1, "LEFT"
		game.setBot "bad_guy", 4
		game.startGame()
