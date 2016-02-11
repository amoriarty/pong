class Game
	constructor: ->
		@players = []
		@initGame()

	initGame: ->
		# RECUPERATION DU DOM DU JEUX
		@pong = new Element "pong"
		@pong.game_statue = false

		# CALCUL DES LIMITES DU TERRAIN
		@pong.limit = {
			top: @pong.position.top
			bottom: @pong.position.top + @pong.position.height + Math.round parseFloat @pong.$element.css "border-bottom-width"
		}


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