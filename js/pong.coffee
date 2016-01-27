class Player
	constructor: (id) ->
		@$player = $("##{id}")
		@limit = {
			top: @$player.position().top
			bottom: @$player.position().top + $("#map").height()
		}

	configureKeyboard: ->
		$(document).keypress (touch) ->
			switch touch.key
				when "ArrowUp" then console.log "Key Up"
				when "ArrowDown" then console.log "Key Down"

jQuery ->
	player = new Player "player"
	player.configureKeyboard()
