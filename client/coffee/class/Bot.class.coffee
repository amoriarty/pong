class Bot extends Player
	setBall: (@ball) ->
		@loop()

	loop: ->
		@loop_interval = setInterval =>
			if @ball.direction.x is 1
				layer = @canvas.getLayer @name
				coor = @ball.getCoor()
				if coor.y < layer.y - layer.height / 4 then @move "UP", @conf["bot_speed"]
				if coor.y > layer.y + layer.height / 4 then @move "DOWN", @conf["bot_speed"]
		, 0
