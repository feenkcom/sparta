Class {
	#name : #SpRopeIterator,
	#superclass : #Object,
	#instVars : [
		'rope',
		'start',
		'end'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #'instance creation' }
SpRopeIterator class >> rope: aRope from: aStart to: anEnd [
	^ self new
		rope: aRope from: aStart to: anEnd;
		yourself
]

{ #category : #testing }
SpRopeIterator >> hasNext [
	^ self subclassResponsibility
]

{ #category : #testing }
SpRopeIterator >> isNewLine: anItem [
	"Return true of given item represents a carriage return, false otherwise"
	<return: #Boolean>

	^ anItem = Character cr or: [ anItem = Character lf ]
]

{ #category : #accessing }
SpRopeIterator >> next [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpRopeIterator >> nextAttributes [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpRopeIterator >> nextLine [

	"The last item is carriage return, we don't want it to be a new line"
	(self position = end and: [
		(self isNewLine: self peek) ])
			ifTrue: [
				"Move iterator to the next, to make sure that hasNext returns false"
				self next.
				^ SpRope fromCollection: #() ].
	^ self nextSegment: [ :item | self isNewLine: item ]
]

{ #category : #accessing }
SpRopeIterator >> nextSegment: aBlock [
	"Return a segment of item for those aBlock answers false"
	| fromIndex toIndex wasFound |
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].
	
	fromIndex := self position.
	wasFound := false.
	
	"we skip all items that do not belong to segment"
	[ self hasNext and: [ (wasFound := (aBlock value: self next)) not ] ] whileTrue.
	
	toIndex := fromIndex = (self position - 1)
		ifTrue: [ fromIndex ]
		ifFalse: [ wasFound
			ifTrue: [ self position - 2 ]
			ifFalse: [ self position - 1 ] ].

	^ self rope from: fromIndex to: toIndex
]

{ #category : #accessing }
SpRopeIterator >> nextSegmentIncluding: aBlock [
	"Return a segment of item for those aBlock answers false including "
	| fromIndex toIndex |
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].
	
	fromIndex := self position.
	
	"we skip all items that do not belong to segment"
	[ self hasNext and: [ (aBlock value: self next) not ] ] whileTrue.

	toIndex := self position - 1.
	fromIndex = toIndex
		ifTrue: [ toIndex := fromIndex ].

	^ self rope from: fromIndex to: toIndex
]

{ #category : #accessing }
SpRopeIterator >> nextSpan [
	"Return a next homogeneous subrope based on attributes"
	^ self subclassResponsibility
]

{ #category : #accessing }
SpRopeIterator >> nextWord [

	"The last item is space, we don't want it to be a new word"
	(self position = end and: [
		self peek = Character space ])
			ifTrue: [
				"Move iterator to the next, to make sure that hasNext returns false"
				self next.
				^ SpRope fromCollection: #() ].
	^ self nextSegmentIncluding: [ :item | item = Character space ]
]

{ #category : #accessing }
SpRopeIterator >> peek [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpRopeIterator >> position [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpRopeIterator >> rope [
	^ rope
]

{ #category : #'instance creation' }
SpRopeIterator >> rope: aRope from: aStart to: anEnd [
	(aStart < 1 or: [ anEnd > aRope size ])
		ifTrue: [ self error: 'Iterator interval out of bounds!' ].
	(anEnd > 0 and: [ aStart > anEnd ])
		ifTrue: [ self error: 'Iterator interval out of bounds!' ].

	rope := aRope.
	start := aStart.
	end := anEnd.
]

{ #category : #accessing }
SpRopeIterator >> skip: aNumber [
	^ self subclassResponsibility
]
