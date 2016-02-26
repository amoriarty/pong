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

	newGame: ->
		@final_msg.css "display", "none"
		@game_status = false
		@chrono.start = false
		@chrono.stop = false
		@ball.init()
		@ball.moveToCenter()

	setPlayer: (name, place, key, sound) ->
		player = new Player @canvas.$pong, name, @conf["player"], place, sound
		player.draw()
		player.setKeyboard key
		@players.push player

	setBot: (name, place, sound) ->
		if @ball
			bot = new Bot @canvas.$pong, name, @conf["player"], place, sound
			bot.draw()
			bot.setBall @ball
			@players.push bot

	startGame: ->
		if @game_status is not true
			@game_status = true
			@chrono.startChrono()
			@game_loop = setInterval @gameLoop, 1000 / 60

	gameLoop: =>
		@chrono.getDuration()
		@ball.move()
		@ball.hitBorder (border) =>
			switch border
				when "TOP", "BOTTOM" then @ball.direction.y *= -1
				when "LEFT", "RIGHT" then @stopGame border
		@hitPlayer @players, @ball, (player) =>
				@ball.direction.x *= -1
				random = Math.random() - 0.5
				coor = @ball.getCoor()
				player_coor = player.getCoor()
				if @ball.direction.y > 0
					@ball.direction.y = if coor.y > player_coor.y then random * -1 else random
				else @ball.direction.y = if coor.y < player_coor.y then random * -1 else random
				if @ball.speed.x < @conf["ball"]["speed_max"]["x"] then @ball.speed.x *= @conf["ball"]["speed_update"]
				player.reduce()
				player.sound.trigger("play")

	hitPlayer: (players, ball, callback) =>
		for player in players
			coor = player.getCoor()
			if player.hit ball.getCoor() \
			or ball.hit coor \
			or ball.hit {x: coor.x + coor.width, y: coor.y} \
			or ball.hit {x: coor.x, y: coor.y + coor.height} \
			or ball.hit {x: coor.x + coor.width, y: coor.y + coor.height} \
				then callback player

	stopGame: (border) =>
		@chrono.stopChrono()
		clearInterval @game_loop
		switch border
			when "LEFT" then @lose @lose_text
			when "RIGHT" then @win @lose_text

	lose: (text) ->
		text.element.text @conf["text"]["lose_text"]
		@final_msg.css "display", "block"

	win: (text) ->
		text.element.text @conf["text"]["win_text"]
		@final_msg.css "display", "block"
