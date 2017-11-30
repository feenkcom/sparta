tests
testOP_CLEAR
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_CLEAR item asString) value
		equals: self enum OP_CLEAR value