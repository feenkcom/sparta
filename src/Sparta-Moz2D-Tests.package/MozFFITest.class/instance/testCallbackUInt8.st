tests
testCallbackUInt8
	
	self
		assert: (self primCall: self callbackUInt8 uint8: 0)
		equals: 0.
	
	self
		assert: (self primCall: self callbackUInt8 uint8: self primUInt8Max)
		equals: self primUInt8Max