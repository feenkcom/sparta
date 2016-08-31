tests - composition
testComposeColorDodge

	drawOptions composeColorDodge.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_COLOR_DODGE