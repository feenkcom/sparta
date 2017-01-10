tests
testYUV
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum YUV item asString) value
		equals: self enum YUV value