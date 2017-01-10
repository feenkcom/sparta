tests
testOP_COLOR
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum OP_COLOR item asString) value
		equals: self enum OP_COLOR value