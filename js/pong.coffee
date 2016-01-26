jQuery ->
	map = new Canvas "map", "2d"

	$(window).resize ->
		map.fullBrowser()
	map.fullBrowser()
	map.setBackgroundColor "#000"
