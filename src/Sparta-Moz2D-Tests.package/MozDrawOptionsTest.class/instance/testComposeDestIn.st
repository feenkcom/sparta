tests - composition
testComposeDestIn

	drawOptions composeDestIn.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DEST_IN