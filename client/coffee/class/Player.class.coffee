class Player extends Element
	constructor: (canvas, name, conf, @place) ->
		super canvas, name, conf

	draw: ->
		@canvas.drawRect {
			layer: true
			name: @name
			groups: ['player']
			fillStyle: @conf["color"]
			x: 10
			y: 75
			height: @position.height
			width: @position.width
			}
