tests
testDEFAULT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum DEFAULT item asString) value
		equals: self enum DEFAULT value