tests
testTABLE_TRANSFER
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum TABLE_TRANSFER item asString) value
		equals: self enum TABLE_TRANSFER value