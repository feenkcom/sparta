measurement
measureTextRun: aTextRun
	|result breakPriorityPointer|
	
	breakPriorityPointer := ExternalAddress allocate: (FFIUInt32 externalTypeSize).
	breakPriorityPointer unsignedLongAt: 1 put: breakPriority value.

	result := self
		primMeasureAndBreak: aTextRun
		start: start
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
		canWordWrap: canWordWrap
		breakPriority: breakPriorityPointer.
		
	^ result