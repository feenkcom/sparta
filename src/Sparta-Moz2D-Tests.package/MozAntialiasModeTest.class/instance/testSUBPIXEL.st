tests
testSUBPIXEL
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SUBPIXEL item asString) value
		equals: self enum SUBPIXEL value