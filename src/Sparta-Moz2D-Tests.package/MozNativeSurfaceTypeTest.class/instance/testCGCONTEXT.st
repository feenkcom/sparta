tests
testCGCONTEXT
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CGCONTEXT item asString) value
		equals: self enum CGCONTEXT value