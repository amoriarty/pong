class Game
	constructor: ->
		@init_game()

	init_game: ->
		# TODO CREATION DES BALISE PLAYER SELON LES BESOIN (AFIN DE NE PAS AVOIR DES BALISES NON AFFICHER)
		# EFFACEMENT DES PLAYER 2 ET 3
		$("#player-2").css "display", "none"
		$("#player-3").css "display", "none"

		# RECUPERATION DU DOM DU JEUX
		@pong = new Element "pong"

		# CALCUL DES LIMITES DU TERRAIN
		@pong.limit = {
			top: @pong.position.top
			bottom: @pong.position.top + @pong.position.height - $(".player").height() + Math.round parseFloat @pong.$element.css "border-bottom-width"
		}

		# INITIALISATION PLAYER 1
		one = new Player "player-1", @pong, 1
		one.configureKeyboard "LEFT"

		# INITIALISATION PLAYER 2
		two = new Player "player-4", @pong, 4
		two.configureKeyboard "RIGHT"

		# INITIALISATION DE LA BALLE
		ball = new Ball "ball", @pong
		ball.setService one

		$(document).keydown (touch) =>
			if touch.key is ' '
				@start_game()

	stop_game: ->
		clearInterval @gameLoop

	start_game: ->
		@gameLoop = setInterval @game_loop, 10

	game_loop: =>
		@stop_game()
