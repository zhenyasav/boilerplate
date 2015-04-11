Meteor.startup ->
	$(window).on 'keyup', (e) ->
		console.log e.keyCode
		if e.keyCode is Utils.keys.tilde and e.ctrlKey
			$('html').toggleClass 'debug'