accessing
type: aSpartaFilter
	"Set a filter primitive type to be applied on the canvas.
	aSpartaFilter is created by canvas, see 'filters' protocol in SpartaCanvas.
	To learn more about filter primitives, please refer to
	https://www.w3.org/TR/SVG/filters.html.
	aSpartaFilter must not be nil"

	self
		assert: [ aSpartaFilter isNotNil ]
		description: [ 'Filter primitive must not be nil!' ].

	filter := aSpartaFilter