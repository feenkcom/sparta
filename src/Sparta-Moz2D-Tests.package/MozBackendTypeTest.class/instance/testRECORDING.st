tests
testRECORDING
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum RECORDING item asString) value
		equals: self enum RECORDING value