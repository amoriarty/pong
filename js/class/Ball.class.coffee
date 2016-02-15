class Ball extends Element
	# TODO LE DEPLACEMENT PAR NOMBRE ALEATOIRE PEUT ENCORE ETRE AFFINER
	constructor: (id, @pong, @players, @callback) ->
		super id
		# VITESSE DE LA BALLE
		@velocity = {
			x: 1.3
			y: 1.3
		}
		# DIRECTION
		@direction = {
			x: 1
			y: if Math.random() < 0.5 then Math.random() * -1 else Math.random()
		}
		$(document).keydown (touch) =>
			if touch.key is ' ' and @pong.game_statue is false
				@pong.game_statue = true
				@startLoop()

	setService: (player) ->
		if player instanceof Player
			@position.top = player.position.top + player.position.height / 2 - @position.height / 2
			switch player.place
				when 1, 2 then @position.left = player.position.left + player.position.width + 2
				when 3, 4 then @position.left = player.position.left - @position.width - 2
			@$element.css @position

	startLoop: ->
		@loop_interval = setInterval @loop, 10

	loop: =>
		if @position.left > @pong.limit.left and @position.left < @pong.limit.right
			@hitBorder()
			@hitPlayer()
			@hitLeftBorder @callback.left
			@hitRightBorder @callback.right
			@position.left += @direction.x * @velocity.x
			@position.top += @direction.y * @velocity.y
			@$element.css @position

	hitBorder: ->
		if @position.top < @pong.limit.top \
		or @position.top + @position.height > @pong.limit.bottom
			@direction.y = if @direction.y > 0 then Math.random() * -1 else Math.random()
			@velocity.y *= 1.01

	hitPlayer: ->
		for player in @players
			if @position.top + @position.height > player.position.top - 2 \
			and @position.top < player.position.top + player.position.height + 2\
			and @position.left + @position.width > player.position.left - 2 \
			and @position.left < player.position.left + player.position.width + 2
				@velocity.x *= 1.03
				@velocity.y *= 1.01
				@direction.x *= -1
				if @direction.y > 0
					@direction.y = if @position.top + @position.height / 2 > player.position.top + player.position.height / 2 \
						then Math.random() * -1 else Math.random()
				else @direction.y = if @position.top + @position.height / 2 < player.position.top + player.position.height / 2 \
					then Math.random() * -1 else Math.random()

	# TODO CALLBACK BORDER
	hitLeftBorder: (callback) ->
		if @position.left <= @pong.limit.left + 2
			callback()

	hitRightBorder: (callback) ->
		if @position.left >= @pong.limit.right - 2
			callback()