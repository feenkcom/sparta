tests - composition
testComposeSoftLight

	drawOptions composeSoftLight.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_SOFT_LIGHT