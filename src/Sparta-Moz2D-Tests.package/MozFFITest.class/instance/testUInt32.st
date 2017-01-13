tests
testUInt32

	self assert: (self primUInt32: 0) equals: 0.
	self assert: (self primUInt32: self primUInt32Max) equals: self primUInt32Max