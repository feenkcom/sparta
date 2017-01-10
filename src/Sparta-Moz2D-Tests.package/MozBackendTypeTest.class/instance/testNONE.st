tests
testNONE
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum NONE item asString) value
		equals: self enum NONE value