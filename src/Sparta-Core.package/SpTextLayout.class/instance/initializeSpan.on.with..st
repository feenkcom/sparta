initialize-release
initializeSpan: aSpan on: aCanvas with: aContext
	| attributes textPainter size from transform transformInverted |
	self assert: [ aSpan size > 0 ] description: [ 'Span must be non-empty!' ].
	attributes := aSpan attributes.
	transform := SpartaMatrix new.
	attributes do: [ :attribute | attribute applyOnTransform: transform with: aSpan ].
	textPainter := self initializePainter: aSpan on: aCanvas.
	from := 1.
	size := aSpan size.
	transformInverted := transform inverted.
	[ from <= size and: [ aContext availableHeight > 0 ] ]
		whileTrue: [ | metrics span to |
			"here we skip all left whitespace after break"
			aContext isSplitted
				ifTrue: [ from := self skipWhitespaceIn: textPainter string after: from ].
			textPainter maxWidth: (transformInverted transformX: aContext availableWidth) - transform translation x.
			textPainter start: from.
			metrics := textPainter measure.
			to := metrics longestSubstring.

			"to can be less than from, meaning that there are no fully visible characters that fit in available width"
			to < from
				ifTrue: [ | saveEnd |
					saveEnd := textPainter end.
					textPainter maxWidth: Float infinity.
					textPainter end: from.
					metrics := textPainter measure.
					to := metrics longestSubstring.
					textPainter end: saveEnd ].
			span := SpTextSpan
				rope: rope
				segment: aSpan
				start: from
				end: to
				from: aContext position
				to: aContext position + (to - from)
				metrics: metrics
				transform: transform.
			span attributes: attributes.
			aContext pushSpan: span.
			aContext isSplitted
				ifTrue: [ aContext pushLine ].
			from := to + 1 ].
	aContext pushPosition: from - 1 - size