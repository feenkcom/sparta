I am an abstract text layout. My main role is to measure a rope of text according to given additional properties or constraints and prepare it for rendering.

The most important properties are maximal width and height. Maximal width is used to wrap a line of text in multiple lines while maximal height prevents text from exceeding an element's boundaries.

Once measurement is done users may ask for computed text extent by sending #extent message.
The measured text layout can be rendered on SpartaCanvas by sending #renderOn: with canvas as argument to me.

Public API and Key Messages

- rope:properties: initialize me with text rope and additional properties
- measureOn: measure given rope using provided sparta canvas
- extent - return measured text extent
- width - return measured text width
- height - return measured text height
- renderOn: render text layout on given canvas
 
Internal Representation and Key Implementation Points.

    Instance Variables
	rope:		<SpRope>
	maxHeight:		<Number>
	maxWidth:		<Number>
	height:		<Number>
	width:		<Number>
	end:		<Number>
	autoRelease:		<Boolean>

    Implementation Points