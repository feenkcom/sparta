Class {
	#name : #MozTextExamples,
	#superclass : #Object,
	#traits : 'TSpartaTextExamples',
	#classTraits : 'TSpartaTextExamples classTrait',
	#category : #'Sparta-Moz2D-Examples'
}

{ #category : #accessing }
MozTextExamples class >> canvas: anExtent [
	^ MozCanvas extent: anExtent
]

{ #category : #'examples - text' }
MozTextExamples class >> exampleTextMeasure [
	<gtExample>
	|canvas font aMetrics textPainter |

	canvas := self canvas: 1100@520.

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

	^ canvas
]
