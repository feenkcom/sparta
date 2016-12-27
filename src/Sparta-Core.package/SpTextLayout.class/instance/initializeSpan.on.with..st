initialize-release
initializeSpan: aSpan on: aCanvas with: aContext
	| attributes aTextPainter size from transform transformInverted aMetricsProvider aTextRun aFont |
	self
		assert: [ aSpan isNotEmpty ]
		description: [ 'Span must be non-empty!' ].

	attributes := aSpan attributes.
	transform := SpartaMatrix new.
	attributes do: [ :attribute | attribute applyOnTransform: transform with: aSpan ].
	aTextPainter := self initializePainter: aSpan on: aCanvas.
	from := 1.
	size := aSpan size.
	transformInverted := transform inverted.

	aFont := aTextPainter font.
	aMetricsProvider := aTextPainter metricsProvider.
	aMetricsProvider enableFontMetrics.
	"Text run with auto release"
	aTextRun := aFont
		makeTextRun: aTextPainter string
		canvas: aTextPainter canvas
		flags: aMetricsProvider flags.

	self
		assert: [ aTextRun isNull not ]
		description: [ 'Created text run must not be nullptr' ].

	aTextRun metricsProvider: aMetricsProvider.
	[ from <= size and: [ aContext availableHeight > 0 ] ]
		whileTrue: [ | span to |
			"here we skip all left whitespace after break"
			aContext isSplitted
				ifTrue: [ from := self skipWhitespaceIn: aTextPainter string after: from ].

			aMetricsProvider width: (transformInverted transformX: aContext availableWidth) - transform translation x.
			aMetricsProvider start: from.
			aMetricsProvider measureTextRun: aTextRun.
			to := aMetricsProvider longestSubstring.
			"to can be less than from, meaning that there are no fully visible characters that fit in available width"
			to < from ifTrue: [
				aMetricsProvider width: Float infinity.
				aMetricsProvider length: from - aMetricsProvider start + 1.
				aMetricsProvider measureTextRun: aTextRun.
				to := aMetricsProvider longestSubstring ].
			span := SpTextSpan
				rope: rope
				segment: aSpan
				start: from
				end: to
				from: aContext position
				to: aContext position + (to - from)
				metrics: aMetricsProvider
				transform: transform
				transformInverted: transformInverted
				textRun: aTextRun.
			span attributes: attributes.
			aContext pushSpan: span.
			aContext isSplitted
				ifTrue: [ aContext pushLine ].
			from := to + 1 ].
	aContext pushPosition: from - 1 - size