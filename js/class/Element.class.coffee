class Element
	constructor: (id) ->
		if id
			@$element = $("##{id}")
			position = @$element.offset()
			@position = {
				top: position.top
				left: position.left
				width: @$element.width()
				height: @$element.height()
			}
