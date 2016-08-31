tests - composition
testCompositionOperator
	"Smoke test to make sure that all possible composition operators are settable"
	|operators|
	
	operators := MozCompositionOp enumerationDictionary
		collect: [ :i | MozCompositionOp fromInteger: i ].

	operators do: [ :operator |
		drawOptions compositionOperator: operator.
		self assert: drawOptions compositionOperator equals: operator ]