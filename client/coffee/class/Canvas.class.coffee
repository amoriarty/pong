class Canvas
	constructor: (id) ->
		@$pong = $("##{id}")

	setBackgroundColor: (color) ->
		@$pong.drawRect {
			layer: true
			name: "background"
			fillStyle: color
			x: 0, y: 0
			width: 600
			height: 300
		}

	drawSeparation: (conf) ->
		@$pong.drawRect {
			layer: true
			name: "filet"
			fillStyle: conf["color"]
			x: 150, y: 0
			width: conf["width"]
			height: 300
			}