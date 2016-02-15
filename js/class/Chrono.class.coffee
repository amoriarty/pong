class Chrono
	constructor: ->
		@start = false
		@stop = false

	startChrono: ->
		@start = if not @start then new Date().getTime()

	stopChrono: ->
		@stop = if not @start then new Date().getTime()

	getDuration: ->
		now = if not @stop then new Date().getTime() else @stop
		diff = now - @start
		diff = new Date diff
		"#{diff.getSeconds()}:#{diff.getMilliseconds()}"
