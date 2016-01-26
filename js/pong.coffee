canvas = CE.defines("map").extend(Hit).ready ->
	canvas.Scene.call "Map"

canvas.Scene.new {
	name: "Map"
	ready: (stage) ->
		_canvas = @getCanvas()
		_window = canvas.Window.new this, 230, 200, "border"

		stage.empty()
		_canvas.setSize "browser"
		_window.setBackground "#000000", 10, .5
		_window.open stage

		# debug
		text = @createElement()
		text.font = "20px Arial"
		text.fillStyle = "black"
		text.fillText "OK !!!", _canvas.width / 2, _canvas.height / 2
		stage.append text
}