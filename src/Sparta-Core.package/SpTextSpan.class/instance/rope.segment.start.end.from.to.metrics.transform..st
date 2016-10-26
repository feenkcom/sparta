initialization
rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics transform: aSpartaMatrix
	rope := aRope.
	spanRope := aSpanRope.
	start := aStart.
	end := anEnd.
	from := aTextFrom.
	to := aTextTo.
	length := anEnd - aStart + 1.
	box := aSpartaMatrix localBoundsToGlobal: aMetrics textMetrics boundingBox.
	ascent := aSpartaMatrix transformX: aMetrics fontMetrics maxAscent.
	descent := aSpartaMatrix transformX: aMetrics fontMetrics maxDescent.
	width := (aSpartaMatrix transformX: (aMetrics textMetrics advanceWidth)) + aSpartaMatrix translation x.
	height := ascent + descent.