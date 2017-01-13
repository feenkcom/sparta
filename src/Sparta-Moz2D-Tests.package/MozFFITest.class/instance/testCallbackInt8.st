tests
testCallbackInt8

	self
		assert: (self primCall: self callbackInt8 int8: self primInt8Min)
		equals: self primInt8Min.
	
	self
		assert: (self primCall: self callbackInt8 int8: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackInt8 int8: self primInt8Max)
		equals: self primInt8Max