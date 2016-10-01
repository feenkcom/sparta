examples - text
exampleTextMeasure
	|canvas font metricsProvider textPainter |
	canvas := MozCanvas extent: 1100@520.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: self canvasOffset;
		apply.

	font := canvas font
		size: 300;
		weightThin;
		sansSerif;
		build.

	textPainter := canvas text
		breakWordWrap;
		paint: (Color black alpha: 0.5);
		string: 'Sparta';
		spacing: 0;
		font: font;
		yourself.

	metricsProvider := textPainter measure.
	"render text"
	textPainter draw.

	"bounding box"
	canvas stroke
		paint: (Color red alpha: 0.4);
		path: metricsProvider textMetrics boundingBox;
		draw.

	self drawBaseline: metricsProvider on: canvas.
	self drawAscent: metricsProvider on: canvas.
	self drawDescent: metricsProvider on: canvas.
	self drawUnderlineOffset: metricsProvider on: canvas.
	self drawAdvanceWidth: metricsProvider on: canvas.
	self drawStrikeoutOffset: metricsProvider on: canvas.

	canvas asForm asMorph openInWindowLabeled: 'Metrics'