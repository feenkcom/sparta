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
SpartaRoundedRectangle >> spartaFillOn: aSpartaCanvas with: aSpartaFiller [
	aSpartaFiller fillRoundedRectangle: self
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
