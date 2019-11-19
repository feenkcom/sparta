Class {
	#name : #SpartaTransformationTranslation,
	#superclass : #SpartaTransformationOperation,
	#instVars : [
		'deltaX',
		'deltaY'
	],
	#category : #'Sparta-Core-Math'
}

{ #category : #dispatch }
SpartaTransformationTranslation >> applyOn: aSpartaMatrix [
	aSpartaMatrix translateX: deltaX Y: deltaY
]

{ #category : #accessing }
SpartaTransformationTranslation >> deltaX [
	^ deltaX
]

{ #category : #accessing }
SpartaTransformationTranslation >> deltaX: anObject [
	deltaX := anObject
]

{ #category : #accessing }
SpartaTransformationTranslation >> deltaY [
	^ deltaY
]

{ #category : #accessing }
SpartaTransformationTranslation >> deltaY: anObject [
	deltaY := anObject
]

{ #category : #testing }
SpartaTransformationTranslation >> isIdentity [
	<return: #Boolean>

	^ deltaX isZero and: [ deltaY isZero ]
]

{ #category : #enumerating }
SpartaTransformationTranslation >> translationDo: aBlock [
	self isIdentity
		ifFalse: [ aBlock value: deltaX value: deltaY ]
]
