tests
testCLAMP
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CLAMP item asString) value
		equals: self enum CLAMP value