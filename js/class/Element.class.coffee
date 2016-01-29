class Element
	constructor: (id) ->
		if id
			@$element = $("##{id}")
			position = @$element.position()
			@position = {
				x: position.top
				y: position.left
				width: @$element.width()
				height: @$element.height()
			}

	newElement: (x, y, w, h) ->
		@position = {
			x: x
			y: y
			width: w
			height: h
		}