class Canvas
	constructor: (id) ->
		@$pong = $("##{id}")

	setBackgroundColor: (color) ->
		@$pong.drawRect {
			fillStyle: color
			x: 0, y: 0
			width: 600
			height: 300
		}
