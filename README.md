# Less Coffee Meteor Boilerplate
If you're building your app with Coffee and Less, you might find these includes and utilities useful.

## utils.coffee
Defines (or extends) a global `Utils`:

### `Utils.tag(name)`
Returns a function that can be used to construct tags with a CoffeeKup style syntax.
``` coffee
div = Utils.tag 'div'
element = div id:'abc', class:'foo bar', style:'color: blue'
# element will be an instance of Element that represents
# <div id="abc" class="foo bar" style="color: blue"></div>
``` 

### `Utils.keys`
An object with some common keycodes like space, enter and shift. Suitable for use in event handlers like `keyup`.

### `Utils.colors`
Hex color codes for some common colors.

### 'Utils.spellNumber(n)'
If the number is less than 10, it is spelled in letters like "five". If not, the argument is returned.




