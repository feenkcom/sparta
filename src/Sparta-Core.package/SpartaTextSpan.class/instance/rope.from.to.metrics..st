initialization
rope: aRope from: aStart to: anEnd metrics: aMetrics
	rope := aRope.
	start := aStart.
	end := anEnd.
	box := aMetrics textMetrics boundingBox.
	ascent := aMetrics fontMetrics maxAscent.
	descent := aMetrics fontMetrics maxDescent.
	width := aMetrics textMetrics advanceWidth.
	height := ascent + descent.