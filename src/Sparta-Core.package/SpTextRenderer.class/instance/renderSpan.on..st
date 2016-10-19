rendering
renderSpan: aSpan on: aCanvas
	| attributes font fontBuilder textPainter |

	attributes := aSpan attributes.
	fontBuilder := aCanvas font.
	textPainter := aCanvas text.

	attributes do: [ :attribute |
		attribute drawOn: aCanvas with: aSpan.
		attribute applyOnFont: fontBuilder with: aSpan.
		attribute applyOnText: textPainter with: aSpan ].

	font := fontBuilder build.
	textPainter
		font: font;
		string: aSpan string;
		baseline: aSpan baseline;
		draw.