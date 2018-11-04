Class {
	#name : #SpAttributeRope,
	#superclass : #SpRope,
	#instVars : [
		'attributes',
		'rope'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #'instance creation' }
SpAttributeRope class >> attributes: anAttributeCollection rope: aRope [
	^ self new
		attributes: anAttributeCollection rope: aRope;
		yourself
]

{ #category : #accessing }
SpAttributeRope >> at: anIndex [
	^ rope at: anIndex
]

{ #category : #accessing }
SpAttributeRope >> attributes [
	^ attributes", rope attributes"
]

{ #category : #initialization }
SpAttributeRope >> attributes: anAttribute rope: aRope [
	attributes := anAttribute.
	rope := aRope
]

{ #category : #accessing }
SpAttributeRope >> balanceGrade [
	^ rope balanceGrade
]

{ #category : #accessing }
SpAttributeRope >> count [
	^ rope count
]

{ #category : #accessing }
SpAttributeRope >> depth [
	^ rope depth
]

{ #category : #accessing }
SpAttributeRope >> do: aBlock [
	rope do: aBlock
]

{ #category : #accessing }
SpAttributeRope >> from: aStart to: anEnd [
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].

	^ self class attributeRope
		attributes: attributes
		rope: (rope from: aStart to: anEnd)
]

{ #category : #testing }
SpAttributeRope >> hasAttributes [
	^ attributes isNotEmpty or: [ rope hasAttributes ]
]

{ #category : #accessing }
SpAttributeRope >> iterator: aStart to: anEnd [
	^ SpAttributeRopeIterator rope: self from: aStart to: anEnd
]

{ #category : #streaming }
SpAttributeRope >> putOn: aStream from: aStart to: anEnd [
	rope putOn: aStream from: aStart to: anEnd
]

{ #category : #accessing }
SpAttributeRope >> rope [
	^ rope
]

{ #category : #accessing }
SpAttributeRope >> size [
	^ rope size
]
