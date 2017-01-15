tests
testREPEAT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum REPEAT item asString) value
		equals: self enum REPEAT value