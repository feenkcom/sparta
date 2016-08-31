tests - default
testDefault
	|defaultOptions newOptions |

	defaultOptions := MozDrawOptions cleanUp; default.
	newOptions := MozDrawOptions new.
	
	self assert: defaultOptions alpha equals: 1.
	self assert: defaultOptions antialiasMode equals: MozAntialiasMode DEFAULT.
	self assert: defaultOptions compositionOperator equals: MozCompositionOp OP_OVER.

	self assert: defaultOptions equals: newOptions.
	self assert: defaultOptions hash equals: newOptions hash