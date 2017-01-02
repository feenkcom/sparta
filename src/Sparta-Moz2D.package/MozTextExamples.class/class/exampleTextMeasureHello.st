examples - text
exampleTextMeasureHello
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
		size: 250;
		weightThin;
		sansSerif;
		build.

	textPainter := canvas text
		paint: (Color black alpha: 0.5);
		string: 'H🙈llo';
		font: font;
		yourself.

	metricsProvider := textPainter measure.
	"render text"
	textPainter draw.

	"bounding box"
	canvas stroke
		paint: (Color red alpha: 0.4);
		path: metricsProvider textMetrics bounds;
		draw.

	self drawBaseline: metricsProvider on: canvas.
	self drawAscent: metricsProvider on: canvas.
	self drawDescent: metricsProvider on: canvas.
	self drawUnderlineOffset: metricsProvider on: canvas.
	self drawAdvanceWidth: metricsProvider on: canvas.
	self drawStrikeoutOffset: metricsProvider on: canvas.

	canvas asForm asMorph openInWindowLabeled: 'Metrics'