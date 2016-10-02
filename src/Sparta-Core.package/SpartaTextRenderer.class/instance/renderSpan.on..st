rendering
renderSpan: aSpan on: aCanvas
	| attributes font fontBuilder textPainter iterator characters renderBlock |

	attributes := aSpan attributes.
	fontBuilder := aCanvas font.
	textPainter := aCanvas text.

	attributes do: [ :attribute |
		attribute drawOn: aCanvas with: aSpan.
		attribute applyOnFont: fontBuilder with: aSpan.
		attribute applyOnText: textPainter with: aSpan ].

	font := fontBuilder build.
	textPainter font: font.

	characters := OrderedCollection new.

	renderBlock := [ :aCharacters |
		aCharacters isNotEmpty ifTrue: [
			| string metrics |
			string := aCharacters as: String.
			aCharacters removeAll.

			textPainter string: string.
			metrics := textPainter measure.
			textPainter baseline: self baseline.
			textPainter draw.
			lineHeight := lineHeight max: (metrics fontMetrics maxAscent + metrics fontMetrics maxDescent).
			self baseline: (self baseline + (metrics textMetrics advanceWidth @ 0)) ] ].

	iterator := aSpan iterator: 1 to: aSpan size.
	[ iterator hasNext ] whileTrue: [ 
		| item |
		item := iterator next.
		item isCharacter
			ifTrue: [ characters add: item ]
			ifFalse: [ renderBlock value: characters ] ].
	renderBlock value: characters