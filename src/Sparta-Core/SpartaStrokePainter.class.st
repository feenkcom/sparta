"
! SpartaStrokePainter
I represent a stroke path operation builder - a concrete type of paint-path draw operation.

!! Overview
I define an abstract api that all stroke painters should provide.
I am a final step in path-paint double dispatch and implement all stroke draw related methods.
As optimization I have separate methods to stroke rectangle and path with color, linear and radial gradients as also with surface.
Backends may implement every method differently, add more dispatch stages or provide a single uniform method.

I am instantiated and pre-configured by *==SpartaCanvas==>../SpartaCanvas.class/README.md*.
Do  not create instances of me directly, instead use canvas as service provider.
This way reference to my class will not be hardcoded which increases flexibility.

!! Public API and Key Messages

- ==paint:== - set an object to be used as paint (can be ==Color==, *==SpartaCanvas==>../SpartaCanvas.class/README.md*, ==SpartaSurface==, *==TSpartaPaint==>../TSpartaPaint.trait/README.md*)
- ==path:== - set path to be stroked (can be ==TSpartaPath== or ==Rectangle==)
- ==width:== - set stroke width (==Number== - integer or float)
- ==dashOffset:== - set the location along a path where the dash of a stroke will begin. The higher the number, the further along the path the dashes will begin. (==Number== - integer or float)
- ==dashPattern:== - define dashes using array representation in form =={""fill"" . ""gap"" . ""fill"" . ""gap"" }==, for example ==#(20 30 50 40)==
- ==draw== - perform stroke operation with previously configured parameters and options

!! Example: 

Fill the whole canvas with white color:
[[[language=smalltalk
gradient := canvas paint linearGradient
  begin: 50@25;
  end: 300@200;
  stops: { 0 -> Color red . 1 -> Color blue }.
	
canvas stroke
  paint: gradient;
  path: (50@25 extent: 300@200);
  width: 16;
  dashOffset: 12.5;
  dashPattern: #(25);
  capRound;
  draw.
]]]

+https://github.com/syrel/Sparta/raw/master/images/SpartaStrokePainter/01_stroke_dash_gradient.png|label=strokeGradient+

!! Internal Representation and Key Implementation Points.

Concrete backend implementations should subclass me directly, I was never meant to be an external object.

"
Class {
	#name : #SpartaStrokePainter,
	#superclass : #SpartaPathPainter,
	#traits : 'TSpartaStrokeOptions',
	#classTraits : 'TSpartaStrokeOptions classTrait',
	#instVars : [
		'strokeOptions'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #'cap styles' }
SpartaStrokePainter >> capButt [
	self strokeOptions capButt
]

{ #category : #'cap styles' }
SpartaStrokePainter >> capRound [
	self strokeOptions capRound
]

{ #category : #'cap styles' }
SpartaStrokePainter >> capSquare [
	self strokeOptions capSquare
]

{ #category : #testing }
SpartaStrokePainter >> containsPoint: aPoint [
	"Return true if a given point lies within a path as if it would be stroked with current stroke paint configuration"
	<return: #Boolean>
	
	path ifNil: [ self error: 'Path must be set before texting if it contains a point' ].

	^ path strokeContainsPoint: aPoint options: self strokeOptions on: self canvas
]

{ #category : #accessing }
SpartaStrokePainter >> dashOffset: aFloat [
	self strokeOptions dashOffset: aFloat
]

{ #category : #accessing }
SpartaStrokePainter >> dashPattern: anArrayOfFloats [
	self strokeOptions dashPattern: anArrayOfFloats
]

{ #category : #drawing }
SpartaStrokePainter >> draw [
	path spartaStrokeOn: canvas with: self
]

{ #category : #'join styles' }
SpartaStrokePainter >> joinBevel [
	self strokeOptions joinBevel
]

{ #category : #'join styles' }
SpartaStrokePainter >> joinMiter [
	self strokeOptions joinMiter
]

{ #category : #'join styles' }
SpartaStrokePainter >> joinMiterOrBevel [
	self strokeOptions joinMiterOrBevel
]

{ #category : #'join styles' }
SpartaStrokePainter >> joinRound [
	self strokeOptions joinRound
]

{ #category : #accessing }
SpartaStrokePainter >> miterLimit: aFloat [
	self strokeOptions miterLimit: aFloat
]

{ #category : #state }
SpartaStrokePainter >> reset [
	super reset.

	strokeOptions := nil
]

{ #category : #drawing }
SpartaStrokePainter >> strokeLine: aLine [
	paint spartaStrokeLine: aLine with: self
]

{ #category : #drawing }
SpartaStrokePainter >> strokeLine: aLine withForm: aForm [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeLine: aLine withLinearGradient: aSpartaLinearGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeLine: aLine withRadialGradient: aSpartaRadialGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeLine: aLine withSolidColor: aColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeLine: aLine withSurface: aSpartaSurfacePaint [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaStrokePainter >> strokeOptions [
	^ strokeOptions ifNil: [ strokeOptions := canvas strokeOptions ]
]

{ #category : #accessing }
SpartaStrokePainter >> strokeOptions: aSpartaStrokeOptions [
	strokeOptions := aSpartaStrokeOptions
]

{ #category : #drawing }
SpartaStrokePainter >> strokePath: aPath [
	paint spartaStrokePath: aPath with: self
]

{ #category : #drawing }
SpartaStrokePainter >> strokePath: aPath withForm: aForm [
	self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokePath: aPath withLinearGradient: aSpartaLinearGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokePath: aPath withRadialGradient: aSpartaRadialGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokePath: aPath withSolidColor: aColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeRectangle: aRectangle [
	paint spartaStrokeRectangle: aRectangle with: self
]

{ #category : #drawing }
SpartaStrokePainter >> strokeRectangle: aRectangle withForm: aForm [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeRectangle: aRectangle withSolidColor: aColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaStrokePainter >> strokeRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaStrokePainter >> width: aFloat [
	"Do not request custom stroke options if requested
	width equal to default one"
	aFloat = self class defaultWidth
		ifTrue: [ ^ self ].
	self strokeOptions width: aFloat
]
