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
		'start',
		'end',
		'spacing',
		'maxWidth',
		'clip',
		'text'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #accessing }
SpartaTextPainter >> baseline: aPoint [

	baseline := aPoint
]

{ #category : #'accessing - breaks' }
SpartaTextPainter >> breakNone [
	"The line has no break opportunities"
	self subclassResponsibility
]

{ #category : #'accessing - breaks' }
SpartaTextPainter >> breakNormal [
	"The line has a break opportunity determined by the standard line-breaking algorithm."
	self subclassResponsibility
]

{ #category : #'accessing - breaks' }
SpartaTextPainter >> breakWordWrap [
	"The line has a break opportunity only within a word.
	With break-word-wrap we will break at this point only if
	there are no other break opportunities in the line."
	self subclassResponsibility
]

{ #category : #'accessing - breaks' }
SpartaTextPainter >> clip [
	clip := true
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
SpartaTextPainter >> end [
	^ end
]

{ #category : #accessing }
SpartaTextPainter >> end: anIndex [
	"end is defined in glyph coordinates. one character
	can be represented by multiple glyphs"
	end := anIndex
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

{ #category : #'accessing - orientation' }
SpartaTextPainter >> horizontal [
	^ self subclassResponsibility
]

{ #category : #'accessing - breaks' }
SpartaTextPainter >> maxWidth: aNumber [
	maxWidth := aNumber
]

{ #category : #measurement }
SpartaTextPainter >> measure [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
SpartaTextPainter >> metrics [
	"Instantiate and return a metrics container object used during text mearument process"
	<return: #SpMetrics>
	
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
SpartaTextPainter >> metricsProvider [
	"Instantiate and return a backend specific metrics provider that handles SpMetrics request.
	Note: metrics provider is created according to current font and text properties and therefore
	should be instantiated only after text painter is fully configured"
	<return: #SpMetricsProvider>

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
	start := nil.
	end := nil.
	spacing := 0.
	clip := false.
	maxWidth := Float infinity.
	self horizontal.
	self breakNormal
]

{ #category : #accessing }
SpartaTextPainter >> spacing: aNumber [
	spacing := aNumber
]

{ #category : #accessing }
SpartaTextPainter >> start: anIndex [
	start := anIndex
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
SpartaTextPainter >> strokeBelow [
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
	text := aText.
	start := 1.
	"Float infinity means that we render untill the end of the text"
	end := Float infinity
]

{ #category : #'instance creation' }
SpartaTextPainter >> textRun [
	"Instantiate and return a text run containing glyphs for current string according
	to choosen font and various text properties"
	<return: #TSpTextRun>
	
	^ self subclassResponsibility
]

{ #category : #'accessing - orientation' }
SpartaTextPainter >> verticalMixed [
	^ self subclassResponsibility
]

{ #category : #'accessing - orientation' }
SpartaTextPainter >> verticalSidewaysLeft [
	^ self subclassResponsibility
]

{ #category : #'accessing - orientation' }
SpartaTextPainter >> verticalSidewaysRight [
	^ self subclassResponsibility
]

{ #category : #'accessing - orientation' }
SpartaTextPainter >> verticalUpright [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaTextPainter >> width: aFloat [
	self strokeOptions width: aFloat
]
