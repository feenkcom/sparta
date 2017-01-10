tests
testMORPHOLOGY
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum MORPHOLOGY item asString) value
		equals: self enum MORPHOLOGY value