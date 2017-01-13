tests
testInt64

	self assert: (self primInt64: self primInt64Min) equals: self primInt64Min.
	self assert: (self primInt64: 0) equals: 0.
	self assert: (self primInt64: self primInt64Max) equals: self primInt64Max