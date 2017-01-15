tests
testREPEAT_X
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum REPEAT_X item asString) value
		equals: self enum REPEAT_X value