tests
testBEVEL
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum BEVEL item asString) value
		equals: self enum BEVEL value