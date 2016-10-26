adding
pushLine
	| line spans |
	spans := spansStack asArray.
	self initializeForNewLine.

	line := SpTextLineSegment rope: rope spans: spans.
	lines add: line.
	
	accumulatedHeight := accumulatedHeight + line height