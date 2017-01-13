tests
testCallbackUInt32
	
	self
		assert: (self primCall: self callbackUInt32 uint32: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUInt32 uint32: self primUInt32Max)
		equals: self primUInt32Max