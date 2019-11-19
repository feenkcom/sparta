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
	aSpartaMatrix spartaMultiplyWith: matrix
]

{ #category : #accessing }
SpartaTransformationConcatenation >> matrix [
	^ matrix
]

{ #category : #accessing }
SpartaTransformationConcatenation >> matrix: anObject [
	matrix := anObject
]
