tests - composition
testComposeDestAtop

	drawOptions composeDestAtop.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DEST_ATOP