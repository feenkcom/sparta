tests
testInt16

	self assert: (self primInt16: self primInt16Min) equals: self primInt16Min.
	self assert: (self primInt16: 0) equals: 0.
	self assert: (self primInt16: self primInt16Max) equals: self primInt16Max