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
A convenience method to reverse the order of arguments in `setTimeout` such that it's more palateable to use in CoffeeScript.
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

### `Utils.keys`
An object with some common keycodes like space, enter and shift. Suitable for use in event handlers like `keyup`.

### `Utils.colors`
Hex color codes for some common colors.

### `Utils.spellNumber(n)`
If the number is less than 10, it is spelled in letters like "five". If not, the argument is returned.




