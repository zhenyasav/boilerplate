Meteor.startup ->
	$(window).on 'keyup', (e) ->
		if e.keyCode is Utils.keys.tilde
			$('html').toggleClass 'debug'