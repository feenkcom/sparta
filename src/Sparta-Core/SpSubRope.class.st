Class {
	#name : #SpSubRope,
	#superclass : #SpRope,
	#instVars : [
		'rope',
		'offset',
		'length'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #'instance creation' }
SpSubRope class >> rope: aRope offset: anOffset length: aLength [
	^ self new
		rope: aRope offset: anOffset length: aLength;
		yourself
]

{ #category : #accessing }
SpSubRope >> at: anIndex [
	anIndex > length
		ifTrue: [ self error: 'Sub rope index out of bounds: ', anIndex asString ].
	
	^ rope at: offset + anIndex
]

{ #category : #accessing }
SpSubRope >> attributes [
	^ rope attributes
]

{ #category : #accessing }
SpSubRope >> balanceGrade [
	^ rope balanceGrade
]

{ #category : #accessing }
SpSubRope >> count [
	^ rope count
]

{ #category : #accessing }
SpSubRope >> depth [
	^ rope depth
]

{ #category : #accessing }
SpSubRope >> do: aBlock [
	| iterator |
	iterator := self iterator: 1 to: self size.
	[ iterator hasNext ]
		whileTrue: [ aBlock value: iterator next ]
]

{ #category : #accessing }
SpSubRope >> from: aStart to: anEnd [
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].
		
	^ self class subRope rope: rope offset: offset + aStart - 1 length: (anEnd - aStart + 1)
]

{ #category : #testing }
SpSubRope >> hasAttributes [
	^ rope hasAttributes
]

{ #category : #accessing }
SpSubRope >> iterator: aStart to: anEnd [
	^ rope iterator: aStart + offset to: anEnd + offset
]

{ #category : #accessing }
SpSubRope >> offset [
	^ offset
]

{ #category : #streaming }
SpSubRope >> putOn: aStream from: aStart to: anEnd [
	rope putOn: aStream from: offset + aStart to: offset + anEnd
]

{ #category : #accessing }
SpSubRope >> rope [
	^ rope
]

{ #category : #initialization }
SpSubRope >> rope: aRope offset: anOffset length: aLength [

	anOffset < 0 ifTrue: [ self error: 'Negative offset: ', anOffset asString ].
	aLength < 0 ifTrue: [ self error: 'Negative length: ', aLength asString ].
	(aLength + anOffset) > aRope size
		ifTrue: [ self error: 'Illegal offset (', anOffset asString,') and length (',aLength asString,') combination for sub rope of length ', aRope size asString ].
	
	rope := aRope.
	offset := anOffset.
	length := aLength
]

{ #category : #accessing }
SpSubRope >> size [
	^ length
]
