class Game
	constructor: (id, @conf) ->
		@canvas = new Canvas id
		@canvas.setBackgroundColor @conf["background-color"]
		@canvas.drawSeparation @conf["separation"]
		@players = []
		@lose_text = new Text @canvas.$pong, 'lose_text', @conf["text"]
		@newGame()

	newGame: ->
		@ball = new Ball @canvas.$pong, "Ball", @conf["ball"]
		@ball.draw()

	setPlayer: (name, place, key) ->
		player = new Player @canvas.$pong, name, @conf["player"], place
		player.draw()
		player.setKeyboard key
		@players.push player

	setBot: (name, place) ->
		if @ball
			bot = new Bot @canvas.$pong, name, @conf["player"], place
			bot.draw()
			bot.setBall @ball
			@players.push bot

	startGame: ->
		@game_loop = setInterval =>
			@ball.move()
			@ball.hitBorder (border) =>
				switch border
					when "TOP", "BOTTOM" then @ball.direction.y *= -1
					when "LEFT", "RIGHT" then @stopGame border, @game_loop, @lose_text
			@hitPlayer @players, @ball, =>
				@ball.direction.x *= -1
		, 0

	hitPlayer: (players, ball, callback) =>
		for player in players
			coor = player.getCoor()
			if player.hit ball.getCoor() \
			or ball.hit coor \
			or ball.hit {x: coor.x + coor.width, y: coor.y} \
			or ball.hit {x: coor.x, y: coor.y + coor.height} \
			or ball.hit {x: coor.x + coor.width, y: coor.y + coor.height} \
				then callback()

	stopGame: (border, game_loop, text) ->
		clearInterval game_loop
		switch border
			when "LEFT" then @lose text
			when "RIGHT" then @win text

	lose: (text) ->
		text.write text.conf["lose_text"], { x: 75, y: 75 / 2 }

	win: (text) ->
		text.write text.conf["win_text"], { x: 75, y: 75 / 2 }
