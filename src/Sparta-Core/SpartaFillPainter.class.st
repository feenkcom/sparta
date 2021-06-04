"
# SpartaFillPainter
I represent a fill path operation builder - a concerete type of paint-path draw operation.

## Overview
I define an abstract api that all fill painters should provide. I am a final step in path-paint double dispatch and implement all fill draw related methods. As optimisation I have separate methods to fill rectangle and path with color, linear and radial gradients as also with surface. Backend may implement every method differently, add more dispatch stages or provide a single uniform method.

I am instantiated and pre-configured by `SpartaCanvas`. Do  not create instances of me directly, instead use canvas as service provider. This way reference to my class will not be hardcoded  which increases flexibility.

## Public API and Key Messages

- `paint:` - set an object to be used as paint (can be `Color`, `SpartaCanvas`, `SpartaSurface`, `TSpartaPaint`)
- `path:` - set path to be filled (can be `TSpartaPath` or `Rectangle`)
- `draw` - perform fill operation with previously configured parameters and options

## Example: 

Fill the whole canvas with white color:
```language=smalltalk
canvas fill
	paint: Color white;
	path: canvas bounds;
	draw.
```

Fill ellipse within rectangle (0@0 extent: 400@100) with pharo logo picture:
[[[language=smalltalk
canvas fill
	paint: (PolymorphSystemSettings pharoLogoForm);
	path: (canvas shape ellipse: (0@0 extent: 400@100));
	draw.
```
+https://github.com/syrel/Sparta/raw/master/images/SpartaFillPainter/01_pharo_logo.png|label=pharoLogo+

## Internal Representation and Key Implementation Points.

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

	path ifNil: [ self error: 'Path must be set before testing if it contains a point' ].

	^ path containsPoint: aPoint on: self canvas
]

{ #category : #drawing }
SpartaFillPainter >> draw [
	path spartaFillOn: canvas with: self
]

{ #category : #drawing }
SpartaFillPainter >> fillCircle: aSpartaCircle [
	paint spartaFillCircle: aSpartaCircle with: self
]

{ #category : #drawing }
SpartaFillPainter >> fillCircle: aSpartaCircle withForm: aForm [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillCircle: aSpartaCircle withLinearGradient: aSpartaLinearGradient [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillCircle: aSpartaCircle withRadialGradient: aSpartaRadialGradient [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillCircle: aSpartaCircle withSolidColor: aColor [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillCircle: aSpartaCircle withSurface: aSpartaSurfacePaint [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aSpartaPath [
	paint spartaFillPath: aSpartaPath with: self
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withForm: aForm [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withLinearGradient: aSpartaLinearGradient [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withRadialGradient: aSpartaRadialGradient [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withSolidColor: aColor [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillPath: aPath withSurface: aSpartaSurfacePaint [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle [
	paint spartaFillRectangle: aRectangle with: self
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withForm: aForm [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRoundedRectangle: aRectangle [
	paint spartaFillRoundedRectangle: aRectangle with: self
]

{ #category : #drawing }
SpartaFillPainter >> fillRoundedRectangle: aSpartaRounedRectangle withForm: aForm [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRoundedRectangle: aSpartaRounedRectangle withLinearGradient: aSpartaLinearGradient [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRoundedRectangle: aSpartaRounedRectangle withRadialGradient: aSpartaRadialGradient [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRoundedRectangle: aSpartaRoundedRectangle withSolidColor: aColor [
	true ifFalse: [ self subclassResponsibility ]
]

{ #category : #drawing }
SpartaFillPainter >> fillRoundedRectangle: aSpartaRounedRectangle withSurface: aSpartaSurfacePaint [
	true ifFalse: [ self subclassResponsibility ]
]
