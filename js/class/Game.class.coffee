class Game
	constructor: ->
		@players = []
		@initGame()

	# INIT TERRAIN DE JEU
	initGame: ->
		# RECUPERATION DU DOM DU JEUX
		@pong = new Element "pong"
		@pong.game_statue = false

		# CALCUL DES LIMITES DU TERRAIN
		@pong.border_size = Math.round parseFloat @pong.$element.css "border-bottom-width"
		@pong.limit = {
			top: @pong.position.top + @pong.border_size
			bottom: @pong.position.top + @pong.position.height + @pong.border_size
			left: @pong.position.left + @pong.border_size
			# TODO LIMIT PROBLEME
			right: @pong.position.left + @pong.position.width - @pong.border_size
		}

	# CREATION D'UN NOUVEAU PLAYER
	setPlayer: (id, place, panel) ->
		player = new Player id, @pong, place
		player.setKeyboard panel
		@players.push player

	# CREATION ET MIS EN PLACE DE LA BALLE
	setBall: ->
		@ball = new Ball "ball", @pong, @players
		@ball.setService @players[0]



	###
		# COLLISION PLAYER
		for player in @players
			@collision @ball, player, =>
				@ball.direction.x *= -1

		# COLLISION BORDURE HAUT ET BAS
		@limit_collision @ball, =>
			@ball.direction.y *= -1

	collision: (elem1, elem2, callback) ->
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
	###
