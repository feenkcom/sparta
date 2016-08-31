tests - composition
testComposeOverlay

	drawOptions composeOverlay.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_OVERLAY