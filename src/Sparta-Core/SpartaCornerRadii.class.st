Class {
	#name : #SpartaCornerRadii,
	#superclass : #Object,
	#instVars : [
		'topLeft',
		'topRight',
		'bottomRight',
		'bottomLeft'
	],
	#classInstVars : [
		'empty'
	],
	#category : #'Sparta-Core-Path'
}

{ #category : #'instance creation' }
SpartaCornerRadii class >> empty [
	^ empty ifNil: [ empty := self new
		topLeft: 0
		topRight: 0
		bottomRight: 0
		bottomLeft: 0 ]
]

{ #category : #'instance creation' }
SpartaCornerRadii class >> fromArray: anArrayOfCornerRadii [
	^ self new
		topLeft: anArrayOfCornerRadii first
		topRight: anArrayOfCornerRadii second
		bottomRight: anArrayOfCornerRadii third
		bottomLeft: anArrayOfCornerRadii fourth
]

{ #category : #accessing }
SpartaCornerRadii >> bottomLeft [
	^ bottomLeft
]

{ #category : #accessing }
SpartaCornerRadii >> bottomRight [
	^ bottomRight
]

{ #category : #testing }
SpartaCornerRadii >> isUniform [
	"Return true if all corner radii are same"
	<return: #Boolean>

	^ (topLeft closeTo: topRight)
		and: [ (topRight closeTo: bottomRight)
			and: [ (bottomRight closeTo: bottomLeft)
				and: [ bottomLeft closeTo: topLeft ] ] ]
]

{ #category : #accessing }
SpartaCornerRadii >> topLeft [
	^ topLeft
]

{ #category : #initialize }
SpartaCornerRadii >> topLeft: aTopLeft topRight: aTopRight bottomRight: aBottomRight bottomLeft: aBottomLeft [
	self
		assert: [ topLeft isNil ]
		description: [ 'I am immutable' ].
	self
		assert: [ topRight isNil ]
		description: [ 'I am immutable' ].
	self
		assert: [ bottomRight isNil ]
		description: [ 'I am immutable' ].
	self
		assert: [ bottomLeft isNil ]
		description: [ 'I am immutable' ].
		
	topLeft := aTopLeft.
	topRight := aTopRight.
	bottomRight := aBottomRight.
	bottomLeft := aBottomLeft
]

{ #category : #accessing }
SpartaCornerRadii >> topRight [
	^ topRight
]
