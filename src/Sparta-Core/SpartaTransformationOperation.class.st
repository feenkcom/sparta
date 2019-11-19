Class {
	#name : #SpartaTransformationOperation,
	#superclass : #Object,
	#category : #'Sparta-Core-Math'
}

{ #category : #dispatch }
SpartaTransformationOperation >> applyOn: aSpartaMatrix [
	self subclassResponsibility
]

{ #category : #testing }
SpartaTransformationOperation >> isIdentity [
	^ false
]
