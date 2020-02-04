Class {
	#name : #SpartaNullPath,
	#superclass : #Object,
	#traits : 'TSpartaPath',
	#classTraits : 'TSpartaPath classTrait',
	#category : #'Sparta-Core-Path'
}

{ #category : #'api - sparta path' }
SpartaNullPath >> containsPoint: aPoint on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be filled"
	<return: #Boolean>

	^ false
]

{ #category : #'api - sparta path' }
SpartaNullPath >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	aSpartaClipper pushPath: self
]

{ #category : #'api - sparta path' }
SpartaNullPath >> spartaDrawFigureOn: aSpartaCanvas with: aSpartaFigurePainter [
]

{ #category : #'api - sparta path' }
SpartaNullPath >> spartaFillOn: aSpartaCanvas with: aSpartaFillPainter [
	
]

{ #category : #'api - sparta path' }
SpartaNullPath >> spartaStrokeOn: aSpartaCanvas with: aSpartaStrokePainter [
	
]

{ #category : #'api - sparta path' }
SpartaNullPath >> strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>

	^ false
]

{ #category : #'api - sparta path' }
SpartaNullPath >> strokedBoundsOn: aSpartaCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>

	^ 0@0 extent: 0@0
]
