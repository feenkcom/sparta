tests
testCallbackInt16

	self
		assert: (self primCall: self callbackInt16 int16: self primInt16Min)
		equals: self primInt16Min.
	
	self
		assert: (self primCall: self callbackInt16 int16: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackInt16 int16: self primInt16Max)
		equals: self primInt16Max