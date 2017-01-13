tests
testCallbackUIntptr
	
	self
		assert: (self primCall: self callbackUIntptr uintptr: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUIntptr uintptr: self primUIntptrMax)
		equals: self primUIntptrMax