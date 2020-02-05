Class {
	#name : #SpartaCircle,
	#superclass : #SpartaGeometry,
	#instVars : [
		'center',
		'radius'
	],
	#category : #'Sparta-Core-Path'
}

{ #category : #'instance creation' }
SpartaCircle class >> center: aPoint radius: aRadius [
	^ self new
		center: aPoint;
		radius: aRadius
]

{ #category : #converting }
SpartaCircle >> asRectangle [
	^ Rectangle center: center extent: radius * 2 asPoint
]

{ #category : #accessing }
SpartaCircle >> center [
	<return: #Point>

	^ center
]

{ #category : #accessing }
SpartaCircle >> center: aPoint [
	center := aPoint
]

{ #category : #'api - sparta path' }
SpartaCircle >> containsPoint: aPoint on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be filled"
	<return: #Boolean>

	^ ((aPoint x - center x) squared + (aPoint y - center y) squared) < radius squared
]

{ #category : #initialization }
SpartaCircle >> initialize [
	super initialize.
	
	center := 0@0.
	radius := 0
]

{ #category : #'api - sparta path' }
SpartaCircle >> insetBy: aNumber [
	"Answer a sparta geometry that is inset from the receiver by delta.
	delta is a number.
	Geometry becomes smaller if delta is positive"
	<return: #SpartaGeometry>

	^ self class
		center: self center
		radius: ((self radius - aNumber) max: 0)
]

{ #category : #accessing }
SpartaCircle >> radius [
	<return: #Number>

	^ radius
]

{ #category : #accessing }
SpartaCircle >> radius: aNumber [
	radius := aNumber
]

{ #category : #'api - sparta path' }
SpartaCircle >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	aSpartaClipper pushCircle: self
]

{ #category : #'api - sparta path' }
SpartaCircle >> spartaDrawFigureOn: aSpartaCanvas with: aSpartaFigurePainter [
	aSpartaFigurePainter drawCircle: self
]

{ #category : #'api - sparta path' }
SpartaCircle >> spartaFillOn: aSpartaCanvas with: aSpartaFillPainter [
	aSpartaFillPainter fillCircle: self
]

{ #category : #'api - sparta path' }
SpartaCircle >> spartaStrokeOn: aSpartaCanvas with: aSpartaStrokePainter [
	aSpartaStrokePainter strokeCircle: self
]

{ #category : #'api - sparta path' }
SpartaCircle >> strokedBoundsOn: aSpartaCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>
	| aStrokedRadius |
	
	aStrokedRadius := radius + (aStrokeOptions width / 2.0).
	^ self center - aStrokedRadius corner: self center + aStrokedRadius
]
