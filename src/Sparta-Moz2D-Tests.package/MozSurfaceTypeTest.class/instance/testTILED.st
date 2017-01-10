tests
testTILED
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum TILED item asString) value
		equals: self enum TILED value