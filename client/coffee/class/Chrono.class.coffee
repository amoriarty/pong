class Chrono extends Text
	constructor: (id) ->
		super id
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
		@element.text "#{timer.min}:#{timer.seconds}:#{timer.milli}"
