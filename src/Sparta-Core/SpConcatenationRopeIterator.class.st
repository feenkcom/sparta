Class {
	#name : #SpConcatenationRopeIterator,
	#superclass : #SpRopeIterator,
	#instVars : [
		'traverse',
		'currentRope',
		'currentPos',
		'position',
		'currentIterator'
	],
	#category : 'Sparta-Core-Text-Rope'
}

{ #category : #testing }
SpConcatenationRopeIterator >> hasNext [
	^ ((currentPos <= currentRope size) or: [ traverse isNotEmpty ])
		and: [ position <= end ]
]

{ #category : #iteration }
SpConcatenationRopeIterator >> moveForward: aNumber [
	| remaining |
	position := position + aNumber.
	remaining := aNumber.
	
	[ remaining > 0 ] whileTrue: [ 
		| available break |
		available := currentRope size - currentPos.
		(remaining <= available) ifTrue: [ 
			currentPos := currentPos + remaining.
			"currentIterator skip: remaining - 1."
			^ self ].
		remaining := remaining - available.
		traverse isEmpty ifTrue: [ 
			position := position - remaining + 1.
			^ self ].

		break := false.
		[ traverse isEmpty or: [ break ] ] whileFalse: [ 
			currentRope := traverse removeLast.
			currentIterator := currentRope iterator: 1 to: currentRope size.
			currentRope isConcatenation ifTrue: [ 
				traverse addLast: currentRope right.
				traverse addLast: currentRope left ]
			ifFalse: [
				currentPos := 0.
				break := true ] ] ]
]

{ #category : #accessing }
SpConcatenationRopeIterator >> next [
	| next |
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].
	next := currentIterator next.
	self moveForward: 1.
	^ next
]

{ #category : #accessing }
SpConcatenationRopeIterator >> nextAttributes [
	^ currentIterator nextAttributes
]

{ #category : #accessing }
SpConcatenationRopeIterator >> nextSpan [
	| run attributes |
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].

	attributes := self nextAttributes.
	
	run := currentIterator nextSpan.
	self moveForward: run size.

	[ self hasNext and: [ self nextAttributes = attributes ] ] whileTrue: [ 
		| nextRun |
		nextRun := currentIterator nextSpan.
		run := run append: nextRun.
		self moveForward: nextRun size ].

	^ run attributes: attributes from: 1 to: run size
]

{ #category : #accessing }
SpConcatenationRopeIterator >> peek [
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].
	^ currentIterator peek
]

{ #category : #accessing }
SpConcatenationRopeIterator >> position [
	^ position
]

{ #category : #'instance creation' }
SpConcatenationRopeIterator >> rope: aRope from: aStart to: anEnd [
	| break |
	super rope: aRope from: aStart to: anEnd.
	traverse := LinkedList new.
	traverse addLast: aRope.
	currentRope := nil.

	break := false.
	[ traverse isEmpty or: [ break ] ] whileFalse: [
		currentRope := traverse removeLast.
		currentRope ~= aRope ifTrue: [
			currentIterator := currentRope iterator: 1 to: currentRope size ].
		currentRope isConcatenation ifTrue: [ 
			traverse addLast: currentRope right.
			traverse addLast: currentRope left ]
		ifFalse: [ break := true ] ].
	
	currentRope
		ifNil: [ self error: 'Terminal rope is not found!' ].
	
	currentPos := 0.
	position := 0.
	self moveForward: aStart
]

{ #category : #accessing }
SpConcatenationRopeIterator >> skip: aNumber [
	self moveForward: aNumber
]
