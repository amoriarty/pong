class Bot extends Player
	setBall: (@ball) ->
		requestAnimationFrame @loop

	loop: =>
		layer = @canvas.getLayer @name
		switch @double
			when false then @simple layer
			when true then @doub layer
		requestAnimationFrame @loop

	simple: (layer) =>
		if @ball.direction.x is 1
			coor = @ball.getCoor()
			if coor.y < layer.y - layer.height / 4 then @move "UP", @conf["bot_speed"]
			if coor.y > layer.y + layer.height / 4 then @move "DOWN", @conf["bot_speed"]
		else
			if layer.y > 75 then @move "UP", @conf["bot_speed"]
			if layer.y < 75 then @move "DOWN", @conf["bot_speed"]

	doub: (layer) =>
		coor = @ball.getCoor()
		if coor.x < layer.x
			switch @place
				when 3
					if layer.y - layer.height / 2 > 75 - @conf["bot_marge"] and coor.y < layer.y then @move "UP", @conf["bot_speed"]
					if coor.y > layer.y then @move "DOWN", @conf["bot_speed"]
				when 4
					if layer.y + layer.height / 2 < 75 + @conf["bot_marge"] and coor.y > layer.y then @move "DOWN", @conf["bot_speed"]
					if coor.y < layer.y then @move "UP", @conf["bot_speed"]
		else
			switch @place
				when 1
					if coor.y > layer.y then @move "DOWN", @conf["bot_speed"]
					if coor.y < layer.y then @move "UP", @conf["bot_speed"]
				when 3
					if layer.y - layer.height / 2 > 75 - @conf["bot_marge"] and coor.y > layer.y then @move "UP", @conf["bot_speed"]
					if coor.y < layer.y then @move "DOWN", @conf["bot_speed"]
				when 4
					if layer.y + layer.height / 2 < 75 + @conf["bot_marge"] and coor.y > layer.y then @move "UP", @conf["bot_speed"]
					if coor.y < layer.y then @move "DOWN", @conf["bot_speed"]
