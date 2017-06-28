private - ffi
primMeasure: aTextRun s: aStart l: aMaxLength b: aLineBreakBefore w: aWidth p: aProvider s: aSuppressBreak w: aTrimWhitespace m: aMetrics b: aBoundingBoxType c: aCanvas h: aUsedHyphenation l: aLastBreak w: aCanWordWrap b: aBreakPriorityPointer
	"My orignal method name was:
	
	primMeasure: aTextRun start: aStart length: aMaxLength breakBefore: aLineBreakBefore width: aWidth provider: aProvider suppress: aSuppressBreak whitespace: aTrimWhitespace metrics: aMetrics boxType: aBoundingBoxType canvas: aCanvas hyphen: aUsedHyphenation lastBreak: aLastBreak wordWrap: aCanWordWrap breakPriority: aBreakPriorityPointer
	
	However, windows does not support long path, so we had to rename it to a shorter version...
	See http://forum.world.st/A-better-way-to-serialise-methods-td4952814.html
	"

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