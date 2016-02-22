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

		bad_guy = new Bot canvas.$pong, "bad_guy", conf["player"], 4
		bad_guy.draw()
		bad_guy.setBall ball

		middle_text = new Text canvas.$pong, "win", conf["text"]

		game_loop = setInterval =>
			ball.move()
			ball.hitBorder (border) =>
				switch border
					when "TOP", "BOTTOM" then ball.direction.y *= -1
					when "LEFT", "RIGHT" then stopGame border, game_loop, middle_text
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

stopGame = (border, game_loop, text) =>
	clearInterval game_loop
	switch border
		when "LEFT" then lose text
		when "RIGHT" then win text

win = (text) =>
	text.write text.conf["win_text"], { x: 75, y: 75 / 2 }

lose = (text) =>
	text.write text.conf["lose_text"], { x: 75, y: 75 / 2 }
