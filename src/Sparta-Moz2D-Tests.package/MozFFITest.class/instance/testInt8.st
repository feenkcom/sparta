tests
testInt8

	self assert: (self primInt8: self primInt8Min) equals: self primInt8Min.
	self assert: (self primInt8: 0) equals: 0.
	self assert: (self primInt8: self primInt8Max) equals: self primInt8Max