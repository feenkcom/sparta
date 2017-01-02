examples - text
exampleTextMeasure
	|canvas font aMetrics textPainter |
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
		clip;
		maxWidth: 600;
		breakWordWrap;
		paint: (Color black alpha: 0.5);
		string: 'Sparta [%clipped text outside of maxWidth%]';
		start: 2;
		spacing: 0;
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