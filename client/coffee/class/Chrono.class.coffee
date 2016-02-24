class Chrono extends Text
	constructor: (id, name, conf, @coor) ->
		super id, name, conf
		@start = false
		@stop = false

	startChrono: ->
		@start = if not @start then new Date().getTime()

	stopChrono: ->
		@stop = if not @stop then new Date().getTime()

	getDuration: ->
		if @start is false then @write "Time 00:00:000", @coor
		else
			now = if not @stop then new Date().getTime() else @stop
			diff = now - @start
			diff = new Date diff
			timer = {
				milli: diff.getMilliseconds()
				seconds: diff.getSeconds()
				min: diff.getMinutes()
			}
			@canvas.setLayer @name, {
				text: "Time #{timer.min}:#{timer.seconds}:#{timer.milli}"
			}