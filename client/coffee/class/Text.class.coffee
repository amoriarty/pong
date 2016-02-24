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

	click: (callback) ->
		@canvas.click (e) =>
			offset = @canvas.offset()
			layer = @canvas.getLayer @name
			x = Math.floor ((e.pageX - offset.left) / 2)
			y = Math.floor ((e.pageY- offset.top) / 2)

			if x > layer.x - layer.width / 2 \
			and x < layer.x + layer.width / 2 \
			and y > layer.y - layer.height / 2 \
			and y < layer.y + layer.height / 2 \
				then callback()
