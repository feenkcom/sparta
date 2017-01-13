tests
testInt32

	self assert: (self primInt32: self primInt32Min) equals: self primInt32Min.
	self assert: (self primInt32: 0) equals: 0.
	self assert: (self primInt32: self primInt32Max) equals: self primInt32Max