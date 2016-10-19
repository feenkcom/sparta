drawing
drawOn: aCanvas with: aSpan
	| attributes font fontBuilder textPainter area shadowCanvas |

	area := (aSpan box translateBy: offset + aSpan baseline) expandBy: radius * Float pi.
	shadowCanvas := aCanvas similar: area extent.

	attributes := aSpan attributes.
	fontBuilder := shadowCanvas font.
	textPainter := shadowCanvas text.

	attributes do: [ :attribute |
		attribute applyOnFont: fontBuilder with: aSpan.
		attribute applyOnText: textPainter with: aSpan ].

	font := fontBuilder build.

	textPainter
		paint: color;
		font: font;
		string: aSpan string;
		baseline: 0@aSpan ascent;
		draw.

	shadowCanvas filter
		area: shadowCanvas bounds;
		type: (shadowCanvas gaussianBlurFilter
			stdDeviation: radius;
			source: shadowCanvas surface);
		drawOptions: (shadowCanvas drawOptions
			alpha: 1);
		draw.

	aCanvas fill
		paint: shadowCanvas surface;
		path: area;
		draw.