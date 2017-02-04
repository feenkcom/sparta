examples - text
exampleTextMeasureItalic
	|canvas font aMetrics textPainter |
	canvas := self canvas: 1100@450.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: self canvasOffset;
		apply.

	font := canvas font
		named: 'Arial';
		size: 300;
		weightThin;
		styleItalic;
		build.

	textPainter := canvas text
		paint: (Color black alpha: 0.5);
		string: 'Sparta';
		font: font;
		yourself.

	aMetrics := textPainter measure.
	"render text"
	textPainter draw.

	"bounding box"
	canvas stroke
		paint: (Color red alpha: 0.4);
		path: aMetrics textMetrics bounds;
		draw.

	self drawBaseline: aMetrics on: canvas.
	self drawAscent: aMetrics on: canvas.
	self drawDescent: aMetrics on: canvas.
	self drawUnderlineOffset: aMetrics on: canvas.
	self drawAdvanceWidth: aMetrics on: canvas.
	self drawStrikeoutOffset: aMetrics on: canvas.

	canvas asForm asMorph openInWindowLabeled: 'Metrics'