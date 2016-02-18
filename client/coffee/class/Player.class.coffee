class Player extends Element
	draw: ->
		@context.fillStyle = "#FFFFFF"
		@context.fillRect @position.x, @position.y, @position.width, @position.height
