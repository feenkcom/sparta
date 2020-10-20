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

{ #category : #comparing }
SpartaCornerRadii >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ bottomLeft = anObject bottomLeft
		and: [ bottomRight = anObject bottomRight
				and: [ topLeft = anObject topLeft and: [ topRight = anObject topRight ] ] ]
]

{ #category : #accessing }
SpartaCornerRadii >> bottomLeft [
	^ bottomLeft
]

{ #category : #accessing }
SpartaCornerRadii >> bottomRight [
	^ bottomRight
]

{ #category : #comparing }
SpartaCornerRadii >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ bottomLeft hash
		bitXor: (bottomRight hash bitXor: (topLeft hash bitXor: topRight hash))
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

{ #category : #printing }
SpartaCornerRadii >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' topLeft: ';
		print: topLeft.
	aStream
		nextPutAll: ' topRight: ';
		print: topRight.
	aStream
		nextPutAll: ' bottomRight: ';
		print: bottomRight.
	aStream
		nextPutAll: ' bottomLeft: ';
		print: bottomLeft
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
