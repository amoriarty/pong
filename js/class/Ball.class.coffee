class Ball extends Element
	constructor: (id, @pong) ->
		super id
		@velocity = {
			x: 0.5
			y: 0.5
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
				@direction.y = 1

	setService: (player) ->
		if player instanceof Player
			@position.top = player.position.top + player.position.height / 2 - @position.height / 2
			switch player.place
				when 1, 2 then @position.left = player.position.left + player.position.width
				when 3, 4 then @position.left = player.position.left - @position.width
			@refreshPosition()

	startLoop: ->
		@loop_interval = setInterval @loop, 1

	loop: =>
		@position.top += @direction.y * @velocity.y
		@position.left += @direction.x * @velocity.x
		@refreshPosition()

