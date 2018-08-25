Class {
	#name : #SpLargeCollectionRopeTests,
	#superclass : #SpCollectionRopeTests,
	#category : 'Sparta-Core-Text-Rope-Tests'
}

{ #category : #requirements }
SpLargeCollectionRopeTests >> collection [
	^ (1 to: 100) collect: #yourself
]
