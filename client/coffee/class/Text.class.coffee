class Text extends Element
	write: (text, coor) ->
		@canvas.drawText {
			text: text
			layer: true
			name: @name
			strokeStyle: @conf["color"]
			strokeWidth: @conf["width"]
			fontFamily: @conf["font_family"]
			fontSize: @conf["font_size"]
			x: coor.x, y: coor.y
		}
