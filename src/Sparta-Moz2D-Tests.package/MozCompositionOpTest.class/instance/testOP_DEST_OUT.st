tests
testOP_DEST_OUT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_DEST_OUT item asString) value
		equals: self enum OP_DEST_OUT value