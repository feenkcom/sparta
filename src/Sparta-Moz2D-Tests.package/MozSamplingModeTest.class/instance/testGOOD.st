tests
testGOOD
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum GOOD item asString) value
		equals: self enum GOOD value