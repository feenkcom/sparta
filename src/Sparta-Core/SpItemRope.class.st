Class {
	#name : #SpItemRope,
	#superclass : #SpRope,
	#instVars : [
		'item'
	],
	#category : 'Sparta-Core-Text-Rope'
}

{ #category : #'instance creation' }
SpItemRope class >> item: anObject [
	^ self new item: anObject
]

{ #category : #accessing }
SpItemRope >> at: anIndex [
	((anIndex > self size) or: [ anIndex < 1 ])
		ifTrue: [ self error: 'An index(', anIndex asString. ') is out of range [1..', self size asString,']' ].
	^ item
]

{ #category : #accessing }
SpItemRope >> balanceGrade [
	^ 0
]

{ #category : #accessing }
SpItemRope >> count [
	^ 1
]

{ #category : #accessing }
SpItemRope >> depth [
	^ 0
]

{ #category : #enumerating }
SpItemRope >> do: aBlock [
	aBlock value: item
]

{ #category : #accessing }
SpItemRope >> item [
	^ item
]

{ #category : #initialization }
SpItemRope >> item: anObject [
	self
		assert: [ anObject isCollection not ]
		description: [ 'Item must not be a collection' ].
		
	item := anObject
]

{ #category : #streaming }
SpItemRope >> putOn: aStream from: aStart to: anEnd [
	aStream nextPut: item
]

{ #category : #accessing }
SpItemRope >> size [
	^ 1
]
