tests
testUInt64

	self assert: (self primUInt64: 0) equals: 0.
	self assert: (self primUInt64: self primUInt64Max) equals: self primUInt64Max