asserting
assertPixel: aPoint color: aColor
	self assert: (self form colorAt: aPoint) equals: aColor