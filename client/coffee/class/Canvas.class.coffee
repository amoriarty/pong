class Canvas
	constructor: (id) ->
		@$pong = $("##{id}")
		@canvas = document.getElementById id
		@context = @canvas.getContext "2d"
		@position = @getPosition()

	getPosition: ->
		offset = @$pong.offset()
		{
			x: offset.left
			y: offset.top
			height: @$pong.height()
			width: @$pong.width()
		}

	setBackgroundColor: (color) ->
		@context.fillStyle = color
		@context.fillRect 0, 0, @position.width, @position.height
