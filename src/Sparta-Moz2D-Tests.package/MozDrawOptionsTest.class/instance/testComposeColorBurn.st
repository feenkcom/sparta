tests - composition
testComposeColorBurn

	drawOptions composeColorBurn.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_COLOR_BURN