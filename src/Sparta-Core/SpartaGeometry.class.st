Class {
	#name : #SpartaGeometry,
	#superclass : #Object,
	#traits : 'TSpartaPath',
	#classTraits : 'TSpartaPath classTrait',
	#category : #'Sparta-Core-Path'
}

{ #category : #'geometry - testing' }
SpartaGeometry >> containsPoint: aPoint on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be filled"
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : #dispatch }
SpartaGeometry >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	self subclassResponsibility
]

{ #category : #dispatch }
SpartaGeometry >> spartaFillOn: aSpartaCanvas with: aSpartaPainter [
	self subclassResponsibility
]

{ #category : #dispatch }
SpartaGeometry >> spartaStrokeOn: aSpartaCanvas with: aSpartaFiller [
	self subclassResponsibility
]

{ #category : #'geometry - testing' }
SpartaGeometry >> strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : #'geometry - accessing' }
SpartaGeometry >> strokedBoundsOn: aSpartaCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>

	^ self subclassResponsibility
]
