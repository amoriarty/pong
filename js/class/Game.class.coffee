class Game
	constructor: ->
		@players = []
		@Chrono = new Chrono "info"

		# RECUPERATION DU DOM DU JEUX
		@pong = new Element "pong"
		@pong.game_statue = false

		# CALCUL DES LIMITES DU TERRAIN
		@pong.border_size = Math.round parseFloat @pong.$element.css "border-bottom-width"
		@pong.limit = {
			top: @pong.position.top + @pong.border_size
			bottom: @pong.position.top + @pong.position.height + @pong.border_size
			left: @pong.position.left + @pong.border_size
			right: @pong.position.left + @pong.position.width - 2 * @pong.border_size
		}

	# INIT TERRAIN DE JEU
	initGame: ->
		@pong.$element.unbind "click"
		@Chrono.$element.text "Utilisé la barre espace pour servir, les flèches haut et bas pour déplacer la barre."

		# CHRONOMETRE
		$(document).keydown (t) =>
			if t.keyCode is 32 and not @Chrono.start
				@Chrono.startChrono()
				@interval = setInterval =>
					@Chrono.$element.text @Chrono.getDuration()
				, 1

	# RENITIALISE LE JEU POUR RETRY UNE PARTIE
	retry: ->
		@Chrono.start = false
		@Chrono.stop = false
		@ball.velocity.x = 2
		@ball.direction.x = 1
		@ball.setService @players[0]
		@initGame


	# CREATION D'UN NOUVEAU PLAYER
	setPlayer: (id, place, panel) ->
		player = new Player id, @pong, place
		player.setKeyboard panel
		@players.push player

	# CREATION D'UN BOT
	setBot: (id, place) ->
		bot = new Bot id, @pong, place
		@players.push bot

	# CREATION ET MIS EN PLACE DE LA BALLE
	setBall: ->
		@ball = new Ball "ball", @pong, @players, {
			left: @youWin
			right: @youLose
		}
		@ball.setService @players[0]
		for player in @players
			if player instanceof Bot
				player.setBall @ball

	# FONCTION APPELLER EN CAS DE VICTOIRE
	youWin: =>
		@end()
		@Chrono.$element.text "Perdu, #{@Chrono.getDuration()}, clique ici pour réessayer."
		@Chrono.$element.click =>
			@retry()

	# FONCTION APPELLER EN CAS DE DEFAITE
	youLose: =>
		@end()
		@Chrono.$element.text "Gagné, #{@Chrono.getDuration()}, clique ici pour réessayer."
		@Chrono.$element.click =>
			@retry()

	end: =>
		@Chrono.stopChrono()
		clearInterval @interval
		@ball.stopLoop()
		@pong.game_statue = false

