class Bot extends Player
	setBall: (@ball) ->
		requestAnimationFrame @loop

	loop: =>
		layer = @canvas.getLayer @name
		if @ball.direction.x is 1
			coor = @ball.getCoor()
			if coor.y < layer.y - layer.height / 4 then @move "UP", @conf["bot_speed"]
			if coor.y > layer.y + layer.height / 4 then @move "DOWN", @conf["bot_speed"]
		else
			if layer.y > 75 then @move "UP", @conf["bot_speed"]
			if layer.y < 75 then @move "DOWN", @conf["bot_speed"]
		requestAnimationFrame @loop
