# Less Coffee Meteor Boilerplate
If you're building your app with Coffee and Less, you might find these includes and utilities useful.

## utils.coffee
Defines (or extends) a global `Utils`:

### `Utils.tag(name)`
Returns a function that can be used to construct Elements with a CoffeeKup style syntax. The arguments to this function can be of any length, all but the last of which will be interpreted as attributes. The last argument will be the content if it is an array of Elements.
``` coffee
div = Utils.tag 'div'
span = Utils.tag 'span'
element = div id:'abc', class:'foo bar', style:'color: blue', [
		div class:'foo'
		span class:'bar'
	]
```
The resulting element will be:
``` html
<div id="abc" class="foo bar" style="color: blue">
	<div class="foo"></div>
	<span class="bar"></span>
</div>
``` 
### `Utils.div`
A shortcut for `Utils.tag 'div'`

### `Utils.span`
A shortcut for `Utils.tag 'span'`

### `Utils.cssClass(s)`
Converts string s for use in a css class attribute, by first lowering case, then replacing spaces with dashes.

### `Utils.delay(n, f)`
A convenience method to reverse the order of arguments in `setTimeout` such that it's more palatable to use in CoffeeScript.
Instead of:
``` coffee
Meteor.setTimeout ->
	# do something
, 1000
```
Now use:
``` coffee
Utils.delay 1000, -> #do something
```

### `Utils.capitalize(s)`
Capitalize the string s

### `Utils.singular(s)`
Remove the trailing 's' if it exists

### `Utils.plural(s)`
Add a trailing 's' if it doesn't exist

### `Utils.pluralize(n, s)`
Based on the plurality of the number n, pluralize or singularize string s

### `Utils.log(...)`
Pass the arguments to `console.log` and return the last argument. Useful for logging values inside chained function calls.
``` coffee
# to look inside a chain of calls like:
_.uniq _.map array, (n) -> n**2
# use Utils.log:
_.uniq Utils.log 'mapped array', _.map array, (n) -> n**2
```

### `Utils.keys`
An object with some common keycodes like space, enter and shift. Suitable for use in event handlers like `keyup`.

### `Utils.colors`
Hex color codes for some common colors.

### `Utils.spellNumber(n)`
If the number is less than 10, it is spelled in letters like "five". If not, the argument is returned.




