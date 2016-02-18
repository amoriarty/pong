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

		hero = new Player canvas.context, {
			x: 0
			y: 0
			width: 10
			height: 90
		}
		.draw()

		#debug mouse
		canvas.canvas.addEventListener "mousedown", (e) ->
			console.log e.pageX
			console.log e.pageY
		, true
