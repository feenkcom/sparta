Class {
	#name : #SpFileReferenceRope,
	#superclass : #SpRope,
	#instVars : [
		'fileReference'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #'instance creation' }
SpFileReferenceRope class >> file: aFileReference [
	^ self new file: aFileReference
]

{ #category : #accessing }
SpFileReferenceRope >> at: anIndex [
	^ self stream
		position: (anIndex - 1);
		next
]

{ #category : #accessing }
SpFileReferenceRope >> balanceGrade [
	^ 0
]

{ #category : #accessing }
SpFileReferenceRope >> count [
	^ 1
]

{ #category : #accessing }
SpFileReferenceRope >> depth [
	^ 0
]

{ #category : #enumerating }
SpFileReferenceRope >> do: aBlock [
	| readStream |
	readStream := self stream.
	[ readStream hasNext ] whileTrue: [ 
		aBlock value: readStream next ]
]

{ #category : #accessing }
SpFileReferenceRope >> file [
	^ fileReference
]

{ #category : #initialization }
SpFileReferenceRope >> file: aFileReference [
	fileReference := aFileReference asFileReference
]

{ #category : #accessing }
SpFileReferenceRope >> from: aStart to: anEnd [
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].

	^ self class subRope rope: self offset: aStart - 1 length: anEnd - aStart + 1
]

{ #category : #accessing }
SpFileReferenceRope >> iterator: aStart to: anEnd [
	^ SpFileReferenceRopeIterator rope: self from: aStart to: anEnd
]

{ #category : #streaming }
SpFileReferenceRope >> putOn: aStream from: aStart to: anEnd [
	| readStream |
	readStream := self stream.
	readStream position: aStart - 1.
	
	aStart to: (anEnd min: 100) do: [ :index |
		aStream nextPut: (readStream next) ]
]

{ #category : #accessing }
SpFileReferenceRope >> size [
	^ fileReference size
]

{ #category : #accessing }
SpFileReferenceRope >> stream [
	^ fileReference readStream
]
