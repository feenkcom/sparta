initialization
rope: aRope segment: aSpanRope start: aStart end: anEnd from: aTextFrom to: aTextTo metrics: aMetrics textRun: aTextRun attributes: theAttributes
	rope := aRope.
	spanRope := aSpanRope.
	start := aStart.
	end := anEnd.
	from := aTextFrom.
	to := aTextTo.
	length := anEnd - aStart + 1.
	box := aMetrics textMetrics bounds.
	"actual ascent consists not only from font ascent but also from fallback fonts ascent (box top abs)"
	ascent := box top abs max: aMetrics fontMetrics emAscent.
	descent := box bottom abs max: aMetrics fontMetrics emDescent.
	width := aMetrics textMetrics advance.
	strikethroughOffset := aMetrics fontMetrics strikeoutOffset.
	strikethroughSize := aMetrics fontMetrics strikeoutSize.
	height := ascent + descent.
	textRun := aTextRun.
	attributes := theAttributes