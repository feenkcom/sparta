tests
testOP_OUT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_OUT item asString) value
		equals: self enum OP_OUT value