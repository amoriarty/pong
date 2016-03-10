jQuery ->
	$.getJSON "/conf.json", (conf) ->
		game = new Game "pong", conf
		game.setSound "off"
		$("#sound").click =>
			if $("#sound").attr("src").toString() is "/misc/off.png"
				$("#sound").attr "src", "/misc/on.png"
				game.setSound "on"
			else
				$("#sound").attr "src", "/misc/off.png"
				game.setSound "off"

		$("#simple_one").click =>
			game.setDouble false
			game.setPlayer "player_one", 1, "LEFT", "ball00"
			game.setBot "bot_four", 4, "ball01"
		$("#simple_two").click =>
			game.setDouble false
			game.setPlayer "player_one", 1, "LEFT", "ball00"
			game.setPlayer "player_four", 4, "RIGHT", "ball01"
		$("#double_one").click =>
			game.setDouble true
			game.setBot "bot_three", 3, "ball01"
			game.setBot "bot_four", 4, "ball01"
			game.setPlayer "player_two", 2, "LEFT", "ball00"
			game.setBot "bot_one", 1, "ball00"
		$("#double_two").click =>
			game.setDouble true
			game.setBot "bot_three", 3, "ball01"
			game.setBot "bot_four", 4, "ball01"
			game.setPlayer "player_one", 1, "LEFT", "ball00"
			game.setPlayer "player_two", 2, "RIGHT", "ball00"

		###
		if $("#mode option:selected").val() is "simple"
			game.setDouble false
			if $("#players option:selected").val() is "two"
				game.setTwoPlayers true
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
		###
		game.newGame()
		$(document).keydown (t) =>
			if t.keyCode is conf["keyboard"]["space"]
				game.startGame()
