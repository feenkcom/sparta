tests
testLong

	self assert: (self primLong: self primLongMin) equals: self primLongMin.
	self assert: (self primLong: 0) equals: 0.
	self assert: (self primLong: self primLongMax) equals: self primLongMax