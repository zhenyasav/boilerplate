tilde = 192

Meteor.startup ->
	$(window).on 'keyup', (e) ->
		if e.keyCode is tilde
			$('html').toggleClass 'debug'