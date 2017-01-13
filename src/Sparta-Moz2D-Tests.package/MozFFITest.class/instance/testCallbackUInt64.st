tests
testCallbackUInt64
	<expectedFailure> "bug in FFI"
		
	self
		assert: (self primCall: self callbackUInt64 uint64: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUInt64 uint64: self primUInt64Max)
		equals: self primUInt64Max