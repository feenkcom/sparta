private - ffi
primMeasureAndBreak: aTextRun start: aStart maxLength: aMaxLength lineBreakBefore: aLineBreakBefore width: aWidth propertyProvider: aProvider suppressBreak: aSuppressBreak trimWhitespace: aTrimWhitespace metrics: aMetrics boundingBoxType: aBoundingBoxType canvas: aCanvas usedHyphenation: aUsedHyphenation lastBreak: aLastBreak canWordWrap: aCanWordWrap breakPriority: aBreakPriorityPointer

	^ self ffiCall: #(uint32 moz2d_text_run_break_and_measure (
		MozTextRun aTextRun,
		uint32 aStart,
		uint32 aMaxLength,
		bool aLineBreakBefore,
		double aWidth,
		MozTextPropertyProvider aProvider,
		MozTextSuppressBreak aSuppressBreak,
		ExternalAddress aTrimWhitespace,
		MozTextMetrics aMetrics,
		MozTextBoundingBoxType aBoundingBoxType,
		MozCanvas aCanvas,
		ExternalAddress aUsedHyphenation,
		ExternalAddress aLastBreak,
		bool aCanWordWrap,
		ExternalAddress aBreakPriorityPointer))