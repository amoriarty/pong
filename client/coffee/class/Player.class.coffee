class Player extends Element
	constructor: (canvas, name, conf, @place) ->
		super canvas, name, conf

	draw: ->
		@canvas.drawRect {
			layer: true
			name: @name
			groups: ['player']
			fillStyle: @conf["color"]
			x: @conf["place"][@place]["x"]
			y: @conf["place"][@place]["y"]
			height: @position.height
			width: @position.width
			}
