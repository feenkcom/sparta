Class {
	#name : #SpMultilineTextLayout,
	#superclass : #SpTextLayout,
	#instVars : [
		'lines'
	],
	#category : 'Sparta-Core-Text-Rendering'
}

{ #category : #finalization }
SpMultilineTextLayout >> finalize [

	lines ifNotNil: [ :theLines |
		theLines do: [ :aLine | aLine finalize ] ].
	lines := nil
]

{ #category : #'initialize-release' }
SpMultilineTextLayout >> initializeLine: aLine on: aCanvas with: aContext [
	| iterator |

	iterator := aLine iterator: 1 to: aLine size.
	[ iterator hasNext and: [ aContext availableHeight > 0 ] ] whileTrue: [ 
		| span |
		span := iterator nextSpan.
		self initializeSpan: span on: aCanvas with: aContext.
		aContext pushPosition: iterator position - 2 ].
	aContext pushLine
]

{ #category : #'initialize-release' }
SpMultilineTextLayout >> initializeSpan: aSpan on: aCanvas with: aContext [
	| attributes aTextPainter aLength aStart transform transformInverted aMetricsProvider aTextRun aMetrics |
	self
		assert: [ aSpan isNotEmpty ]
		description: [ 'Span must be non-empty!' ].
	attributes := aSpan attributes.
	transform := SpartaMatrix new.
	attributes
		do: [ :attribute | attribute applyOnSpartaMatrix: transform with: aSpan ].
	aTextPainter := self createPainter: aSpan on: aCanvas.
	aStart := 1.
	transformInverted := transform inverted.
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
	[ aStart <= aLength and: [ aContext availableHeight > 0 ] ]
		whileTrue: [ | span anEnd |
			"here we skip all left whitespace after break"
			aContext isSplitted
				ifTrue:
					[ "white space" aStart := self skipWhitespaceIn: aTextPainter string after: aStart ].
			aMetrics
				width:
					(transformInverted transformX: aContext availableWidth)
						- transform translation x.
			aMetrics start: aStart.
			aMetricsProvider measure: aTextRun in: aMetrics.
			anEnd := aMetrics wrappedEnd.
			"to can be less than from, meaning that there are no fully visible characters that fit in available width"
			anEnd < aStart
				ifTrue: [ aMetrics width: Float infinity.
					aMetrics length: aStart - aMetrics start + 1.
					aMetricsProvider measure: aTextRun in: aMetrics.
					anEnd := aMetrics wrappedEnd ].
			span := SpTextSpan
				rope: rope
				segment: aSpan
				start: aStart
				end: anEnd
				from: aContext position
				to: aContext position + (anEnd - aStart)
				metrics: aMetrics
				transform: transform
				transformInverted: transformInverted
				textRun: aTextRun
				attributes: attributes.	"should be in string buffer coordinates (respecting 1 vs 2 vs 4 bits per character)"	"should be in string buffer coordinates (respecting 1 vs 2 vs 4 bits per character)"
			aContext pushSpan: span.
			aContext isSplitted
				ifTrue: [ aContext pushLine ].
			aStart := anEnd + 1 ].
	aContext pushPosition: aStart - 1 - aLength
]

{ #category : #accessing }
SpMultilineTextLayout >> lines [
	"Return text lines within layout"
	<return: #OrderedCollection>

	^ lines
]

{ #category : #measuring }
SpMultilineTextLayout >> measureOn: aCanvas [
	"Measure and create lines with text spans from provided rope
	based on attributes and layout properties (maximum width / height)"
	| anIterator aContext |

	aContext := SpMultilineTextLayoutContext new.
	aContext rope: rope.
	aContext maxWidth: maxWidth.
	aContext maxHeight: maxHeight.

	anIterator := rope iterator: 1 to: rope size.
	[ anIterator hasNext and: [ aContext availableHeight > 0 ] ] whileTrue: [ 
		| aLine |
		"If we pass while-check we definitely moved to the next line,
		so can do the same with position"
		aContext movePosition: anIterator position.
		aLine := anIterator nextLine.
		self initializeLine: aLine on: aCanvas with: aContext ].

	height := 0.
	aContext lines do: [ :aLine |
		aLine baseline: 0 @ (height + aLine ascent).
		width := width max: aLine width.
		height := height + aLine height ].
	
	lines := aContext lines.
	end := aContext position.
]

{ #category : #accessing }
SpMultilineTextLayout >> positionAt: anIndex [
	| lineFound lineIndex spans spanFound spanIndex offset indexLeft  |
	lineFound := false.
	lineIndex := 0.

	indexLeft := anIndex.
	
	indexLeft <= 0 ifTrue: [ ^ SpTextPosition none ].
	
	[ lineFound or: [ lineIndex >= lines size ] ] whileFalse: [ 
		lineIndex := lineIndex + 1.
		indexLeft <= (lines at: lineIndex) length
			ifTrue: [ lineFound := true ]
			ifFalse: [ indexLeft := indexLeft - (lines at: lineIndex) length ] ].
	
	lineFound ifFalse: [ ^ SpTextPosition none ].
	
	spanFound := false.
	spanIndex := 0.
	spans := (lines at: lineIndex) spans.
	[ spanFound or: [ spanIndex >= spans size ] ] whileFalse: [ 
		spanIndex := spanIndex + 1.
		indexLeft <= (spans at: spanIndex) length
			ifTrue: [ spanFound := true ]
			ifFalse: [ indexLeft := indexLeft - (spans at: spanIndex) length ] ].
		
	spanFound ifFalse: [ ^ SpTextPosition none ].
	
	offset := indexLeft.
	
	^ SpTextPosition line: lineIndex span: spanIndex offset: offset
]

{ #category : #rendering }
SpMultilineTextLayout >> rendererOn: aCanvas [
	| renderer |
	lines ifNil: [ self measureOn: aCanvas ].
	renderer := SpMultilineTextRenderer new layout: self.
	^ renderer
]

{ #category : #initialization }
SpMultilineTextLayout >> reset [
	super reset.
	
	lines := nil
]
