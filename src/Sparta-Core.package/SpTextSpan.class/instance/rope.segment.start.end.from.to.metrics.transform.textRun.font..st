initialization
rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics transform: aSpartaMatrix textRun: aTextRun font: aFont
	rope := aRope.
	spanRope := aSpanRope.
	start := aStart.
	end := anEnd.
	from := aTextFrom.
	to := aTextTo.
	length := anEnd - aStart + 1.
	box := aSpartaMatrix localBoundsToGlobal: aMetrics textMetrics boundingBox.
	ascent := aSpartaMatrix transformX: aMetrics fontMetrics emAscent.
	descent := aSpartaMatrix transformX: aMetrics fontMetrics maxDescent.
	width := (aSpartaMatrix transformX: (aMetrics textMetrics advanceWidth)) + aSpartaMatrix translation x.
	height := ascent + descent.
	transformation := aSpartaMatrix.
	metrics := aMetrics.
	textRun := aTextRun.
	font := aFont.
	
	self
		assert: [ aTextRun isNull not ]
		description: [ 'Text run must not be nullptr' ].