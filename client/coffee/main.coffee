jQuery ->
	$.getJSON "/conf", (setting) ->
		console.log setting
		setup = {
			height: window.innerHeight
			width: window.innerWidth
		}
		console.log setup

