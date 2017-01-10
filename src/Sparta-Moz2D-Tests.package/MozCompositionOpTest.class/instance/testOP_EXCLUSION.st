tests
testOP_EXCLUSION
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_EXCLUSION item asString) value
		equals: self enum OP_EXCLUSION value