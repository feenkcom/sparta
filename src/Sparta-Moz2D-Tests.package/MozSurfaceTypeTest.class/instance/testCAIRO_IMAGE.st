tests
testCAIRO_IMAGE
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CAIRO_IMAGE item asString) value
		equals: self enum CAIRO_IMAGE value