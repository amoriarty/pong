#TODO REAFFICHAGE DU MENU (ICON)
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
			$(".menu").fadeOut 200, =>
				game.newGame()
		$("#simple_two").click =>
			game.setDouble false
			game.setPlayer "player_one", 1, "LEFT", "ball00"
			game.setPlayer "player_four", 4, "RIGHT", "ball01"
			$(".menu").fadeOut 200, =>
				game.newGame()
		$("#double_one").click =>
			game.setDouble true
			game.setBot "bot_three", 3, "ball01"
			game.setBot "bot_four", 4, "ball01"
			game.setPlayer "player_two", 2, "LEFT", "ball00"
			game.setBot "bot_one", 1, "ball00"
			$(".menu").fadeOut 200, =>
				game.newGame()
		$("#double_two").click =>
			game.setDouble true
			game.setBot "bot_three", 3, "ball01"
			game.setBot "bot_four", 4, "ball01"
			game.setPlayer "player_one", 1, "LEFT", "ball00"
			game.setPlayer "player_two", 2, "RIGHT", "ball00"
			$(".menu").fadeOut 200, =>
				game.newGame()

		$("#menu-ico").click =>
			game.unsetEverything()
			$(".menu").fadeIn 200

		$(document).keydown (t) =>
			if t.keyCode is conf["keyboard"]["space"]
				game.startGame()
