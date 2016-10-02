initialization
initialize
	super initialize.

	start := 1.
	flags := 0.
	length := SmallInteger maxVal.
	width := SmallInteger maxVal.
	longestSubstring := 0.
	self spacing: 0.
	self breakPriority: MozTextBreakPriority eNormalBreak.
	self orientation: MozTextOrientation HORIZONTAL.

	self enableTextMetrics.
	self disableFontMetrics.
	self tightInkExtents.
	self suppressNoBreaks.
	self enableBoundingBox.
	self enableHyphenBreaks.
	self enableWordWrap.
	self enablePropertyProvider.
	self recordLastBreak.
	self recordUsedHyphenation.
	self excludeLineBreakBefore.
	self ignoreTrimmedWhitespace