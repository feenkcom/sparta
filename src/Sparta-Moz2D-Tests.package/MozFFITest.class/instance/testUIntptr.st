tests
testUIntptr

	self assert: (self primUIntptr: 0) equals: 0.
	self assert: (self primUIntptr: self primUIntptrMax) equals: self primUIntptrMax