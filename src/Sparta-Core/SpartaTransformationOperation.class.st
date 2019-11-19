Class {
	#name : #SpartaTransformationOperation,
	#superclass : #Object,
	#category : #'Sparta-Core-Math'
}

{ #category : #dispatch }
SpartaTransformationOperation >> applyOn: aSpartaMatrix [
	self subclassResponsibility
]

{ #category : #enumerating }
SpartaTransformationOperation >> concatenationDo: aBlock [
]

{ #category : #testing }
SpartaTransformationOperation >> isIdentity [
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : #enumerating }
SpartaTransformationOperation >> rotationDo: aBlock [
]

{ #category : #enumerating }
SpartaTransformationOperation >> scaleDo: aBlock [
]

{ #category : #enumerating }
SpartaTransformationOperation >> translationDo: aBlock [
]
