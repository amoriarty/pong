class Player extends Element
	constructor: (id, @pong, @place) ->
		super id
		@setPlayer @place
		@moveInt()
		@direction = {
			up: false
			down: false
		}
		@score = 0

	setPlayer: (place) ->
		@position.top += @pong.position.height / 2 - @position.height / 2
		switch place
			when 1 then @position.left += 1.38 * @pong.position.width / 100
			when 2 then @position.left += 23.95 * @pong.position.width / 100
			when 3 then @position.left += 73.88 * @pong.position.width / 100
			when 4 then @position.left += 97.22 * @pong.position.width / 100
		@refreshPosition()

	configureKeyboard: (panel) ->
		switch panel
			when "LEFT"
				$(document).keydown (touch) =>
					switch touch.keyCode
						when 87, 90 then @direction.up = true
						when 83 then @direction.down = true
				$(document).keyup (touch) =>
					switch touch.keyCode
						when 87, 90 then @direction.up = false
						when 83 then @direction.down = false
			when "RIGHT"
				$(document).keydown (touch) =>
					switch touch.keyCode
						when 38 then @direction.up = true
						when 40 then @direction.down = true
				$(document).keyup (touch) =>
					switch touch.keyCode
						when 38 then @direction.up = false
						when 40 then @direction.down = false

	# TODO REGLAGE DYNAMIQUE DE L'INTERVAL
	moveInt: ->
		setInterval =>
			if (@direction.up) then @move "UP"
			if (@direction.down) then @move "DOWN"
		, 1

	# TODO REGLAGE DYNAMIQUE DU NOMBRE DE PIXEL PAR DEPLACEMENT
	move: (direction) ->
		switch direction
			when "UP"
				if @position.top - 1 > @pong.limit.top
					@position.top -= 1
					@refreshPosition()
			when "DOWN"
				if @position.top + 1 < @pong.limit.bottom - @position.height
					@position.top += 1
					@refreshPosition()
