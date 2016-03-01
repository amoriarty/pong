#TODO MENU (SI POSSIBLE SANS SOURIS)
#TODO MAKEFILE
#TODO ONE REQUEST JS
#TODO SON ON/OFF
#TODO I THINK THE REQUEST ANIMATION WILL BE INDISPENSABLE (LOOK AT TMP/PONG.JS)
#TODO IA DOUBLE
jQuery ->
	$.getJSON "/conf", (conf) ->
		game = new Game "pong", conf, true
		game.setPlayer "hero", 1, "LEFT", "ball00"
		game.setPlayer "robin", 2, "RIGHT", "ball01"
		game.setBot "walugie", 3, "ball00"
		game.setBot "bad_guy", 4, "ball01"
		game.newGame()
		$(document).keydown (t) =>
			if t.keyCode is conf["keyboard"]["space"]
				if game.game_status is not true then game.startGame()
				else game.newGame()
