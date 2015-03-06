
utilHelpers = _.pick Utils, 'pluralize', 'capitalize', 'cssClass', 'spellNumber'

helpers = _.extend utilHelpers, 

	currentRoute: -> Router?.current?()

	session: (k) -> Session.get k
	
	key_value: (context, options) ->
		result = []

		return result if not context
		
		if options?.hash?.keys?.length
			_.each options.hash.keys, (value, key, list) ->
				result.push
					key: value
					value: context?[value] ? null
					context: context

		else
			_.each context, (value, key, list) ->
				result.push
					key: key
					value: value
					context: context

		result


UI.registerHelper k,v for k,v of helpers