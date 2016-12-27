accessing
hyphenationBreaksWithin: anInterval in: anArray
	"Detect hyphenation break opportunities in the given range.
	Breaks not at cluster boundaries will be ignored."
	| aPrevChar |
	
	aPrevChar := nil.
	anInterval withIndexDo: [ :aStringIndex :anArrayIndex |
		| aChar shouldBreak |
		aChar := (self string at: aStringIndex).
		shouldBreak := aChar = Character space or: [ aPrevChar = $- ].
		aPrevChar := aChar.
		anArray at: anArrayIndex put: shouldBreak ]