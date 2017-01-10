tests
testHSV
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum HSV item asString) value
		equals: self enum HSV value