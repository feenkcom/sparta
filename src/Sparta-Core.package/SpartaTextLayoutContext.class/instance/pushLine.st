adding
pushLine
	| line spans |
	spans := spansStack asArray.
	spansStack removeAll.
	accumulatedWidth := 0.
	
	line := SpartaTextLine spans: spans.
	layout addLine: line.
	
	accumulatedHeight := accumulatedHeight + line height