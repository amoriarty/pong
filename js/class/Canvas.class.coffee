class Canvas
	constructor: (@id, context) ->
		@$canvas = $("<canvas id=#{@id}>")
		@$body = $("body")
		@$body.append @$canvas

	fullBrowser: ->
		@$canvas.width window.innerWidth
		@$canvas.height window.innerHeight
		@$body.width @$canvas.width()
		@$body.height @$canvas.height()

	setBackgroundColor: (color) ->
		@$canvas.drawRect {
			fillStyle: color
			x: 0, y: 0
			width: @$canvas.width()
			height: @$canvas.height()
		}
