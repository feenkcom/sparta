tests
testCallbackUInt16
	
	self
		assert: (self primCall: self callbackUInt16 uint16: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUInt16 uint16: self primUInt16Max)
		equals: self primUInt16Max