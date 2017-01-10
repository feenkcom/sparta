tests
testNV12
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum NV12 item asString) value
		equals: self enum NV12 value