tests
testOP_IN
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_IN item asString) value
		equals: self enum OP_IN value