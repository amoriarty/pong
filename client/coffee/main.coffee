#TODO MENU
#TODO CHRONOMETRE

jQuery ->
	$.getJSON "/conf", (conf) ->
		game = new Game "pong", conf
		game.setPlayer "hero", 1, "LEFT"
		game.setBot "bad_guy", 4
		game.newGame()
		$(document).keydown (t) =>
			if t.keyCode is conf["keyboard"]["space"] and game.game_status is not true then game.startGame()
