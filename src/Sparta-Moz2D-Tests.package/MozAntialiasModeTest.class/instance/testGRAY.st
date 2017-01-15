tests
testGRAY
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum GRAY item asString) value
		equals: self enum GRAY value