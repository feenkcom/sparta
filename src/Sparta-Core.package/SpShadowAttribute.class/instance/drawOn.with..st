drawing
drawOn: aCanvas with: aSpan
	| attributes font fontBuilder textPainter |

	attributes := aSpan attributes.
	fontBuilder := aCanvas font.
	textPainter := aCanvas text.

	attributes do: [ :attribute |
		attribute applyOnFont: fontBuilder with: aSpan.
		attribute applyOnText: textPainter with: aSpan ].
	
	font := fontBuilder build.
	textPainter
		paint: color;
		font: font;
		string: aSpan string;
		baseline: aSpan baseline + offset;
		draw.

	aCanvas filter
		area: ((aSpan box translateBy: (offset + aSpan baseline)) expandBy: radius * Float pi);
		type: (aCanvas gaussianBlurFilter
			stdDeviation: radius;
			source: aCanvas surface);
		drawOptions: (aCanvas drawOptions
			alpha: 1);
		draw.