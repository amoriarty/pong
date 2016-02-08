class Game
	constructor: ->
		@players = []
		@init_game()

	init_game: ->
		@game_statue = false
		# TODO CREATION DES BALISE PLAYER SELON LES BESOIN (AFIN DE NE PAS AVOIR DES BALISES NON AFFICHER)
		# EFFACEMENT DES PLAYER 2 ET 3
		$("#player-2").css "display", "none"
		$("#player-3").css "display", "none"

		# RECUPERATION DU DOM DU JEUX
		@pong = new Element "pong"

		# CALCUL DES LIMITES DU TERRAIN
		@pong.limit = {
			top: @pong.position.top
			bottom: @pong.position.top + @pong.position.height + Math.round parseFloat @pong.$element.css "border-bottom-width"
		}

		# INITIALISATION PLAYER 1
		one = new Player "player-1", @pong, 1
		one.configureKeyboard "LEFT"
		@players.push one

		# INITIALISATION PLAYER 2
		two = new Player "player-4", @pong, 4
		two.configureKeyboard "RIGHT"
		@players.push two

		# INITIALISATION DE LA BALLE
		@ball = new Ball "ball", @pong
		@ball.setService one

		$(document).keydown (touch) =>
			if touch.key is ' ' and @game_statue is false
				@game_statue = true
				@ball.direction.x = 1
				@ball.direction.y = 1
				@start_game()

	stop_game: ->
		clearInterval @gameLoop

	start_game: ->
		@gameLoop = setInterval @game_loop, 10

	game_loop: =>
		@ball.position.top += @ball.direction.y * @ball.velocity.y
		@ball.position.left += @ball.direction.x * @ball.velocity.x
		@ball.refreshPosition()

		# COLLISION PLAYER
		for player in @players
			@collision @ball, player, =>
				@ball.direction.x *= -1

		# COLLISION BORDURE HAUT ET BAS
		@limit_collision @ball, =>
			@ball.direction.y *= -1

	collision: (elem1, elem2, callback) ->
		# TODO SYSTEM DE COLLISION DOESN'T WORK !
		if elem1 instanceof Element and elem2 instanceof Element
			if elem1.position.top >= elem2.position.top \
				and elem1.position.top + elem1.position.height <= elem2.position.top + elem2.position.height \
				and elem1.position.left + elem1.position.width >= elem2.position.left \
				and elem1.position.left <= elem2.position.left + elem2.position.width
							callback()

	limit_collision: (elem, callback) =>
		if elem instanceof Element
			if elem.position.top <= @pong.limit.top \
				or elem.position.top + elem.position.height >= @pong.limit.bottom
					callback()