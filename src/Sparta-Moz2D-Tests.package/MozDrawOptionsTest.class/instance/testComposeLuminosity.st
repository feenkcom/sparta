tests - composition
testComposeLuminosity

	drawOptions composeLuminosity.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_LUMINOSITY