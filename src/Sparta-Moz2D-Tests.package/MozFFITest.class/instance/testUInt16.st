tests
testUInt16

	self assert: (self primUInt16: 0) equals: 0.
	self assert: (self primUInt16: self primUInt16Max) equals: self primUInt16Max