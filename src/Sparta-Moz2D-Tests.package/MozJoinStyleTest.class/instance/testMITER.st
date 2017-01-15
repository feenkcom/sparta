tests
testMITER
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum MITER item asString) value
		equals: self enum MITER value