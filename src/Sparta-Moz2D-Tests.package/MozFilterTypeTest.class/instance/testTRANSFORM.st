tests
testTRANSFORM
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum TRANSFORM item asString) value
		equals: self enum TRANSFORM value