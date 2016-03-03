class Game
	constructor: (id, @conf) ->
		@canvas = new Canvas id
		@canvas.setBackgroundColor @conf["background-color"]
		@canvas.drawSeparation @conf["separation"]
		@game_status = false
		@players = []
		@chrono = new Chrono "chrono"
		@lose_text = new Text "lose"
		@final_msg = $(".final_msg")
		@ball = new Ball @canvas.$pong, "Ball", @conf["ball"]
		@ball.draw()

	setDouble: (@double) ->

	setSound: (@sound) ->

	newGame: ->
		@final_msg.css "display", "none"
		@game_status = false
		@chrono.start = false
		@chrono.stop = false
		@ball.init()
		@ball.moveToCenter()

	setPlayer: (name, place, key, sound) ->
		player = new Player @canvas.$pong, name, @conf["player"], place, sound, @double
		player.draw()
		player.setKeyboard key
		@players.push player

	setBot: (name, place, sound) ->
		if @ball
			bot = new Bot @canvas.$pong, name, @conf["player"], place, sound, @double
			bot.draw()
			bot.setBall @ball
			@players.push bot

	startGame: ->
		if @game_status is not true
			@in_game = true
			@game_status = true
			@chrono.startChrono()
			@game_loop = requestAnimationFrame @gameLoop
		else if @in_game is not true
			@newGame()


	gameLoop: =>
		@chrono.getDuration()
		@ball.move()
		@ball.hitBorder (border) =>
			switch border
				when "TOP", "BOTTOM" then @ball.direction.y *= -1
				when "LEFT", "RIGHT" then @stopGame border
		@hitPlayer @players, @ball, @ball.rebound
		if not @chrono.stop then @game_loop = requestAnimationFrame @gameLoop


	hitPlayer: (players, ball, callback) =>
		ball_coor = ball.getCoor()
		for player in players
			coor = player.getCoor()
			if ball_coor.x > coor.x - 50 and ball_coor.x < coor.x + 50
				if player.hit ball.getCoor() \
				or ball.hit coor \
				or ball.hit {x: coor.x + coor.width, y: coor.y} \
				or ball.hit {x: coor.x, y: coor.y + coor.height} \
				or ball.hit {x: coor.x + coor.width, y: coor.y + coor.height} \
					then callback player, @sound

	stopGame: (border) =>
		@chrono.stopChrono()
		@in_game = false
		switch border
			when "LEFT" then @lose @lose_text
			when "RIGHT" then @win @lose_text

	lose: (text) ->
		text.element.text @conf["text"]["lose_text"]
		@final_msg.css "display", "block"

	win: (text) ->
		text.element.text @conf["text"]["win_text"]
		@final_msg.css "display", "block"
