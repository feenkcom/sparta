tests - composition
testComposeDestOut

	drawOptions composeDestOut.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DEST_OUT