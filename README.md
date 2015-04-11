# Less Coffee Meteor Boilerplate
If you're building your app with Coffee and Less, you might find these includes and utilities useful.

# Less imports
Import `all.import.less` or any one of the stylesheets like this:
``` less
@import '/packages/zhenya:boilerplate/all.import.less';
```

## all.import.less
Imports all the other less imports in this package

## for.import.less
Implements a for and foreach loop for LESS. More usage examples at [less.curious](https://github.com/seven-phases-max/less.curious/blob/master/articles/for-each.md).

``` less
@list: banana, apple, pear, potato, carrot, peach;

#foreach-usage {
    .for(@list); .-each(@value) {
        value: @value;
    }
}
```
``` less
#for-usage {
    .for(6); .-each(@i) {
        i: @i;
    }
}
```

## clearfix.import.less
Implements a basic clearfix method with a less function that applies the clearfix to any class of choice.
``` less
.clearfix(foo);
```
Applies clearfix to all `.foo` elements

## colors.import.less
Provides three functions to generate common color schemes.

#### `.colors();`
Gives access to the following variables:
``` less
@orange: #FF9933;
@darkblue: #0072B2;
@blue: #00A3FF;
@cyan: #47e9e9;
@red: #FF1924;
@green: #A8E30B;
@yellow: #FFEF36;
@pink: #ff6699;
@magenta: #FF00FF;
@violet: #9400D3;
@purple: #5C00EA;
```

#### `.complementary(@base: #108ee3, @shade: 20%);`
Create a five color complementary color scheme with `@base` as the root color. Colors are accessible using `@one`, `@two`, `@three`, `@four`, and `@five`. `@shade` is used to generate secondary colors from the first two by lighten and desaturate.

#### `.triad(@base: #108ee3, @shade: 20%);`
Create a five color triad color scheme with `@base` as the root color. Colors are accessible using `@one`, `@two`, `@three`, `@four`, and `@five`. `@shade` is used to generate secondary colors from the second two by lighten and desaturate.

## shades.import.less
Provides a function to generate seven shades and tints between a specific light and a dark color. Helpful for generating a tinted set of shades.

#### `.shades(@w: #fff, @b: #000)`
Gives access to:
``` less
@white: @w;
@light: mix(@w, @b, 96%);
@lightgray: mix(@w, @b, 85%);
@gray: mix(@w, @b, 60%);
@darkgray: mix(@w, @b, 30%);
@dark: mix(@w, @b, 10%);
@black: @b;
```
## Color preview
To test your available colors, call the templates `{{>_colors}}` and `{{>_shades}}` anywhere to see color swatches.

## reset.import.less
Provides a basic CSS reset useful for building full screen apps.
``` less
// call this somewhere in your project less
.reset()
```

## Debug CSS
Unless `Meteor.settings.public.debugCss == false`, pressing `Ctrl+~` (Control + tilde) will show outlines on all dom elements making it easier to inspect structure and CSS problems at a glance.

# Utils
Defines (or extends) a global utility `Utils`:

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
array = [0..2]
_.uniq _.map array, (n) -> n**2
# use Utils.log:
_.uniq Utils.log 'mapped array', _.map array, (n) -> Utils.log 'element', n**2
```
Output:
```
element 0
element 1
element 4
mapped array [0, 1, 4]
```

### `Utils.randomString(prefix, order)`
Generates a random string of numbers of length `order` and prefixed with `prefix`

### `Utils.mobilizeEvents(eventMap)`
A cheap trick to replace all `click` handlers with `touchend` in case touch is supported. Useful in `Template.<template>.events()` calls to avoid click emulation on mobile devices.

### `Utils.keys`
An object with some common keycodes like space, enter and shift. Suitable for use in event handlers like `keyup`.
``` coffee
Utils.keys =
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
```

### `Utils.colors`
Hex color codes for some common colors.
``` coffee
Utils.colors =
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
```

### `Utils.spellNumber(n)`
If the number is less than 10, it is spelled in letters like "five". If not, the argument is returned.

# Helpers
The following template helpers are registered globally
### `{{key_value obj}}`
Decomposes `obj` into an array with objects that each have keys `key` and `value`. Useful for decomposing objects or arrays to retrieve keys or indices.

### `{{currentRoute}}`
Iron router's `Router.current()`

### `{{session "key"}}`
Returns `Session.get("key")`

### `{{pluralize n s}}` 
Same as `Utils.pluralize()`

### `{{singular s}}`
Same as `Utils.singular()`

### `{{plural s}}`
Same as `Utils.plural()`

### `{{capitalize s}}`
Same as `Utils.capitalize()`

### `{{cssClass s}}`
Same as `Utils.cssClass()`

### `{{spellNumber n}}`
Same as `Utils.spellNumber()`


