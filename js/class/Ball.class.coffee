class Ball extends Element
	# TODO LE DEPLACEMENT PAR NOMBRE ALEATOIRE PEUT ENCORE ETRE AFFINER
	# TODO AJOUTER UN MAXIMUM A LA VELOCITE
	# INITIALISE LE DEMARRAGE PAR LA TOUCHE ESPACE AINSI QUE TOUTE LES VARIABLES AVEC LEUR VALEUR DE BASE
	constructor: (id, @pong, @players, @callback) ->
		super id
		# VITESSE DE LA BALLE
		@velocity = {
			x: 2
			y: 2
		}
		# DIRECTION
		@direction = {
			x: 1
			y: if Math.random() < 0.5 then Math.random() * -1 else Math.random()
		}
		$(document).keydown (touch) =>
			if touch.keyCode is 32 and @pong.game_statue is false
				@pong.game_statue = true
				@startLoop()

	# PERMET DE POSITIONNER LA BALLE PAR RAPPORT A UN JOUEUR
	# PREND UN INSTANCE DE PLAYER EN PARAMETRE
	setService: (player) ->
		if player instanceof Player
			@position.top = player.position.top + player.position.height / 2 - @position.height / 2
			switch player.place
				when 1, 2 then @position.left = player.position.left + player.position.width + 2
				when 3, 4 then @position.left = player.position.left - @position.width - 2
			@$element.css @position

	# FONCTION DE DEMARRAGE DE LA BOUCLE
	startLoop: ->
		@loop_interval = setInterval @loop, 10

	# FONCTION PASSER A SET INTERVAL
	loop: =>
		###
		console.log "VELOCITY"
		console.log "       X = #{@velocity.x}"
		console.log "       Y = #{@velocity.y}"
		console.log "DIRECTION"
		console.log "       X = #{@direction.x}"
		console.log "       Y = #{@direction.y}"
		console.log "BOTH"
		console.log "       X = #{@direction.x * @velocity.x}"
		console.log "       Y = #{@direction.y * @velocity.y}"
		###
		if @position.left > @pong.limit.left and @position.left < @pong.limit.right
			@hitBorder()
			@hitPlayer()
			@hitLeftBorder @callback.left
			@hitRightBorder @callback.right
			@position.left += @direction.x * @velocity.x
			@position.top += @direction.y * @velocity.y
			@$element.css @position

	# VERIFIE LA COLLISION AVEC LES MURS HAUT ET BAS ET INVERSE LA TRAJECTOIRE DE LA BALLE
	hitBorder: ->
		if @position.top < @pong.limit.top \
		or @position.top + @position.height > @pong.limit.bottom
			@direction.y = if @direction.y > 0 then Math.random() * -1 else Math.random()
			@velocity.y *= 1.02

	# VERIFIE LA COLLISION AVEC TOUT LES JOUEURS PRESENTS ET INVERSE LA TRAJECTOIRE DE LA BALLE
	hitPlayer: ->
		for player in @players
			if @position.top + @position.height > player.position.top - 2 \
			and @position.top < player.position.top + player.position.height + 2\
			and @position.left + @position.width > player.position.left - 2 \
			and @position.left < player.position.left + player.position.width + 2
				@velocity.x *= 1.05
				@direction.x *= -1
				if @direction.y > 0
					@direction.y = if @position.top + @position.height / 2 > player.position.top + player.position.height / 2 \
						then Math.random() * -1 else Math.random()
				else @direction.y = if @position.top + @position.height / 2 < player.position.top + player.position.height / 2 \
					then Math.random() * -1 else Math.random()
				player.position.height -= if player.position.height > 50 then 5 else 0

	# COLLISION AVEC LE MUR DE GAUCHE QUI APPELLE UN CALLBACK
	hitLeftBorder: (callback) ->
		if @position.left <= @pong.limit.left + 2
			callback()

	# COLLISION AVEC LE MUR DE DROITE QUI APPELLE UN CALLBACK
	hitRightBorder: (callback) ->
		if @position.left >= @pong.limit.right - 2
			callback()