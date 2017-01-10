tests
testDATA
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum DATA item asString) value
		equals: self enum DATA value