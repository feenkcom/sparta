tests
testOP_COUNT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_COUNT item asString) value
		equals: self enum OP_COUNT value