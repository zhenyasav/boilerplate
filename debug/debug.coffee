if Meteor.settings?.public?.debugCss isnt false
	Meteor.startup ->
		$(window).on 'keyup', (e) ->
			if e.keyCode is Utils.keys.tilde and e.ctrlKey
				$('html').toggleClass 'debug'