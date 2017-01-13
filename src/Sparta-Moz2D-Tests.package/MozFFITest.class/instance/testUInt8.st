tests
testUInt8

	self assert: (self primUInt8: 0) equals: 0.
	self assert: (self primUInt8: self primUInt8Max) equals: self primUInt8Max