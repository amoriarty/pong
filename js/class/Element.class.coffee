class Element
	constructor: (id) ->
		if id
			@$element = $("##{id}")
			position = @$element.position()
			@position = {
				top: position.top
				left: position.left
				width: @$element.width()
				height: @$element.height()
			}

	refreshPosition: ->
		@$element.css @position