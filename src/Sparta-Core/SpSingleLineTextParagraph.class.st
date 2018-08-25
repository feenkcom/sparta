Class {
	#name : #SpSingleLineTextParagraph,
	#superclass : #SpTextLayout,
	#instVars : [
		'spans'
	],
	#category : 'Sparta-Core-Text-Rendering'
}

{ #category : #finalization }
SpSingleLineTextParagraph >> finalize [

	spans ifNotNil: [ :theSpans |
		theSpans do: [ :aSpan | aSpan finalize ] ].
	spans := nil
]

{ #category : #'initialize-release' }
SpSingleLineTextParagraph >> initializeSpan: aSpan on: aCanvas with: aContext [
	| attributes aTextPainter aLength aStart aTransformation anInvertedTransformation aMetricsProvider aTextRun aMetrics |
	self
		assert: [ aSpan isNotEmpty ]
		description: [ 'Span must be non-empty!' ].
	aTransformation := self class matrix loadIdentity.
	attributes := aSpan attributes.
	attributes
		do:
			[ :attribute | attribute applyOnSpartaMatrix: aTransformation with: aSpan ].

	"Only compute inverted matrix if we actually have custom transformation"
	anInvertedTransformation := aTransformation isIdentity
		ifTrue: [ aTransformation := nil ]
		ifFalse: [ aTransformation inverted ].
	"nil transform and inverted transform means that we don't have any transformation.
		Please note, that this is done to prevent unneseccary object creation and not needed
		garbage collection in the future. Text measurement must be optimized as much as possible
		in terms of object creation. It is also important to mention that a single text editor
		expanded on full screen may contain a few thousands of small text pieces where each of them
		own a text layout. It means that with such a simple optimization we prevent many thousands
		of matrix objects from being created and later garbage collected. Worth it!"
	aTextPainter := self createPainter: aSpan on: aCanvas.
	"Since I am a single line layout we want to force disable breaks in order
	to prevent hyphenation computations which is rather slow"
	aTextPainter breakNone.
	aMetrics := aTextPainter metrics.
	aMetricsProvider := aTextPainter metricsProvider.
	aTextRun := aTextPainter textRun.
	self wantsAutoRelease
		ifTrue: [ aTextRun autoRelease ].

	"Length is amount of glyphs, not characters!"
	aLength := aTextRun length.
	self
		assert: [ aTextRun isNull not ]
		description: [ 'Created text run must not be nullptr' ].
	aTextRun metricsProvider: aMetricsProvider.
	aStart := 1.
	[ aStart <= aLength and: [ aContext availableWidth > 0 ] ]
		whileTrue: [ | span anEnd aMaxWidth |
			"compute width limit based on existance of custom transformation"
			aMaxWidth := (aTransformation isNil
				or: [ anInvertedTransformation isNil ])
				ifTrue: [ aContext availableWidth ]
				ifFalse: [ (anInvertedTransformation transformX: aContext availableWidth)
						- aTransformation translation x ].
			aMetrics width: aMaxWidth.
			aMetrics start: aStart.
			aMetricsProvider measure: aTextRun in: aMetrics.
			anEnd := aMetrics wrappedEnd.
			"to can be less than from, meaning that there are no fully visible characters that fit in available width"
			anEnd < aStart
				ifTrue: [ aMetrics width: Float infinity.
					aMetrics length: aStart - aMetrics start + 1.
					aMetricsProvider measure: aTextRun in: aMetrics.
					anEnd := aMetrics wrappedEnd ].
			span := (aTransformation isNil
				or: [ anInvertedTransformation isNil ])
				ifTrue: [ SpTextSpan
						rope: rope
						segment: aSpan
						start: aStart
						end: anEnd
						from: aContext position
						to: aContext position + (anEnd - aStart)
						metrics: aMetrics
						textRun: aTextRun
						attributes: attributes	"should be in string buffer coordinates (respecting 1 vs 2 vs 4 bits per character)"	"should be in string buffer coordinates (respecting 1 vs 2 vs 4 bits per character)" ]
				ifFalse: [ SpTextSpan
						rope: rope
						segment: aSpan
						start: aStart
						end: anEnd
						from: aContext position
						to: aContext position + (anEnd - aStart)
						metrics: aMetrics
						transform: aTransformation
						transformInverted: anInvertedTransformation
						textRun: aTextRun
						attributes: attributes	"should be in string buffer coordinates (respecting 1 vs 2 vs 4 bits per character)"	"should be in string buffer coordinates (respecting 1 vs 2 vs 4 bits per character)" ].
			aContext pushSpan: span.
			aStart := anEnd + 1 ].
	aContext pushPosition: aStart - 1 - aLength
]

{ #category : #measuring }
SpSingleLineTextParagraph >> measureOn: aCanvas [
	"Measure and create lines with text spans from provided rope
	based on attributes and layout properties (maximum width / height)"
	| anIterator aContext |

	aContext := SpSingleLineTextLayoutContext new.
	aContext rope: rope.
	aContext maxWidth: maxWidth.
	aContext maxHeight: maxHeight.

	anIterator := rope iterator: 1 to: rope size.
	[ anIterator hasNext ] whileTrue: [ 
		| aSpan |
		"If we pass while-check we definitely moved to the next line,
		so can do the same with position"
		aContext movePosition: anIterator position.
		aSpan := anIterator nextSpan.
		self initializeSpan: aSpan on: aCanvas with: aContext ].

	height := 0.
	width := 0.
	aContext spans do: [ :aSpan |
		aSpan baseline: width @ (height + aSpan ascent).
		height := height max: aSpan height.
		width := width + aSpan width ].

	spans := aContext spans asArray.
	end := aContext position
]

{ #category : #rendering }
SpSingleLineTextParagraph >> rendererOn: aCanvas [
	| renderer |
	spans ifNil: [ self measureOn: aCanvas ].
	renderer := SpSingleLineTextRenderer new layout: self.
	^ renderer
]

{ #category : #initialization }
SpSingleLineTextParagraph >> reset [
	super reset.
	
	spans := nil
]

{ #category : #accessing }
SpSingleLineTextParagraph >> spans [
	^ spans
]
