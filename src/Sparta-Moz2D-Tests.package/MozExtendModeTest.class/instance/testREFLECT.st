tests
testREFLECT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum REFLECT item asString) value
		equals: self enum REFLECT value