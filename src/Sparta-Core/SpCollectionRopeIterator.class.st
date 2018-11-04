Class {
	#name : #SpCollectionRopeIterator,
	#superclass : #SpRopeIterator,
	#instVars : [
		'position'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #testing }
SpCollectionRopeIterator >> hasNext [
	^ (position <= rope size)
		and: [ position <= end ]
]

{ #category : #accessing }
SpCollectionRopeIterator >> next [
	| item |
	item := rope collection at: position.
	position := position + 1.
	^ item
]

{ #category : #accessing }
SpCollectionRopeIterator >> nextAttributes [
	^ #()
]

{ #category : #accessing }
SpCollectionRopeIterator >> nextSpan [
	| run |
	run := rope from: position to: end.
	position := end + 1.
	^ run
]

{ #category : #accessing }
SpCollectionRopeIterator >> peek [
	^ rope collection at: position
]

{ #category : #accessing }
SpCollectionRopeIterator >> position [
	^ position
]

{ #category : #'instance creation' }
SpCollectionRopeIterator >> rope: aRope from: aStart to: anEnd [
	super rope: aRope from: aStart to: anEnd.
	position := aStart
]

{ #category : #accessing }
SpCollectionRopeIterator >> skip: aNumber [
	position := position + aNumber
]
