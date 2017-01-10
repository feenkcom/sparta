tests
testA8
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum A8 item asString) value
		equals: self enum A8 value