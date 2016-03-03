#TODO MAKEFILE
#TODO ONE REQUEST JS
#TODO README
#TODO HISTOIRE DE GAGNER LOSE AND TWO PLAYER
#TODO CONF BOT MARGE !
jQuery ->
	$.getJSON "/conf", (conf) ->
		game = new Game "pong", conf
		$("#menu").submit (e) =>
			e.preventDefault()
			$("#menu").fadeOut 200
			game.setSound $("#sound option:selected").val()

			if $("#mode option:selected").val() is "simple"
				game.setDouble false
				if $("#players option:selected").val() is "two"
					game.setPlayer "player_one", 1, "LEFT", "ball00"
					game.setPlayer "player_four", 4, "RIGHT", "ball01"
				else
					game.setPlayer "player_one", 1, "LEFT", "ball00"
					game.setBot "bot_four", 4, "ball01"
			else
				game.setDouble true
				game.setBot "bot_three", 3, "ball01"
				game.setBot "bot_four", 4, "ball01"
				if $("#players option:selected").val() is "two"
					game.setPlayer "player_one", 1, "LEFT", "ball00"
					game.setPlayer "player_two", 2, "RIGHT", "ball00"
				else
					game.setPlayer "player_two", 2, "LEFT", "ball00"
					game.setBot "bot_one", 1, "ball00"

			game.newGame()
			$(document).keydown (t) =>
				if t.keyCode is conf["keyboard"]["space"]
					game.startGame()
