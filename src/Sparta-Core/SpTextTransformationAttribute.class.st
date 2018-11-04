Class {
	#name : #SpTextTransformationAttribute,
	#superclass : #SpAttribute,
	#traits : 'TSpartaTransformable',
	#classTraits : 'TSpartaTransformable classTrait',
	#instVars : [
		'matrix'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #properties }
SpTextTransformationAttribute >> applyOnSpartaMatrix: aMatrix with: aSpan [
	aMatrix
		multiplyBy: self transformation
]

{ #category : #initialization }
SpTextTransformationAttribute >> initialize [
	super initialize.
	
	matrix := SpartaMatrix new
]

{ #category : #accessing }
SpTextTransformationAttribute >> transformation [
	^ matrix
]
