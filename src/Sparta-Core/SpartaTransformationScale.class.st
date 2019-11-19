Class {
	#name : #SpartaTransformationScale,
	#superclass : #SpartaTransformationOperation,
	#instVars : [
		'scaleX',
		'scaleY'
	],
	#category : #'Sparta-Core-Math'
}

{ #category : #dispatch }
SpartaTransformationScale >> applyOn: aSpartaMatrix [
	aSpartaMatrix scaleX: scaleX Y: scaleY
]

{ #category : #accessing }
SpartaTransformationScale >> scaleX [
	^ scaleX
]

{ #category : #accessing }
SpartaTransformationScale >> scaleX: anObject [
	scaleX := anObject
]

{ #category : #accessing }
SpartaTransformationScale >> scaleY [
	^ scaleY
]

{ #category : #accessing }
SpartaTransformationScale >> scaleY: anObject [
	scaleY := anObject
]
