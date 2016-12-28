accessing
hyphenationBreaksWithin: anInterval in: anArray
	"Detect hyphenation break opportunities in the given range.
	Breaks not at cluster boundaries will be ignored."
	| aPrevChar anIterator |
	
	self
		assert: [ self textRun isNotNil ]
		description: [ 'Text run must not be nil' ].
	
	aPrevChar := nil.
	anIterator := self textRun iterator.
	anIterator skipUnits: anInterval first - 1.
	
	anInterval withIndexDo: [ :aTextRunIndex :anArrayIndex |
		| aChar shouldBreak |
		aChar := anIterator nextUnit.
		shouldBreak := aChar = Character space or: [ aPrevChar = $- ].
		aPrevChar := aChar.
		anArray at: anArrayIndex put: shouldBreak ]