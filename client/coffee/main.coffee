jQuery ->
	$.getJSON "/conf", (conf) ->
		canvas = new Canvas "pong"
		canvas.setBackgroundColor conf["background-color"]
		canvas.drawSeparation conf["separation"]

		hero = new Player canvas.$pong, "hero", conf["player"], 1
		hero.draw()
		hero.setKeyboard "LEFT"

		bay_guy = new Player canvas.$pong, "bay_guy", conf["player"], 4
		bay_guy.draw()
		bay_guy.setKeyboard "RIGHT"

		ball = new Ball canvas.$pong, "Ball", conf["ball"]
		ball.draw()

		setInterval =>
			ball.move()
			ball.hitBorder (border) =>
				switch border
					when "TOP", "BOTTOM" then ball.direction.y *= -1
					when "LEFT", "RIGHT" then ball.direction.x *= -1
		, 0
