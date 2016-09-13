examples - text
exampleTextMeasure
	|canvas font textMetrics textPainter |
	canvas := MozCanvas extent: 900@200.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: 50@100;
		apply.

	font := canvas font
		size: 80;
		weightThin;
		sansSerif;
		build.

	textPainter := canvas text
		width: 1;
		paint: Color blue;
		strokePaint: Color red;
		string: 'Line1', String cr, 'Line2';
		font: font;
		yourself.

	textMetrics := textPainter measure.
	textPainter draw.

	canvas stroke
		paint: Color red;
		path: textMetrics metrics boundingBox;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Metrics'