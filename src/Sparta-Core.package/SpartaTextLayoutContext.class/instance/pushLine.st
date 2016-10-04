adding
pushLine
	| line spans |
	spans := spansStack asArray.
	self initializeForNewLine.

	line := SpartaTextLine spans: spans.
	layout addLine: line.
	
	accumulatedHeight := accumulatedHeight + line height