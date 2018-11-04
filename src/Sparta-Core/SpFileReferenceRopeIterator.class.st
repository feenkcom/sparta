Class {
	#name : #SpFileReferenceRopeIterator,
	#superclass : #SpRopeIterator,
	#instVars : [
		'position',
		'readStream'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #testing }
SpFileReferenceRopeIterator >> hasNext [
	^ (position < rope size)
		and: [ position < end ]
]

{ #category : #accessing }
SpFileReferenceRopeIterator >> next [
	position := position + 1.
	^ readStream next
]

{ #category : #accessing }
SpFileReferenceRopeIterator >> nextAttributes [
	^ #()
]

{ #category : #accessing }
SpFileReferenceRopeIterator >> nextSpan [
	| run |
	position := position + 1.
	run := rope from: position to: end.
	position := end.
	^ run
]

{ #category : #accessing }
SpFileReferenceRopeIterator >> peek [
	^ readStream peek
]

{ #category : #accessing }
SpFileReferenceRopeIterator >> position [
	^ position + 1
]

{ #category : #'instance creation' }
SpFileReferenceRopeIterator >> rope: aRope from: aStart to: anEnd [
	super rope: aRope from: aStart to: anEnd.
	position := aStart - 1.
	readStream := aRope stream.
	readStream position: position
]

{ #category : #accessing }
SpFileReferenceRopeIterator >> skip: aNumber [
	position := position + aNumber
]
