class Canvas
	constructor: (id) ->
		@$pong = $("##{id}")
		@canvas = document.getElementById id
		@context = @canvas.getContext "2d"

	setBackgroundColor: (color) ->
		@context.fillStyle = color
		@context.fillRect 0, 0, @$pong.width(), @$pong.height()
