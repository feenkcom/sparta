tests
testCAIRO
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CAIRO item asString) value
		equals: self enum CAIRO value