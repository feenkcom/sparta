adding
pushSpan: aSpan
	spansStack addLast: aSpan.
	accumulatedWidth := accumulatedWidth + aSpan width.
	isSplitted := aSpan isSplitted