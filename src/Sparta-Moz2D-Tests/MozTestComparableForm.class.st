"
I am special form that supports = comparison.
Usefull for UI tests
"
Class {
	#name : #MozTestComparableForm,
	#superclass : #Form,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #comparing }
MozTestComparableForm >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	((self isKindOf: anObject class) or: [ anObject isKindOf: self class ])
		ifFalse: [ ^ false ].
	^ self bits = anObject bits
		and: [ self depth = anObject depth ]
]
