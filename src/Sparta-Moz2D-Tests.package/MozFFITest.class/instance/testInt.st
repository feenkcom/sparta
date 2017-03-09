tests
testInt

	self assert: (self primInt: self primIntMin) equals: self primIntMin.
	self assert: (self primInt: 0) equals: 0.
	self assert: (self primInt: self primIntMax) equals: self primIntMax