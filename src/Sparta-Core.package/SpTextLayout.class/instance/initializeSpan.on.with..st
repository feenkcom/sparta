initialize-release
initializeSpan: aSpan on: aCanvas with: aContext
	| attributes textPainter size from transform transformInverted aMetricsProvider aTextRun aFont |
	self assert: [ aSpan size > 0 ] description: [ 'Span must be non-empty!' ].
	attributes := aSpan attributes.
	transform := SpartaMatrix new.
	attributes do: [ :attribute | attribute applyOnTransform: transform with: aSpan ].
	textPainter := self initializePainter: aSpan on: aCanvas.
	from := 1.
	size := aSpan size.
	transformInverted := transform inverted.
	
	aFont := textPainter font.
	aMetricsProvider := textPainter metricsProvider.
	aMetricsProvider enableFontMetrics.
	"Text run with auto release"
	aTextRun := aFont
		makeTextRun: textPainter string
		canvas: textPainter canvas
		flags: aMetricsProvider flags.

	self
		assert: [ aTextRun isNull not ]
		description: [ 'Created text run must not be nullptr' ].

	aTextRun metricsProvider: aMetricsProvider.
	"self halt."
	[ from <= size and: [ aContext availableHeight > 0 ] ]
		whileTrue: [ | span to |
			"here we skip all left whitespace after break"
			aContext isSplitted
				ifTrue: [ from := self skipWhitespaceIn: textPainter string after: from ].

			aMetricsProvider width: (transformInverted transformX: aContext availableWidth) - transform translation x.
			aMetricsProvider start: from.
			aMetricsProvider measureTextRun: aTextRun.
			to := aMetricsProvider longestSubstring.
			"to can be less than from, meaning that there are no fully visible characters that fit in available width"
			to < from
				ifTrue: [ | saveEnd |
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
				textRun: aTextRun
				font: aFont.
			span attributes: attributes.
			aContext pushSpan: span.
			aContext isSplitted
				ifTrue: [ aContext pushLine ].
			from := to + 1 ].
	aContext pushPosition: from - 1 - size