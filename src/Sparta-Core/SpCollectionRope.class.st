Class {
	#name : #SpCollectionRope,
	#superclass : #SpRope,
	#instVars : [
		'collection'
	],
	#category : 'Sparta-Core-Text-Rope'
}

{ #category : #'instance creation' }
SpCollectionRope class >> collection: aCollection [
	^ self new collection: aCollection
]

{ #category : #'instance creation' }
SpCollectionRope class >> from: aLeftRope and: aRightRope [
	| length array index |
	length := aLeftRope size + aRightRope size.
	array := Array new: length.
	index := 1.
	aLeftRope do: [ :item | array at: index put: item. index := index + 1 ].
	aRightRope do: [ :item | array at: index put: item. index := index + 1 ].
	^ self collection: array
]

{ #category : #'instance creation' }
SpCollectionRope class >> rope: aLeftRope from: aStart to: anEnd [
	| length array index |
	length := anEnd - aStart + 1.
	array := Array new: length.
	index := 1.
	aLeftRope do: [ :item | array at: index put: item. index := index + 1 ].
	^ self collection: array
]

{ #category : #accessing }
SpCollectionRope >> at: anIndex [
	^ collection at: anIndex
]

{ #category : #accessing }
SpCollectionRope >> balanceGrade [
	^ 0.0
]

{ #category : #accessing }
SpCollectionRope >> collection [
	^ collection
]

{ #category : #initialization }
SpCollectionRope >> collection: aCollection [
	collection := aCollection
]

{ #category : #accessing }
SpCollectionRope >> count [
	^ 1
]

{ #category : #accessing }
SpCollectionRope >> depth [
	^ 0
]

{ #category : #enumerating }
SpCollectionRope >> do: aBlock [
	collection do: aBlock
]

{ #category : #accessing }
SpCollectionRope >> from: aStart to: anEnd [
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].

	^ (anEnd - aStart + 1 < self class combineLength)
		ifTrue: [ self class collectionRope collection: (collection copyFrom: aStart to: anEnd) ]
		ifFalse: [ self class subRope rope: self offset: aStart - 1 length: anEnd - aStart + 1 ]
]

{ #category : #accessing }
SpCollectionRope >> iterator: aStart to: anEnd [
	^ SpCollectionRopeIterator rope: self from: aStart to: anEnd
]

{ #category : #streaming }
SpCollectionRope >> putOn: aStream from: aStart to: anEnd [
	aStart to: anEnd do: [ :index |
		aStream nextPut: (collection at: index) ]
]

{ #category : #accessing }
SpCollectionRope >> size [
	^ collection size
]
