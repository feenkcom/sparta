tests
testCallbackInt64
	<expectedFailure> "bug in FFI"

	self
		assert: (self primCall: self callbackInt64 int64: self primInt64Min)
		equals: self primInt64Min.
	
	self
		assert: (self primCall: self callbackInt64 int64: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackInt64 int64: self primInt64Max)
		equals: self primInt64Max