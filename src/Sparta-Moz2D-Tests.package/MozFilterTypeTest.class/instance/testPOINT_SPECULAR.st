tests
testPOINT_SPECULAR
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum POINT_SPECULAR item asString) value
		equals: self enum POINT_SPECULAR value