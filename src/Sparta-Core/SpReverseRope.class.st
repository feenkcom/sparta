Class {
	#name : #SpReverseRope,
	#superclass : #SpRope,
	#instVars : [
		'rope'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #'instance creation' }
SpReverseRope class >> rope: aRope [
	^ self new
		rope: aRope;
		yourself
]

{ #category : #accessing }
SpReverseRope >> at: anIndex [
	^ rope at: self size - anIndex + 1
]

{ #category : #accessing }
SpReverseRope >> attributes [
	^ rope attributes
]

{ #category : #accessing }
SpReverseRope >> balanceGrade [
	^ rope balanceGrade
]

{ #category : #accessing }
SpReverseRope >> count [
	^ rope count
]

{ #category : #accessing }
SpReverseRope >> depth [
	^ rope depth
]

{ #category : #accessing }
SpReverseRope >> from: aStart to: anEnd [
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].

	^ (rope from: self size - anEnd + 1 to: self size - aStart + 1) reversed
]

{ #category : #testing }
SpReverseRope >> hasAttributes [
	^ rope hasAttributes
]

{ #category : #streaming }
SpReverseRope >> putOn: aStream from: aStart to: anEnd [
	aStart to: anEnd do: [ :index |
		aStream nextPut: (self at: index) ]
]

{ #category : #accessing }
SpReverseRope >> reversed [
	^ rope
]

{ #category : #accessing }
SpReverseRope >> rope [
	^ rope
]

{ #category : #initialization }
SpReverseRope >> rope: aRope [
	rope := aRope
]

{ #category : #accessing }
SpReverseRope >> size [
	^ rope size
]
