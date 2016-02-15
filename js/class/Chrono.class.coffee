class Chrono
	constructor: ->
		@Date = new Date
		@timer = {
			start: false
			stop: false
		}

	# TODO MYSTERE DE DATE DANS LE CORE DE JS, SA PROMET !
	startChrono: ->
		if not @timer.start then @timer.start = @Date.getMilliseconds()

	getDuration: ->
		now = if @timer.stop then @timer.stop else @Date.getMilliseconds()
		diff = now - @timer.start
		diff = new Date diff
		"#{diff.getSeconds()}"

