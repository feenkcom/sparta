tests
testSENTINEL
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SENTINEL item asString) value
		equals: self enum SENTINEL value