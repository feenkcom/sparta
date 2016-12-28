initialize-release
initializeSpan: aSpan on: aCanvas with: aContext
	| attributes aTextPainter aLength aStart transform transformInverted aMetricsProvider aTextRun aFont |
	self
		assert: [ aSpan isNotEmpty ]
		description: [ 'Span must be non-empty!' ].

	attributes := aSpan attributes.
	transform := SpartaMatrix new.
	attributes do: [ :attribute | attribute applyOnTransform: transform with: aSpan ].
	aTextPainter := self initializePainter: aSpan on: aCanvas.
	aStart := 1.
	transformInverted := transform inverted.

	aFont := aTextPainter font.
	aMetricsProvider := aTextPainter metricsProvider.
	aMetricsProvider enableFontMetrics.
	"Text run with auto release"
	aTextRun := aFont
		makeTextRun: aTextPainter string
		canvas: aTextPainter canvas
		flags: aMetricsProvider flags.

	aLength := aTextRun size.
	
	self
		assert: [ aTextRun isNull not ]
		description: [ 'Created text run must not be nullptr' ].

	aTextRun metricsProvider: aMetricsProvider.
	[ aStart <= aLength and: [ aContext availableHeight > 0 ] ]
		whileTrue: [ | span anEnd |
			"here we skip all left whitespace after break"
			aContext isSplitted
				ifTrue: [
					"white space"
					aStart := self skipWhitespaceIn: aTextPainter string after: aStart ].

			aMetricsProvider width: (transformInverted transformX: aContext availableWidth) - transform translation x.
			aMetricsProvider start: aStart.
			aMetricsProvider measureTextRun: aTextRun.
			anEnd := aMetricsProvider longestSubstring.
			"to can be less than from, meaning that there are no fully visible characters that fit in available width"
			anEnd < aStart ifTrue: [
				aMetricsProvider width: Float infinity.
				aMetricsProvider length: aStart - aMetricsProvider start + 1.
				aMetricsProvider measureTextRun: aTextRun.
				anEnd := aMetricsProvider longestSubstring ].
			span := SpTextSpan
				rope: rope
				segment: aSpan
				start: aStart "should be in string buffer coordinates (respecting 1 vs 2 vs 4 bits per character)"
				end: anEnd "should be in string buffer coordinates (respecting 1 vs 2 vs 4 bits per character)"
				from: aContext position
				to: aContext position + (anEnd - aStart)
				metrics: aMetricsProvider
				transform: transform
				transformInverted: transformInverted
				textRun: aTextRun.
			span attributes: attributes.
			aContext pushSpan: span.
			aContext isSplitted
				ifTrue: [ aContext pushLine ].
			aStart := anEnd + 1 ].
	aContext pushPosition: aStart - 1 - aLength