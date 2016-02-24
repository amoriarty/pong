class Canvas
	constructor: (id) ->
		@$pong = $("##{id}")

	setBackgroundColor: (color) ->
		@$pong.drawRect {
			layer: true
			name: "background"
			fillStyle: color
			x: 0, y: 0
			width: 300
			height: 150
			fromCenter: false
		}

	drawSeparation: (conf) ->
		@$pong.drawRect {
			layer: true
			name: "filet"
			fillStyle: conf["color"]
			x: 150, y: 75
			width: conf["width"]
			height: 150
			}