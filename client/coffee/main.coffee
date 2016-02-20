#TODO CALLBACK FIN DE JEU
#TODO MENU

jQuery ->
	$.getJSON "/conf", (conf) ->
		canvas = new Canvas "pong"
		canvas.setBackgroundColor conf["background-color"]
		canvas.drawSeparation conf["separation"]

		ball = new Ball canvas.$pong, "Ball", conf["ball"]
		ball.draw()

		hero = new Player canvas.$pong, "hero", conf["player"], 1
		hero.draw()
		hero.setKeyboard "LEFT"

		bad_guy = new Player canvas.$pong, "bad_guy", conf["player"], 4
		bad_guy.draw()
		bad_guy.setKeyboard "RIGHT"


		setInterval =>
			ball.move()
			ball.hitBorder (border) =>
				switch border
					when "TOP", "BOTTOM" then ball.direction.y *= -1
					when "LEFT", "RIGHT" then ball.direction.x *= -1
			hitPlayer [hero, bad_guy], ball, =>
				ball.direction.x *= -1
		, 0

hitPlayer = (players, ball, callback) =>
	for player in players
		coor = player.getCoor()
		if player.hit ball.getCoor() \
		or ball.hit coor \
		or ball.hit {x: coor.x + coor.width, y: coor.y} \
		or ball.hit {x: coor.x, y: coor.y + coor.height} \
		or ball.hit {x: coor.x + coor.width, y: coor.y + coor.height} \
		then callback()
