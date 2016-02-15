class Chrono extends Element
	constructor: ->
		@start = false
		@stop = false

	startChrono: ->
		@start = if not @start then new Date().getTime()

	stopChrono: ->
		@stop = if not @stop then new Date().getTime()

	getDuration: ->
		now = if not @stop then new Date().getTime() else @stop
		diff = now - @start
		diff = new Date diff
		timer = {
			milli: diff.getMilliseconds()
			seconds: diff.getSeconds()
			min: diff.getMinutes()
		}
		"<div id='chrono'>Duration #{timer.min.toString()}:#{timer.seconds.toString()}:#{timer.milli.toString()}</div>"
