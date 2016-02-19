jQuery ->
	window.requestAnimFrame = ->
		window.requestAnimationFrame ||
		window.webkitRequestAnimationFrame ||
		window.mozRequestAnimationFrame ||
		window.oRequestAnimationFrame ||
		window.msRequestAnimationFrame ||
		(callback) ->
				window.setTimeout(callback, 1000 / 60)

	window.cancelRequestAnimFrame = ->
		window.cancelAnimationFrame ||
		window.webkitCancelRequestAnimationFrame ||
		window.mozCancelRequestAnimationFrame ||
		window.oCancelRequestAnimationFrame ||
		window.msCancelRequestAnimationFrame ||
		clearTimeout


	$.getJSON "/conf", (conf) ->
		canvas = new Canvas "pong"
		canvas.setBackgroundColor conf["background-color"]
		canvas.drawSeparation conf["separation"]

		Hero = new Player canvas.$pong, "Hero", conf["player"], 1
		.draw()

		BadGuy = new Player canvas.$pong, "BadGuy", conf["player"], 4
		.draw()
