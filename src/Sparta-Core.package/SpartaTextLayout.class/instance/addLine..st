adding
addLine: aLine
	lines add: aLine.
	width := width max: aLine width.
	height := height + aLine height