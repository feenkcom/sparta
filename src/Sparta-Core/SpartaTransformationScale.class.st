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

{ #category : #testing }
SpartaTransformationScale >> isIdentity [
	<return: #Boolean>

	^ (scaleX closeTo: 1.0) and: [ scaleY closeTo: 1.0 ]
]

{ #category : #enumerating }
SpartaTransformationScale >> scaleDo: aBlock [
	self isIdentity
		ifFalse: [ aBlock value: scaleX value: scaleY ]
]

{ #category : #accessing }
SpartaTransformationScale >> scaleX [
	^ scaleX
]

{ #category : #accessing }
SpartaTransformationScale >> scaleX: aNumber [
	scaleX := aNumber asFloat
]

{ #category : #accessing }
SpartaTransformationScale >> scaleY [
	^ scaleY
]

{ #category : #accessing }
SpartaTransformationScale >> scaleY: aNumber [
	scaleY := aNumber asFloat
]
