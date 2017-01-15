tests
testREPEAT_Y
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum REPEAT_Y item asString) value
		equals: self enum REPEAT_Y value