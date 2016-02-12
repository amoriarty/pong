class Ball extends Element
	constructor: (id, @pong, @players) ->
		super id
		@velocity = {
			x: 1
			y: 1
		}
		@direction = {
			x: 0
			y: 0
		}
		@startLoop()
		$(document).keydown (touch) =>
			if touch.key is ' ' and @pong.game_statue is false
				@pong.game_statue = true
				@direction.x = 1
				@direction.y = if Math.random() < 0.5 then -1 else 1

	setService: (player) ->
		if player instanceof Player
			@position.top = player.position.top + player.position.height / 2 - @position.height / 2
			switch player.place
				when 1, 2 then @position.left = player.position.left + player.position.width
				when 3, 4 then @position.left = player.position.left - @position.width
			@refreshPosition()

	startLoop: ->
		@loop_interval = setInterval @loop, 10

	loop: =>
		@position.left += @direction.x * @velocity.x
		@position.top += @direction.y * Math.random() #@velocity.y
		console.log "X = #{@direction.x} Y = #{@direction.y}"
		@refreshPosition()
		@hitBorder()
		@hitPlayer()
		@hitLeftBorder =>
			@direction.x *= -1
		@hitRightBorder =>
			@direction.x *= -1

	# TODO ERREUR COLLISION EN BAS
	hitBorder: ->
		if @position.top <= @pong.limit.top \
		or @position.top + @position.height >= @pong.limit.bottom
			@direction.y *= -1

	hitPlayer: ->
		for player in @players
			if @position.top >= player.position.top \
			and @position.top + @position.height <= player.position.top + player.position.height \
			and @position.left + @position.width >= player.position.left \
			and @position.left <= player.position.left + player.position.width
				@direction.x *= -1

	hitLeftBorder: (callback) ->
		if @position.left <= @pong.limit.left
			callback()

	hitRightBorder: (callback) ->
		if @position.left >= @pong.limit.right
			callback()