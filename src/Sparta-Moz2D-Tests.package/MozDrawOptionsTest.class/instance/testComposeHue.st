tests - composition
testComposeHue

	drawOptions composeHue.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_HUE