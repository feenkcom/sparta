tests - alpha
testAlpha

	drawOptions alpha: 0.
	self assert: drawOptions alpha equals: 0.
	drawOptions alpha: 0.0.
	self assert: drawOptions alpha equals: 0.0.
	
	drawOptions alpha: 1.0.
	self assert: drawOptions alpha equals: 1.
	drawOptions alpha: 1.0.
	self assert: drawOptions alpha equals: 1.0.

	drawOptions alpha: 0.5.
	self assert: drawOptions alpha equals: 0.5.
	drawOptions alpha: 0.5.
	self assert: drawOptions alpha equals: 0.5.