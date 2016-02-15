class Game
	# TODO VERIF PROPRETER
	constructor: ->
		@players = []
		@initGame()

	# INIT TERRAIN DE JEU
	initGame: ->
		# RECUPERATION DU DOM DU JEUX
		@pong = new Element "pong"
		@pong.game_statue = false
		@Chrono = new Chrono

		# CALCUL DES LIMITES DU TERRAIN
		# TODO RESIZE WINDOW
		@pong.border_size = Math.round parseFloat @pong.$element.css "border-bottom-width"
		@pong.limit = {
			top: @pong.position.top + @pong.border_size
			bottom: @pong.position.top + @pong.position.height + @pong.border_size
			left: @pong.position.left + @pong.border_size
			right: @pong.position.left + @pong.position.width - 2 * @pong.border_size
		}

		# CHRONOMETRE
		$(document).keydown (t) =>
			@Chrono.startChrono()


	# CREATION D'UN NOUVEAU PLAYER
	setPlayer: (id, place, panel) ->
		player = new Player id, @pong, place
		player.setKeyboard panel
		@players.push player

	# CREATION D'UN BOT
	setBot: (id, place) ->
		@bot = new Bot id, @pong, place
		@players.push @bot

	# CREATION ET MIS EN PLACE DE LA BALLE
	setBall: () ->
		@ball = new Ball "ball", @pong, @players, {
			left: =>
				@Chrono.stopChrono()
			right: =>
				@Chrono.stopChrono()
		}
		@ball.setService @players[0]
		@bot.setBall @ball
