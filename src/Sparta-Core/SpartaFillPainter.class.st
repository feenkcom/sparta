"
! SpartaFillPainter
I represent a fill path operation builder - a concerete type of paint-path draw operation.

!! Overview
I define an abstract api that all fill painters should provide. I am a final step in path-paint double dispatch and implement all fill draw related methods. As optimisation I have separate methods to fill rectangle and path with color, linear and radial gradients as also with surface. Backend may implement every method differently, add more dispatch stages or provide a single uniform method.

I am instantiated and pre-configured by *==SpartaCanvas==>../SpartaCanvas.class/README.md*. Do  not create instances of me directly, instead use canvas as service provider. This way reference to my class will not be hardcoded  which increases flexibility.

!! Public API and Key Messages

- ==paint:== - set an object to be used as paint (can be ==Color==, *==SpartaCanvas==>../SpartaCanvas.class/README.md*, ==SpartaSurface==, *==TSpartaPaint==>../TSpartaPaint.trait/README.md*)
- ==path:== - set path to be filled (can be ==TSpartaPath== or ==Rectangle==)
- ==draw== - perform fill operation with previously configured parameters and options

!! Example: 

Fill the whole canvas with white color:
[[[language=smalltalk
canvas fill
	paint: Color white;
	path: canvas bounds;
	draw.
]]]

Fill ellipse within rectangle (0@0 extent: 400@100) with pharo logo picture:
[[[language=smalltalk
canvas fill
	paint: (PolymorphSystemSettings pharoLogoForm);
	path: (canvas shape ellipse: (0@0 extent: 400@100));
	draw.
```
+https://github.com/syrel/Sparta/raw/master/images/SpartaFillPainter/01_pharo_logo.png|label=pharoLogo+

!! Internal Representation and Key Implementation Points.

Concrete backend implementations should subclass me directly, I was never ment to be an external object.

"
Class {
	#name : #SpartaFillPainter,
	#superclass : #SpartaPathPainter,
	#category : #'Sparta-Core-Builders'
}

{ #category : #testing }
SpartaFillPainter >> containsPoint: aPoint [
	"Return true if a given point lies within a path as if it would be filled with current fill paint configuration"
	<return: #Boolean>

	path ifNil: [ self error: 'Path must be set before texting if it contains a point' ].

	^ path containsPoint: aPoint on: self canvas
]

{ #category : #drawing }
SpartaFillPainter >> draw [
	path spartaFillOn: canvas with: self
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aSpartaPath [
	paint spartaFillPath: aSpartaPath with: self
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withForm: aForm [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withLinearGradient: aSpartaLinearGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withRadialGradient: aSpartaRadialGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withSolidColor: aColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withSurface: aSpartaSurfacePaint [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle [
	paint spartaFillRectangle: aRectangle with: self
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withForm: aForm [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [
	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	^ self subclassResponsibility
]
