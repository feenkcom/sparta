accessing - metrics
trimmedWhiteSpace
	"Return the width of the trimmed spaces will be returned in aTrimWhitespace."
	^ trimWhitespace isNull
		ifTrue: [ 0 ]
		ifFalse: [ trimWhitespace doubleAt: 1 ]