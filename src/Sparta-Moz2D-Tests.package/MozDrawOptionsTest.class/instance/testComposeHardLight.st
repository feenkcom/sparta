tests - composition
testComposeHardLight

	drawOptions composeHardLight.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_HARD_LIGHT