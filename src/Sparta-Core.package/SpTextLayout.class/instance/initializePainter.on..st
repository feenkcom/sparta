initialize-release
initializePainter: aSpan on: aCanvas
	| fontBuilder textPainter attributes |

	attributes := aSpan attributes.
	
	textPainter := aCanvas text.
	fontBuilder := aCanvas font.

	attributes do: [ :attribute |
		attribute applyOnFont: fontBuilder with: aSpan.
		attribute applyOnText: textPainter with: aSpan ].

	textPainter font: fontBuilder build.
	textPainter string: (String streamContents: [ :stream | stream nextPutAll: aSpan ]).

	^ textPainter