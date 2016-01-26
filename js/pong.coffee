jQuery ->
	map = new Map "map", "2d"

	$(window).resize ->
		map.fullBrowser()
	map.fullBrowser()
	map.setBackgroundColor "#000"
	map.drawMap()
