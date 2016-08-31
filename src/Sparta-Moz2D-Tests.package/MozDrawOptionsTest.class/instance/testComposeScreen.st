tests - composition
testComposeScreen

	drawOptions composeScreen.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_SCREEN