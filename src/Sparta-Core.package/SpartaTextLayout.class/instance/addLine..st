adding
addLine: aLine
	lines add: aLine.
	aLine baseline: 0@(height + aLine ascent).
	width := width max: aLine width.
	height := height + aLine height