@Utils = _.extend @Utils ? {},
	
	keys: 
		tilde: 192
		left: 37
		right: 39
		up: 38
		down: 40
		esc: 27
		enter: 13
		space: 32
		shift: 16
		ctrl: 17
		alt: 18
		cmd: 91

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

	tag: (name) ->
		(args...) ->
			attr = {}
			last = args[args.length - 1]
			if last instanceof Element or _.isArray last
				content = args.splice(args.length - 1, 1)?[0]
			for arg in args
				for key, val of arg 
					attr[key] = val
			el = document.createElement name
			for a, val of attr
				el.setAttribute a, val
			if not _.isArray content
				content = [content]
			content.map (c) -> el.appendChild c if c instanceof Element
			el

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
	
	randomString: (prefix, order=10) -> (prefix?.toString() ? "") + Math.floor Math.random() * 10**order

	mobilizeEvents: (eventMap) ->
		return eventMap if 'ontouchstart' not of window
		
		newMap = {}
		for k,v of eventMap
			newMap[k.replace 'click', 'touchend'] = v

		newMap 

@Utils.span = Utils.tag 'span'
@Utils.div = Utils.tag 'div'