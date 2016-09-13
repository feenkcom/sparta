measurement
measureOn: aTextPainter with: aPropertyProvider
	|metrics breakPriority breakPriorityPointer |
	metrics := MozTextMetrics new.
	breakPriority := aTextPainter breakPriority.
	breakPriorityPointer := ExternalAddress allocate: (FFIUInt32 externalTypeSize).
	breakPriorityPointer unsignedLongAt: 1 put: breakPriority value.

	self
		primMeasureAndBreakMetrics: metrics
		start: 0
		maxLength: SmallInteger maxVal
		lineBreakBefore: false
		width: 100
		boundingBoxType: MozTextBoundingBoxType TIGHT_INK_EXTENTS
		canvas: aTextPainter canvas
		propertyProvider: aPropertyProvider
		canWordWrap: true
		breakPriority: breakPriorityPointer.

	^ metrics