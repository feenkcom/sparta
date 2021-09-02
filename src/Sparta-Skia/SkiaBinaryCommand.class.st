Class {
	#name : 'SkiaBinaryCommand',
	#superclass : 'Object',
	#category : 'Sparta-Skia-Binary'
}

{ #category : 'running' }
SkiaBinaryCommand >> streamOn: aBinaryStream [
	aBinaryStream type: self type
]

{ #category : 'generated' }
SkiaBinaryCommand >> type [
	^ self subclassResponsibility
]
