tests - composition
testComposeDarken

	drawOptions composeDarken.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DARKEN