tests
testCAIRO_CONTEXT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CAIRO_CONTEXT item asString) value
		equals: self enum CAIRO_CONTEXT value