class Player extends Element
	@canvas.drawRect @name, {
		layer: true
		name: @name
		groups: ['player']
		fillStyle: conf["player"]["color"]
		x: 10
		y: 75
		height: conf["player"]["height"]
		width: conf["player"]["width"]
	}
