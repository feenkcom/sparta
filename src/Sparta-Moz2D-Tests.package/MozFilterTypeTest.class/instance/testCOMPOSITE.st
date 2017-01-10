tests
testCOMPOSITE
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum COMPOSITE item asString) value
		equals: self enum COMPOSITE value