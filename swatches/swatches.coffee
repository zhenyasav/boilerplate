Template._colors.helpers 
	colors: -> 
		scheme: [1..5].map Utils.spellNumber
		colors: [
			'purple'
			'violet'
			'magenta'
			'pink'
			'red'
			'orange'
			'yellow'
			'green'
			'cyan'
			'blue'
			'darkblue'
		]

Template._shades.helpers 
	colors: -> 
		shades: [
			'white'
			'light'
			'lightgray'
			'gray'
			'darkgray'
			'dark'
			'black'
		]