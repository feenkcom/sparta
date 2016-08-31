tests - composition
testComposeExclusion

	drawOptions composeExclusion.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_EXCLUSION