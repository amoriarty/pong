class Chrono extends Element
	constructor: ->
		@start = false
		@stop = false

	# DEMARRE LE CHRONOMETRE SI CE N'EST PAS DEJA FAIT
	startChrono: ->
		@start = if not @start then new Date().getTime()

	# STOP LE CHRONOMETRE SI CE N'EST PAS DEJA FAIT
	stopChrono: ->
		@stop = if not @stop then new Date().getTime()

	# RENVOIS LA BALISE COMPLETE A AFFICHER
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
