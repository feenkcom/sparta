tests
testCallbackLong
	<expectedFailure> "bug in FFI"

	self
		assert: (self primCall: self callbackLong long: self primLongMin)
		equals: self primLongMin.
	
	self
		assert: (self primCall: self callbackLong long: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackLong long: self primLongMax)
		equals: self primLongMax