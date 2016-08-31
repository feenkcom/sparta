tests - composition
testComposeLighten

	drawOptions composeLighten.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_LIGHTEN