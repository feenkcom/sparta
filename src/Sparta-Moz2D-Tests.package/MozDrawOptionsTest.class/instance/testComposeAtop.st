tests - composition
testComposeAtop

	drawOptions composeAtop.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_ATOP