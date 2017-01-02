private - ffi
primMeasure: aTextRun start: aStart length: aMaxLength breakBefore: aLineBreakBefore width: aWidth provider: aProvider suppress: aSuppressBreak whitespace: aTrimWhitespace metrics: aMetrics boxType: aBoundingBoxType canvas: aCanvas hyphen: aUsedHyphenation lastBreak: aLastBreak wordWrap: aCanWordWrap breakPriority: aBreakPriorityPointer

	^ self ffiCall: #(uint32 moz2d_text_run_break_and_measure (
		MozTextRun aTextRun,
		uint32 aStart,
		uint32 aMaxLength,
		bool aLineBreakBefore,
		double aWidth,
		MozTextPropertyProvider aProvider,
		MozTextSuppressBreak aSuppressBreak,
		ExternalAddress aTrimWhitespace,
		MozNativeTextMetrics aMetrics,
		MozTextBoundingBoxType aBoundingBoxType,
		MozCanvas aCanvas,
		ExternalAddress aUsedHyphenation,
		ExternalAddress aLastBreak,
		bool aCanWordWrap,
		ExternalAddress aBreakPriorityPointer))