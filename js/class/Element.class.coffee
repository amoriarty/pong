class Element
	constructor: (id) ->
		if id
			@$element = $("##{id}")
			@position = @$element.offset()
			@position.width = @$element.width()
			@position.height = @$element.height()
