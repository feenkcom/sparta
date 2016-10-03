measurement
measureTextRun: aTextRun
	| breakPriorityPointer |
	
	breakPriorityPointer := ExternalAddress allocate: (FFIUInt32 externalTypeSize).
	breakPriorityPointer unsignedLongAt: 1 put: breakPriority value.

	longestSubstring := self
		primMeasureAndBreak: aTextRun
		start: start - 1
		maxLength: length
		lineBreakBefore: lineBreakBefore
		width: width
		propertyProvider: propertyProvider
		suppressBreak: suppressBreaks
		trimWhitespace: trimWhitespace
		metrics: textMetrics
		boundingBoxType: boxType
		canvas: canvas
		usedHyphenation: usedHyphenation
		lastBreak: lastBreak
		canWordWrap: (breakPriority canWrapWord and: [ canWordWrap ])
		breakPriority: breakPriorityPointer.

	fontMetrics isNull ifFalse: [ self primFontMetrics: fontMetrics textRun: aTextRun ].
	^ longestSubstring