class Ball extends Element
	constructor: (id, @pong, @players, @keyboard) ->
		super id
		@velocity = {
			x: 1.3
			y: 1.3
		}
		@direction = {
			x: 0
			y: 0
		}
		$(document).keydown (touch) =>
			if touch.key is ' ' and @pong.game_statue is false
				@pong.game_statue = true
				@direction.x = 1
				@direction.y = if Math.random() < 0.5 then Math.random() * -1 else Math.random()
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
		@hitBorder()
		@hitPlayer()
		@hitLeftBorder =>
			@direction.x *= -1
		@hitRightBorder =>
			@direction.x *= -1
		@position.left += @direction.x * @velocity.x
		@position.top += @direction.y * @velocity.y
		@$element.css @position

	hitBorder: ->
		if @position.top < @pong.limit.top \
		or @position.top + @position.height > @pong.limit.bottom
			@direction.y = if @direction.y > 0 then Math.random() * -1 else Math.random()
			@velocity.y *= 1.01

	# TODO PETIT PROBLEME DE COLLISION LORSQUE LE PLAYER ATTERIT SUR LA BALLE
	hitPlayer: ->
		for player in @players
			if @position.top + @position.height > player.position.top - 2 \
			and @position.top < player.position.top + player.position.height + 2\
			and @position.left + @position.width > player.position.left - 2 \
			and @position.left < player.position.left + player.position.width + 2
				@direction.x *= -1
				@velocity.x *= 1.03

	# TODO CALLBACK BORDER
	hitLeftBorder: (callback) ->
		if @position.left < @pong.limit.left
			callback()

	hitRightBorder: (callback) ->
		if @position.left >= @pong.limit.right
			callback()