measurement
measure: aTextRun in: aMetrics

	self
		assert: [ aTextRun isNotNil ]
		description: [ 'Text run to measure must not be nil' ].

	"We measure text only if it is requested"
	aMetrics measureText ifTrue: [
		| aBreakPriorityPointer aPropertyProvider aStart aLength aWidth aLineBreakBefore aSpacing aBreakPriority aBoxType aCanvas aWordWrap aSuppressBreaks aWrappedLength |

		"In C++ array index starts from 0"
		aStart := (aMetrics start - 1) max: 0.
		aLength := aMetrics length min: 4294967295. "limit to max of uint32"
		aWidth := aMetrics width.
		aLineBreakBefore := aMetrics lineBreakBefore.
		aBreakPriority := aMetrics breakPriority.
		aSuppressBreaks := aMetrics suppressBreaks.
		aSpacing := aMetrics spacing.
		aBoxType := aMetrics boxType.
		aCanvas := aMetrics canvas.
		aWordWrap := aBreakPriority canWrapWord.

		aBreakPriorityPointer := ExternalAddress allocate: FFIUInt32 externalTypeSize.
		aBreakPriorityPointer unsignedLongAt: 1 put: aBreakPriority value.

		"Choose which property provider we want to use. Users may provide
		a custom property provider in the request.
		If it is not provided we use default one"
		aPropertyProvider := aMetrics propertyProvider.
		aPropertyProvider ifNil: [ aPropertyProvider := propertyProvider ].

		self
			assert: [ aPropertyProvider isNotNil ]
			description: [ 'Property provider used for measurement must not be nil!' ].

		"Next we need to pre-configure property provider according to request"
		aPropertyProvider spacing: aSpacing.
		aPropertyProvider breakPriority: aBreakPriority.
		aPropertyProvider textRun: aTextRun.
		
		aWrappedLength := self
			primMeasure: aTextRun
			s: aStart
			l: aLength
			b: aLineBreakBefore
			w: aWidth
			p: aPropertyProvider
			s: aSuppressBreaks
			w: trimWhitespace
			m: textMetrics "computed text metrics will be loaded in textMetrics"
			b: aBoxType
			c: aCanvas
			h: usedHyphenation
			l: lastBreak
			w: aWordWrap
			b: aBreakPriorityPointer.
		
		"text run is measured, clean state"
		aPropertyProvider textRun: nil.
		aBreakPriorityPointer free.
	
		aMetrics wrappedLength: aWrappedLength.
		aMetrics textMetrics: textMetrics asTextMetrics ].

	"We measure font only if it is requested"
	aMetrics measureFont ifTrue: [
		self primFontMetrics: fontMetrics textRun: aTextRun.
		aMetrics fontMetrics: fontMetrics asFontMetrics ]