Class {
	#name : #SpItemIterator,
	#superclass : #SpRopeIterator,
	#instVars : [
		'position'
	],
	#category : 'Sparta-Core-Text-Rope'
}

{ #category : #testing }
SpItemIterator >> hasNext [
	^ position < 2
]

{ #category : #accessing }
SpItemIterator >> next [
	(position > 1)
		ifTrue: [ self error: 'Iterator out of bounds!' ].
	position := position + 1.
	^ rope item
]

{ #category : #accessing }
SpItemIterator >> nextAttributes [
	^ #()
]

{ #category : #accessing }
SpItemIterator >> nextSpan [
	(position > 1)
		ifTrue: [ self error: 'Iterator out of bounds!' ].
	position := position + 1.
	^ rope
]

{ #category : #accessing }
SpItemIterator >> peek [
	(position > 1)
		ifTrue: [ self error: 'Iterator out of bounds!' ].
	^ rope item
]

{ #category : #accessing }
SpItemIterator >> position [
	^ position
]

{ #category : #'instance creation' }
SpItemIterator >> rope: aRope from: aStart to: anEnd [
	super rope: aRope from: aStart to: anEnd.
	position := aStart
]
