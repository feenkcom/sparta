measurement
measureTextRun: aTextRun
	| breakPriorityPointer |
	
	breakPriorityPointer := ExternalAddress allocate: (FFIUInt32 externalTypeSize).
	breakPriorityPointer unsignedLongAt: 1 put: breakPriority value.

	longestSubstring := self
		primMeasure: aTextRun
		start: start - 1
		length: length
		breakBefore: lineBreakBefore
		width: width
		provider: propertyProvider
		suppress: suppressBreaks
		whitespace: trimWhitespace
		metrics: textMetrics
		boxType: boxType
		canvas: canvas
		hyphen: usedHyphenation
		lastBreak: lastBreak
		wordWrap: (breakPriority canWrapWord and: [ canWordWrap ])
		breakPriority: breakPriorityPointer.

	fontMetrics isNull ifFalse: [ self primFontMetrics: fontMetrics textRun: aTextRun ].
	^ longestSubstring