Class {
	#name : #SpConcatenationRope,
	#superclass : #SpRope,
	#instVars : [
		'left',
		'right',
		'depth',
		'length',
		'count',
		'balance'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #'instance creation' }
SpConcatenationRope class >> left: aLeftRope right: aRightRope [
	^ self new
		left: aLeftRope right: aRightRope;
		yourself
]

{ #category : #accessing }
SpConcatenationRope >> at: anIndex [
	((anIndex > self size) or: [ anIndex < 1 ])
		ifTrue: [ self error: 'An index(', anIndex asString. ') is out of range [1..', self size asString,']' ].

	^ (anIndex <= left size)
		ifTrue: [ left at: anIndex ]
		ifFalse: [right at: anIndex - right size + 1 ]
]

{ #category : #accessing }
SpConcatenationRope >> attributes [
	^ #()"left attributes, right attributes"
]

{ #category : #accessing }
SpConcatenationRope >> balanceGrade [
	^ balance
]

{ #category : #accessing }
SpConcatenationRope >> count [
	^ count
]

{ #category : #accessing }
SpConcatenationRope >> depth [
	^ depth
]

{ #category : #enumerating }
SpConcatenationRope >> do: aBlock [
	left do: aBlock.
	right do: aBlock
]

{ #category : #accessing }
SpConcatenationRope >> from: aStart to: anEnd [
	| leftSize |
	
	aStart < 1
		ifTrue: [ self error: 'Illegal sub-sequence start index: ', aStart asString ].
	anEnd > self size
		ifTrue: [ self error: 'Illegal sub-sequence end index: ', anEnd asString ].
		
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].
	
	leftSize := left size.
	anEnd <= leftSize
		ifTrue: [ ^ left from: aStart to: anEnd ].
	
	aStart > leftSize
		ifTrue: [ ^ right from: aStart - leftSize to: anEnd - leftSize ].

	^ self class
		concatenate: (left from: aStart to: leftSize)
		and: (right from: 1 to: anEnd - leftSize)
]

{ #category : #testing }
SpConcatenationRope >> hasAttributes [
	^ left hasAttributes or: [ right hasAttributes ]
]

{ #category : #testing }
SpConcatenationRope >> isConcatenation [
	^ true
]

{ #category : #accessing }
SpConcatenationRope >> iterator: aStart to: anEnd [
	^ SpConcatenationRopeIterator rope: self from: aStart to: anEnd
]

{ #category : #accessing }
SpConcatenationRope >> left [
	^ left
]

{ #category : #initialization }
SpConcatenationRope >> left: aLeftRope right: aRightRope [
	left := aLeftRope.
	right := aRightRope.
	depth := (left depth max: right depth) + 1.
	length := left size + right size.
	count := left count + right count + 1.
	balance := ((left depth - right depth) abs / (left depth + right depth + 1.0) + left balanceGrade + right balanceGrade).
]

{ #category : #streaming }
SpConcatenationRope >> putOn: aStream from: aStart to: anEnd [

	anEnd <= left size
		ifTrue: [ left putOn: aStream from: aStart to: anEnd ]
		ifFalse: [ (aStart > left size)
			ifTrue: [ right putOn: aStream from: aStart - left size + 1 to: anEnd - left size ]
			ifFalse: [ 
				left putOn: aStream from: aStart to: left size.
				right putOn: aStream from: 1 to: anEnd - left size ] ]
]

{ #category : #accessing }
SpConcatenationRope >> rebalanced [
	^ self class rebalance: self
]

{ #category : #accessing }
SpConcatenationRope >> right [
	^ right
]

{ #category : #accessing }
SpConcatenationRope >> size [
	^ length
]
