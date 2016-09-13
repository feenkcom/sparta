accessing - metrics
usedHyphenation

	^ usedHyphenation isNull
		ifTrue: [ false ]
		ifFalse: [ usedHyphenation booleanAt: 1 ]