tests
testOP_SOURCE
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_SOURCE item asString) value
		equals: self enum OP_SOURCE value