tests
testOP_DEST_IN
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_DEST_IN item asString) value
		equals: self enum OP_DEST_IN value