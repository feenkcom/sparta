tests
testSQUARE
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SQUARE item asString) value
		equals: self enum SQUARE value