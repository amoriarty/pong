class Game
	constructor: (id, @conf) ->
		@canvas = new Canvas id
		@canvas.setBackgroundColor @conf["background-color"]
		@canvas.drawSeparation @conf["separation"]
		@game_status = false
		@players = []
		@chrono = new Chrono @canvas.$pong, "chrono", @conf["chrono"], { x: 225, y: 75 / 2 }
		@lose_text = new Text @canvas.$pong, 'lose_text', @conf["text"]
		@ball = new Ball @canvas.$pong, "Ball", @conf["ball"]
		@ball.draw()

	newGame: ->
		@game_status = false
		@chrono.start = false
		@chrono.stop = false
		@chrono.getDuration()
		@ball.init()
		@lose_text.remove()
		@ball.moveToCenter()

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
		if @game_status is not true
			@game_status = true
			@chrono.startChrono()
			@game_loop = setInterval @gameLoop, 0

	gameLoop: =>
		@chrono.getDuration()
		@ball.move()
		@ball.hitBorder (border) =>
			switch border
				when "TOP", "BOTTOM" then @ball.direction.y *= -1
				when "LEFT", "RIGHT" then @stopGame border, @game_loop, @lose_text
		@hitPlayer @players, @ball, (player) =>
				@ball.direction.x *= -1
				if @ball.speed.x < @conf["ball"]["speed_max"]["x"] then @ball.speed.x *= @conf["ball"]["speed_update"]
				player.reduce()

	hitPlayer: (players, ball, callback) =>
		for player in players
			coor = player.getCoor()
			if player.hit ball.getCoor() \
			or ball.hit coor \
			or ball.hit {x: coor.x + coor.width, y: coor.y} \
			or ball.hit {x: coor.x, y: coor.y + coor.height} \
			or ball.hit {x: coor.x + coor.width, y: coor.y + coor.height} \
				then callback player

	stopGame: (border, game_loop, text) ->
		@chrono.stopChrono()
		clearInterval game_loop
		switch border
			when "LEFT" then @lose text
			when "RIGHT" then @win text

	lose: (text) ->
		text.write text.conf["lose_text"], { x: 75, y: 75 / 2 }
		text.click =>
			@newGame()

	win: (text) ->
		text.write text.conf["win_text"], { x: 75, y: 75 / 2 }
