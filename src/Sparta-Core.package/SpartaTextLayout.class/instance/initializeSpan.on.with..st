initialization
initializeSpan: aSpan on: aCanvas with: aContext
	| attributes font fontBuilder textPainter string size from |
	self flag: 'Method too complex'.
	
	attributes := aSpan attributes.
	fontBuilder := aCanvas font.
	textPainter := aCanvas text.

	attributes do: [ :attribute |
		attribute applyOnFont: fontBuilder with: aSpan.
		attribute applyOnText: textPainter with: aSpan ].

	font := fontBuilder build.
	textPainter font: font.

	string := String streamContents: [ :stream | stream nextPutAll: aSpan ].
	from := 1.
	size := aSpan size.
	textPainter string: string.
	[ from <= size and: [ aContext availableHeight > 0 ] ] whileTrue: [ 
		| metrics span to |

		"here we trim all left whitespace after break"
		from > 1 ifTrue: [
			|index char |
			index := from.
			char := string at: index.
			[ index < size and: [ char = Character space ] ] whileTrue: [ 
				index := index + 1.
				char := string at: index.
			].
			from := index ].
		
		textPainter maxWidth: aContext availableWidth.
		textPainter start: from.
		metrics := textPainter measure.
		to := metrics longestSubstring.

		(to + 1) = from ifTrue: [
			|saveEnd|
			saveEnd := textPainter end.
			textPainter maxWidth: Float infinity.
			textPainter end: from.
			metrics := textPainter measure.
			to := metrics longestSubstring.
			textPainter end: saveEnd ].

		span := SpartaTextSpan rope: aSpan from: from to: to metrics: metrics.
		span attributes: attributes.
		aContext pushSpan: span.
		to < size ifTrue: [ aContext pushLine ].
		from := to + 1.
	].