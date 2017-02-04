drawing
fillString: aString withColor: aFillColor strokeColor: aStrokeColor
	| aTextRun |
	self
		assert: [ aString isNotNil ]
		description: [ 'String must not be nil' ].

	self
		assert: [ font isNotNil ]
		description: [ 'Font must not be nil' ].

	aTextRun := self textRun.
	
	self fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor.

	aTextRun release