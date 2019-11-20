"
! SpartaTextPainter

I am a text painter.

!! Overview

I help developers to create, configure and execute text draw operation.
For that users of me must provide at least a font (backend specific, create using SpartaFontBuilder) to use and actual string to draw.
Additionally users may provide draw and stroke options as also specify how exactly string should be rendered: fill or stroke it.
It is also possible to choose if stroke should be rendered below fill or not.

!! Public API and Key Messages

- ==font:== - set a font that should be used to render a string
- ==string:== - set string to render
- ==baseline:== - set baseline location where string should be rendered
- ==fill== - string should be filled (default mode)
- ==stroke== - stroke string
- ==strokeBelow== - stroke should be rendered below fill
- ==drawOptions:== - set custom draw options (alpha, composition mode, antialias)
- ==strokeOptions:== - set custom stroke options (stroke width, other stroke related parameters)

!! Example:

First we need to create a font group, in this case of generic type *sans-serif*:
[[[language=smalltalk
font := canvas font
  size: 28;
  weightThin;
  sansSerif;
  build.
]]]

Use created font group to render multi-language text:
[[[language=smalltalk
canvas text
  string: 'Sparta Спарта 斯巴達 سپارٹا ස්පාටා';
  font: font;
  baseline: 20@40;
  draw;
  string: '😂🙈🚀'
  origin: 20@70;
  draw.
]]]
+https://github.com/syrel/Sparta/raw/documentation/images/SpartaTextPainter/01_multilanguage.png|label=multilanguage+

!! Internal Representation and Key Implementation Points.

!!! Instance Variables

- color: ==<Object>==
- drawOptions: ==<TSpartaDrawOptions>==
- font: ==<Object>==
- baseline: ==<Point>==
- string: ==<String>==
- strokeOptions: ==<TSpartaStrokeOptions>==

!!! Implementation Points

Font to use is backend specific. It must be created using SpartaFontBuilder.

"
Class {
	#name : #SpartaTextPainter,
	#superclass : #SpartaAbstractPainter,
	#traits : 'TSpartaStrokeOptions',
	#classTraits : 'TSpartaStrokeOptions classTrait',
	#instVars : [
		'drawOptions',
		'strokeOptions',
		'font',
		'paint',
		'strokePaint',
		'baseline',
		'spacing',
		'text'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #accessing }
SpartaTextPainter >> baseline: aPoint [

	baseline := aPoint
]

{ #category : #drawing }
SpartaTextPainter >> draw [
	text spartaFillOn: canvas with: self
]

{ #category : #accessing }
SpartaTextPainter >> drawOptions: aDrawOptions [
	drawOptions := aDrawOptions
]

{ #category : #accessing }
SpartaTextPainter >> ensureFont [
	(font isNil and: [ text isString ])
		ifTrue: [ font := self canvas font build ]
]

{ #category : #accessing }
SpartaTextPainter >> fill [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillString: aString [ 
	paint spartaFillString: aString with: self
]

{ #category : #drawing }
SpartaTextPainter >> fillString: aString withColor: aFillColor strokeColor: aStrokeColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillString: aString withColor: aFillColor strokePaint: aStrokePaint [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillString: aString withPaint: aPaint [
	strokePaint spartaStrokeString: aString fillPaint: aPaint with: self
]

{ #category : #drawing }
SpartaTextPainter >> fillString: aString withPaint: aFillPaint strokeColor: aStrokeColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillString: aString withPaint: aFillPaint strokePaint: aStrokePaint [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillString: aString withSolidColor: aColor [
	strokePaint spartaStrokeString: aString fillColor: aColor with: self
]

{ #category : #drawing }
SpartaTextPainter >> fillTextRun: aTextRun [ 
	paint spartaFillTextRun: aTextRun with: self
]

{ #category : #drawing }
SpartaTextPainter >> fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillTextRun: aTextRun withColor: aFillColor strokePaint: aStrokePaint [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillTextRun: aTextRun withPaint: aPaint [
	strokePaint spartaStrokeTextRun: aTextRun fillPaint: aPaint with: self
]

{ #category : #drawing }
SpartaTextPainter >> fillTextRun: aTextRun withPaint: aFillPaint strokeColor: aStrokeColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillTextRun: aTextRun withPaint: aFillPaint strokePaint: aStrokePaint [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTextPainter >> fillTextRun: aTextRun withSolidColor: aColor [
	strokePaint spartaStrokeTextRun: aTextRun fillColor: aColor with: self
]

{ #category : #accessing }
SpartaTextPainter >> font [

	^ font
]

{ #category : #accessing }
SpartaTextPainter >> font: aFontGroup [

	font := aFontGroup
]

{ #category : #measurement }
SpartaTextPainter >> measure [
	<return: #SpartaMetrics>
	| aMetrics |

	aMetrics := self metrics.
	self textRunWithMetrics: aMetrics.
	^ aMetrics
]

{ #category : #'instance creation' }
SpartaTextPainter >> metrics [
	"Instantiate and return a metrics container object used during text mearument process"
	<return: #SpartaMetrics>
	
	^ SpartaMetrics new
]

{ #category : #'instance creation' }
SpartaTextPainter >> metricsProvider [
	"Instantiate and return a backend specific metrics provider that handles SpMetrics request.
	Note: metrics provider is created according to current font and text properties and therefore
	should be instantiated only after text painter is fully configured"
	<return: #SpartaMetricsProvider>

	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaTextPainter >> paint: aPaint [
	paint := aPaint asSpartaPaintOn: canvas
]

{ #category : #'initialize-release' }
SpartaTextPainter >> reset [
	super reset.
	
	drawOptions := nil.
	strokeOptions := nil.
	font := nil.
	paint := Color black.
	strokePaint := Color transparent.
	baseline := 0@0.
	text := nil.
	spacing := 0
]

{ #category : #accessing }
SpartaTextPainter >> spacing: aNumber [
	spacing := aNumber
]

{ #category : #accessing }
SpartaTextPainter >> string [
	^ self text
]

{ #category : #accessing }
SpartaTextPainter >> string: aString [
	self text: aString
]

{ #category : #accessing }
SpartaTextPainter >> stroke [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaTextPainter >> strokeOptions [
	^ strokeOptions ifNil: [ strokeOptions := canvas strokeOptions ]
]

{ #category : #accessing }
SpartaTextPainter >> strokeOptions: anObject [
	strokeOptions := anObject
]

{ #category : #accessing }
SpartaTextPainter >> strokePaint: aPaint [
	strokePaint := aPaint asSpartaPaintOn: canvas
]

{ #category : #accessing }
SpartaTextPainter >> text [
	^ text
]

{ #category : #accessing }
SpartaTextPainter >> text: aText [
	text := aText
]

{ #category : #'instance creation' }
SpartaTextPainter >> textRun [
	"Instantiate and return a text run containing glyphs for current string according
	to choosen font and various text properties"
	<return: #TSpTextRun>
	
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
SpartaTextPainter >> textRunWithMetrics: aSpartaMetrics [
	"Instantiate and return a text run containing glyphs for current string according
	to choosen font and various text properties while measuring the text run in given sparta metrics"
	<return: #TSpTextRun>

	| aTextRun |
	aTextRun := self textRun.

	self
		assert: [ aTextRun isNull not ]
		description: [ 'Created text run must not be nullptr' ].

	aSpartaMetrics
		canvas: canvas;
		spacing: spacing.

	self metricsProvider measure: aTextRun in: aSpartaMetrics.

	^ aTextRun
]

{ #category : #accessing }
SpartaTextPainter >> width: aFloat [
	self strokeOptions width: aFloat
]
