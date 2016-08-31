tests - composition
testComposeDestOver

	drawOptions composeDestOver.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DEST_OVER