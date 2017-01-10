tests
testDISPLACEMENT_MAP
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum DISPLACEMENT_MAP item asString) value
		equals: self enum DISPLACEMENT_MAP value