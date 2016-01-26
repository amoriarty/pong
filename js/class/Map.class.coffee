class Map extends Canvas
	drawMap: =>
		@$canvas.drawImage {
			source: "/img/ball.png"
			x: 100
			y: 50
			fromCenter: true
		}
