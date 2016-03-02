#TODO MENU (SI POSSIBLE SANS SOURIS)
#TODO MAKEFILE
#TODO ONE REQUEST JS
#TODO SON ON/OFF
#TODO IA DOUBLE
jQuery ->
	$.getJSON "/conf", (conf) ->
		game = new Game "pong", conf
		game.setPlayer "player_one", 1, "LEFT", "ball00"
		$("#menu").submit (e) =>
			e.preventDefault()
			$("#menu").fadeOut 200
			if $("#mode option:selected").val() is "simple"
				game.setDouble false
				if $("#players option:selected").val() is "two" then game.setPlayer "player_four", 4, "RIGHT", "ball01"
				else game.setBot "bot_four", 4, "ball01"
			else
				game.setDouble true
				game.setBot "bot_three", 3, "ball01"
				game.setBot "bot_four", 4, "ball01"
				if $("#players option:selected").val() is "two" then game.setPlayer "player_two", 2, "RIGHT", "ball00"
				else game.setBot "bot_two", 2, "ball00"

			game.newGame()
			$(document).keydown (t) =>
				if t.keyCode is conf["keyboard"]["space"]
					if game.game_status is not true then game.startGame()
					else game.newGame()
