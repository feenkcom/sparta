tests
testIntptr

	self assert: (self primIntptr: self primIntptrMin) equals: self primIntptrMin.
	self assert: (self primIntptr: 0) equals: 0.
	self assert: (self primIntptr: self primIntptrMax) equals: self primIntptrMax