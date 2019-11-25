Class {
	#name : #SpartaEllipse,
	#superclass : #SpartaGeometry,
	#instVars : [
		'left',
		'top',
		'right',
		'bottom'
	],
	#category : #'Sparta-Core-Path'
}

{ #category : #'instance creation' }
SpartaEllipse class >> fromRectangle: aRectangle [
	^ self new
		rectangle: aRectangle;
		yourself
]

{ #category : #'instance creation' }
SpartaEllipse class >> origin: anOrigin extent: anExtent [

	self
		assert: [ anExtent x >= 0 and: [ anExtent y >= 0 ] ]
		description: [ 'Extent must be positive!' ].

	^ self new
		left: anOrigin x
		top: anOrigin y
		right: anOrigin x + anExtent x
		bottom: anOrigin y + anExtent y;
		yourself
]

{ #category : #accessing }
SpartaEllipse >> bottom [
	^ bottom
]

{ #category : #'api - sparta path' }
SpartaEllipse >> containsPoint: aPoint on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be filled"
	<return: #Boolean>
	| w h x y center xRadius yRadius normalized |

	x := left.
	y := top.
	
	aPoint x < left
		ifTrue: [ ^ false ].
		
	aPoint x > right
		ifTrue: [ ^ false ].
		
	aPoint y < top
		ifTrue: [ ^ false ].
		
	aPoint y > bottom
		ifTrue: [ ^ false ].

	w := right - left.
	h := bottom - top.
	
	w isZero
		ifTrue: [ ^ false ].
		
	h isZero
		ifTrue: [ ^ false ].
	
	xRadius := w / 2.0.
	yRadius := h / 2.0.
	center := (x + xRadius) @ (y + yRadius).

	normalized := (aPoint x - center x) @ (aPoint y - center y).
	^ ((normalized x squared / xRadius squared) + (normalized y squared / yRadius squared)) <= 1.0
]

{ #category : #initialization }
SpartaEllipse >> initialize [
	super initialize.
	
	left := 0.
	top := 0.
	right := 0.
	bottom := 0
]

{ #category : #accessing }
SpartaEllipse >> left [
	^ left
]

{ #category : #initialization }
SpartaEllipse >> left: aLeft top: aTop right: aRight bottom: aBottom [
	left := aLeft.
	top := aTop.
	right := aRight.
	bottom := aBottom
]

{ #category : #initialization }
SpartaEllipse >> rectangle: aRectangle [
	self
		left: aRectangle left
		top: aRectangle top
		right: aRectangle right
		bottom: aRectangle bottom
]

{ #category : #accessing }
SpartaEllipse >> right [
	^ right
]

{ #category : #'api - sparta path' }
SpartaEllipse >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	aSpartaClipper pushEllipse: self
]

{ #category : #accessing }
SpartaEllipse >> top [
	^ top
]
