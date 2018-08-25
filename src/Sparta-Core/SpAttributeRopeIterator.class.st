Class {
	#name : #SpAttributeRopeIterator,
	#superclass : #SpRopeIterator,
	#instVars : [
		'position',
		'subIterator'
	],
	#category : 'Sparta-Core-Text-Rope'
}

{ #category : #testing }
SpAttributeRopeIterator >> hasNext [
	^ subIterator hasNext
]

{ #category : #accessing }
SpAttributeRopeIterator >> next [
	^ subIterator next
]

{ #category : #accessing }
SpAttributeRopeIterator >> nextAttributes [
	^ subIterator nextAttributes, rope attributes
]

{ #category : #accessing }
SpAttributeRopeIterator >> nextSpan [
	| run attributes |
	attributes := self nextAttributes.
	run := subIterator nextSpan.
	^ run attributes: attributes from: 1 to: run size.
]

{ #category : #accessing }
SpAttributeRopeIterator >> peek [
	^ subIterator peek
]

{ #category : #accessing }
SpAttributeRopeIterator >> position [
	^ subIterator position
]

{ #category : #'instance creation' }
SpAttributeRopeIterator >> rope: aRope from: aStart to: anEnd [
	super rope: aRope from: aStart to: anEnd.
	subIterator := aRope rope iterator: aStart to: anEnd
]

{ #category : #accessing }
SpAttributeRopeIterator >> skip: aNumber [
	subIterator skip: aNumber
]
