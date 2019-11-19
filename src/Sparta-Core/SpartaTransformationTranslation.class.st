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
SpartaTransformationTranslation >> deltaX: aNumber [
	deltaX := aNumber asFloat
]

{ #category : #accessing }
SpartaTransformationTranslation >> deltaY [
	^ deltaY
]

{ #category : #accessing }
SpartaTransformationTranslation >> deltaY: aNumber [
	deltaY := aNumber asFloat
]

{ #category : #testing }
SpartaTransformationTranslation >> isIdentity [
	<return: #Boolean>

	^ deltaX isZero and: [ deltaY isZero ]
]

{ #category : #testing }
SpartaTransformationTranslation >> isReversable [
	<return: #Boolean>
	
	^ true
]

{ #category : #enumerating }
SpartaTransformationTranslation >> reverseTranslationDo: aBlock [
	self isIdentity
		ifFalse: [ aBlock value: deltaX negated value: deltaY negated ]
]

{ #category : #enumerating }
SpartaTransformationTranslation >> translationDo: aBlock [
	self isIdentity
		ifFalse: [ aBlock value: deltaX value: deltaY ]
]
