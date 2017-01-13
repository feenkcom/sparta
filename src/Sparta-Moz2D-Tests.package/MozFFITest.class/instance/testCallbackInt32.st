tests
testCallbackInt32

	self
		assert: (self primCall: self callbackInt32 int32: self primInt32Min)
		equals: self primInt32Min.
	
	self
		assert: (self primCall: self callbackInt32 int32: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackInt32 int32: self primInt32Max)
		equals: self primInt32Max