Class {
	#name : #SpartaRoundedRectangle,
	#superclass : #SpartaGeometry,
	#instVars : [
		'left',
		'top',
		'right',
		'bottom',
		'cornerRadii'
	],
	#category : #'Sparta-Core-Path'
}

{ #category : #'instance creation' }
SpartaRoundedRectangle class >> rectangle: aRectangle radii: aSpartaCornerRadii [
	^ self new
		rectangle: aRectangle
		radii: aSpartaCornerRadii
]

{ #category : #comparing }
SpartaRoundedRectangle >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ bottom = anObject bottom
		and: [ cornerRadii = anObject cornerRadii
				and: [ left = anObject left
						and: [ right = anObject right and: [ top = anObject top ] ] ] ]
]

{ #category : #accessing }
SpartaRoundedRectangle >> bottom [
	^ bottom
]

{ #category : #'accessing - radii' }
SpartaRoundedRectangle >> bottomLeftRadius [
	<return: #Number>
	
	^ cornerRadii bottomLeft
]

{ #category : #'accessing - radii' }
SpartaRoundedRectangle >> bottomRightRadius [
	<return: #Number>
	
	^ cornerRadii bottomRight
]

{ #category : #'accessing - radii' }
SpartaRoundedRectangle >> cornerRadii [
	^ cornerRadii
]

{ #category : #comparing }
SpartaRoundedRectangle >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ bottom hash
		bitXor:
			(cornerRadii hash
				bitXor: (left hash bitXor: (right hash bitXor: top hash)))
]

{ #category : #accessing }
SpartaRoundedRectangle >> height [
	^ self bottom - self top
]

{ #category : #initialization }
SpartaRoundedRectangle >> initialize [
	super initialize.
	
	left := 0.
	top := 0.
	right := 0.
	bottom := 0.
	cornerRadii := SpartaCornerRadii empty
]

{ #category : #testing }
SpartaRoundedRectangle >> isUniform [
	"Return true if all corner radii are same"
	<return: #Boolean>
	
	^ cornerRadii isUniform
]

{ #category : #accessing }
SpartaRoundedRectangle >> left [
	^ left
]

{ #category : #'accessing - radii' }
SpartaRoundedRectangle >> radius [
	"Assuming that all corners have same radius, return it"
	<return: #Number>
	
	^ cornerRadii topLeft
]

{ #category : #initialization }
SpartaRoundedRectangle >> rectangle: aRectangle radii: aSpartaCornerRadii [
	left := aRectangle left.
	top := aRectangle top.
	right := aRectangle right.
	bottom := aRectangle bottom.
	cornerRadii := aSpartaCornerRadii
]

{ #category : #accessing }
SpartaRoundedRectangle >> right [
	^ right
]

{ #category : #'api - sparta path' }
SpartaRoundedRectangle >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	aSpartaClipper pushRoundedRectangle: self
]

{ #category : #'api - sparta path' }
SpartaRoundedRectangle >> spartaFillOn: aSpartaCanvas with: aSpartaFillPainter [
	aSpartaFillPainter fillRoundedRectangle: self
]

{ #category : #'api - sparta path' }
SpartaRoundedRectangle >> spartaStrokeOn: aSpartaCanvas with: aSpartaStrokePainter [
	aSpartaStrokePainter strokeRoundedRectangle: self
]

{ #category : #'api - sparta path' }
SpartaRoundedRectangle >> strokedBoundsOn: aSpartaCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>

	^ (left @ top corner: right @ bottom) expandBy: aStrokeOptions width
]

{ #category : #accessing }
SpartaRoundedRectangle >> top [
	^ top
]

{ #category : #'accessing - radii' }
SpartaRoundedRectangle >> topLeftRadius [
	<return: #Number>
	
	^ cornerRadii topLeft
]

{ #category : #'accessing - radii' }
SpartaRoundedRectangle >> topRightRadius [
	<return: #Number>
	
	^ cornerRadii topRight
]

{ #category : #accessing }
SpartaRoundedRectangle >> width [
	^ self right - self left
]
