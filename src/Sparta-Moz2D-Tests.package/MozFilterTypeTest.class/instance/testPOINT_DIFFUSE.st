tests
testPOINT_DIFFUSE
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum POINT_DIFFUSE item asString) value
		equals: self enum POINT_DIFFUSE value