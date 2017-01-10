tests
testOP_ADD
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_ADD item asString) value
		equals: self enum OP_ADD value