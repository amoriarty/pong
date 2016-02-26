#TODO MENU (SI POSSIBLE SANS SOURIS)
#TODO MAKEFILE
#TODO ONE REQUEST JS
jQuery ->
	$.getJSON "/conf", (conf) ->
		game = new Game "pong", conf
		game.setPlayer "hero", 1, "LEFT", "ball00"
		game.setBot "bad_guy", 4, "ball01"
		game.newGame()
		$(document).keydown (t) =>
			if t.keyCode is conf["keyboard"]["space"]
				if game.game_status is not true then game.startGame()
				else game.newGame()

