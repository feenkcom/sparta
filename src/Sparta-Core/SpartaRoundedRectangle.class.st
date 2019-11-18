Class {
	#name : #SpartaRoundedRectangle,
	#superclass : #SpartaGeometry,
	#instVars : [
		'left',
		'top',
		'width',
		'height',
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
SpartaRoundedRectangle >> cornerRadii [
	^ cornerRadii
]

{ #category : #accessing }
SpartaRoundedRectangle >> height [
	^ height
]

{ #category : #initialization }
SpartaRoundedRectangle >> initialize [
	super initialize.
	
	left := 0.
	top := 0.
	width := 0.
	height := 0.
	cornerRadii := SpartaCornerRadii empty
]

{ #category : #accessing }
SpartaRoundedRectangle >> left [
	^ left
]

{ #category : #initialization }
SpartaRoundedRectangle >> rectangle: aRectangle radii: aSpartaCornerRadii [
	left := aRectangle left.
	top := aRectangle top.
	width := aRectangle width.
	height := aRectangle height.
	cornerRadii := aSpartaCornerRadii
]

{ #category : #'api - sparta path' }
SpartaRoundedRectangle >> spartaFillOn: aSpartaCanvas with: aSpartaFiller [
	aSpartaFiller fillRoundedRectangle: self
]

{ #category : #accessing }
SpartaRoundedRectangle >> top [
	^ top
]

{ #category : #accessing }
SpartaRoundedRectangle >> width [
	^ width
]
