Trait {
	#name : #TSpartaTextExamples,
	#category : #'Sparta-Core-Examples'
}

{ #category : #accessing }
TSpartaTextExamples classSide >> canvas: anExtent [
	^ self explicitRequirement
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> canvasOffset [
	^ 50@300
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> drawAdvanceWidth: aMetricsProvider on: aCanvas [
	
	self
		drawVerticalLineAt: 0
		named: 'Text start'
		color: Color green darker darker
		on: aCanvas.

	self
		drawVerticalLineAt: aMetricsProvider textMetrics advance
		named: 'Advance width'
		color: Color green darker darker
		on: aCanvas
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> drawAscent: aSpartaMetrics on: aCanvas [

	self
		drawLineAt: aSpartaMetrics fontMetrics ascent
		named: 'Ascent'
		color: Color blue
		on: aCanvas
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> drawBaseline: aSpartaMetrics on: aCanvas [
	
	self
		drawLineAt: 0
		named: 'Baseline'
		color: Color blue
		on: aCanvas
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> drawDescent: aSpartaMetrics on: aCanvas [
	
	self
		drawLineAt: aSpartaMetrics fontMetrics descent
		named: 'Descent'
		color: Color blue
		on: aCanvas
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> drawLineAt: offsetY named: aName color: aColor on: aCanvas [
	| textPainter metricsProvider |
	aCanvas stroke
		paint: aColor;
		path: (aCanvas shape line: self canvasOffset x negated @ offsetY to: (aCanvas width - self canvasOffset x)@ offsetY );
		draw.

	textPainter := aCanvas text
		string: aName;
		paint: aColor;
		font: (aCanvas font
			size: 16;
			weightThin;
			build).
	metricsProvider := textPainter measure.	
	textPainter
		baseline: ((aCanvas width - 5 - self canvasOffset x) @ offsetY) - (metricsProvider textMetrics width @ 3);
		draw.
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> drawStrikeoutOffset: aSpartaMetrics on: aCanvas [
	
	self
		drawLineAt: aSpartaMetrics fontMetrics strikeoutOffset
		named: 'Strikeout offset'
		color: Color blue
		on: aCanvas
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> drawUnderlineOffset: aSpartaMetrics on: aCanvas [
	
	self
		drawLineAt: aSpartaMetrics fontMetrics underlineOffset
		named: 'Underline offset'
		color: Color blue
		on: aCanvas
]

{ #category : #'text - measurement' }
TSpartaTextExamples classSide >> drawVerticalLineAt: offsetX named: aName color: aColor on: aCanvas [
	| textPainter metricsProvider |
	aCanvas stroke
		paint: aColor;
		path: (aCanvas shape line: offsetX @ self canvasOffset y negated to: offsetX @ (aCanvas height - self canvasOffset y) );
		draw.

	textPainter := aCanvas text
		string: aName;
		paint: aColor;
		font: (aCanvas font
			size: 16;
			weightThin;
			build).
	metricsProvider := textPainter measure.	
	textPainter
		baseline: (offsetX + 3) @ (aCanvas height -  self canvasOffset y - 5);
		draw
]

{ #category : #'examples - text' }
TSpartaTextExamples classSide >> exampleTextMeasure [
	|canvas font aMetrics textPainter |
	<gtExample>

	canvas := self canvas: 900@450.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		by: [ :t | t translateBy: self canvasOffset ]
		during: [
			font := canvas font
				size: 240;
				weightThin;
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
			self drawStrikeoutOffset: aMetrics on: canvas ].

	^ canvas
]

{ #category : #'examples - text' }
TSpartaTextExamples classSide >> exampleTextMeasureHello [
	|canvas font metricsProvider textPainter |
	canvas := self canvas: 900@520.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: self canvasOffset;
		push.

	font := canvas font
		serif;
		size: 250;
		weightThin;
		build.

	textPainter := canvas text
		paint: (Color black alpha: 0.5);
		string: 'H🤖llo';
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
]

{ #category : #'examples - text' }
TSpartaTextExamples classSide >> exampleTextMeasureItalic [
	|canvas font aMetrics textPainter |
	canvas := self canvas: 1100@450.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: self canvasOffset;
		push.

	font := canvas font
		serif;
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
]
