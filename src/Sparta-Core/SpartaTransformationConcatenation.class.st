Class {
	#name : #SpartaTransformationConcatenation,
	#superclass : #SpartaTransformationOperation,
	#instVars : [
		'matrix'
	],
	#category : #'Sparta-Core-Math'
}

{ #category : #dispatch }
SpartaTransformationConcatenation >> applyOn: aSpartaMatrix [
	matrix spartaMultiplyWith: aSpartaMatrix
]

{ #category : #enumerating }
SpartaTransformationConcatenation >> concatenationDo: aBlock [
	self isIdentity
		ifFalse: [ aBlock value: matrix ]
]

{ #category : #testing }
SpartaTransformationConcatenation >> isIdentity [
	<return: #Boolean>

	^ matrix isIdentity
]

{ #category : #testing }
SpartaTransformationConcatenation >> isReversable [
	<return: #Boolean>
	
	^ false
]

{ #category : #accessing }
SpartaTransformationConcatenation >> matrix [
	^ matrix
]

{ #category : #accessing }
SpartaTransformationConcatenation >> matrix: aSpartaMatrix [
	matrix := aSpartaMatrix
]

{ #category : #enumerating }
SpartaTransformationConcatenation >> reverseConcatenationDo: aBlock [
	self isIdentity
		ifFalse: [ aBlock value: matrix inverted ]
]
