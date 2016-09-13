initialization
initialize
	super initialize.

	start := 0.
	flags := 0.
	length := SmallInteger maxVal.
	width := SmallInteger maxVal.
	self enableTextMetrics.
	self tightInkExtents.
	self suppressNoBreaks.
	self breakWordWrap.
	self enableBoundingBox.
	self enableHyphenBreaks.
	self enableSpacing.
	self enableWordWrap.
	self enablePropertyProvider.
	self recordLastBreak.
	self recordUsedHyphenation.
	self excludeLineBreakBefore.
	self ignoreTrimmedWhitespace