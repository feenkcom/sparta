tests
testSKIA
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SKIA item asString) value
		equals: self enum SKIA value