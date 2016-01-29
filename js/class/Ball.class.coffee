class Ball extends Element
	setService: (player) ->
		if player instanceof Player
			@$element.css "top", player.position.top + player.position.height / 2
			@$element.css "left", player.position.left + player.position.width
