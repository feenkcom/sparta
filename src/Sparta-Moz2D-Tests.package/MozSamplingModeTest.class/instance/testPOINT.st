tests
testPOINT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum POINT item asString) value
		equals: self enum POINT value