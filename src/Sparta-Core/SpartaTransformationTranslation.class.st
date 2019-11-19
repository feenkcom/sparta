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
