class Player extends Element
	constructor: (id, @pong) ->
		super id
		@moveInt()
		@direction = {
			up: false
			down: false
		}

	setPlayer: (place) ->
		@position.top += @pong.position.height / 2 - @position.height / 2
		@refreshPosition()

	configureKeyboard: (panel) ->
		switch panel
			when "LEFT"
				$(document).keydown (touch) =>
					switch touch.key
						when "w", "z" then @direction.up = true
						when "s" then @direction.down = true
				$(document).keyup (touch) =>
					switch touch.key
						when "w", "z" then @direction.up = false
						when "s" then @direction.down = false
			when "RIGHT"
				$(document).keydown (touch) =>
					switch touch.key
						when "ArrowUp" then @direction.up = true
						when "ArrowDown" then @direction.down = true
				$(document).keyup (touch) =>
					switch touch.key
						when "ArrowUp" then @direction.up = false
						when "ArrowDown" then @direction.down = false

	# TODO REGLAGE DYNAMIQUE DE L'INTERVAL
	moveInt: ->
		setInterval =>
			if (@direction.up) then @move "UP"
			if (@direction.down) then @move "DOWN"
		, 10

	# TODO REGLAGE DYNAMIQUE DU NOMBRE DE PIXEL PAR DEPLACEMENT
	move: (direction) ->
		switch direction
			when "UP"
				if @position.top - 5 > @pong.limit.top
					@position.top -= 5
					@refreshPosition()
					#@$element.css "top", @position.top
			when "DOWN"
				if @position.top + 5 < @pong.limit.bottom
					@position.top += 5
					@refreshPosition()
					#@$element.css "top", @position.top