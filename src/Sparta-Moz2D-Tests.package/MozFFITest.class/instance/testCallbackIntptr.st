tests
testCallbackIntptr
	<expectedFailure> "bug in FFI"

	self
		assert: (self primCall: self callbackIntptr intptr: self primIntptrMin)
		equals: self primIntptrMin.
	
	self
		assert: (self primCall: self callbackIntptr intptr: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackIntptr intptr: self primIntptrMax)
		equals: self primIntptrMax