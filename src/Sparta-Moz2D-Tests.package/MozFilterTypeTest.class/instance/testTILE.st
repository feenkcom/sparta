tests
testTILE
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum TILE item asString) value
		equals: self enum TILE value