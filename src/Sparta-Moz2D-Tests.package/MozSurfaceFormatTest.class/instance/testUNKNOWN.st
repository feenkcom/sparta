tests
testUNKNOWN
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum UNKNOWN item asString) value
		equals: self enum UNKNOWN value