@Utils =
	keys: 
		tilde: 192
		esc: 27
		enter: 13

	colors:
		orange: '#FF9933'
		darkblue: '#0072B2'
		blue: '#00A3FF'
		cyan: '#47e9e9'
		red: '#FF1924'
		green: '#A8E30B'
		yellow: '#FFEF36'
		pink: '#ff6699'
		magenta: '#FF00FF'
		violet: '#9400D3'
		purple: '#5C00EA'

	spellNumber: (n) -> 
		if 0 <= n < 10
			[
				'zero'
				'one'
				'two'
				'three'
				'four'
				'five'
				'six'
				'seven'
				'eight'
				'nine'
			][n]
		else
			n

	span: ->
		args = [].slice.call arguments, 0
		content = args.splice args.length-1, 1
		attributes = {}
		args.map (arg) -> _.each arg, (val, key) -> attributes[key] = val
		attrs = _.map attributes, (val, key) -> "#{key}=\"#{val}\""
		.join ' '
		"<span #{attrs}>#{content}</span>"

	cssClass: (s) -> s?.toLowerCase?()?.replace? /\s|\./g, '-'

	delay: (d, f) -> Meteor.setTimeout f, d

	capitalize: (s) -> if s?.length then s[0].toUpperCase() + s.slice 1 else s

	singular: (s) -> if s[s.length-1] is 's' then s.substring(0,s.length-1) else s

	plural: (s) -> if s[s.length-1] isnt 's' then s + 's' else s

	pluralize: (n, s) -> if n is 1 then Utils.singular s else if n > 1 then Utils.plural s else s

	log: -> 
		result = arguments[arguments.length-1]
		console.log.apply console, arguments
		result
	
	randomString: (prefix) -> (prefix?.toString() ? "") + Math.floor Math.random() * 10**10

	mobilizeEvents: (eventMap) ->
		return eventMap if 'ontouchstart' not of window
		
		newMap = {}
		for k,v of eventMap
			newMap[k.replace 'click', 'touchend'] = v

		newMap 