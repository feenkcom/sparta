Class {
	#name : #SkiaMatrixPush,
	#superclass : #SkiaTransformationPush,
	#instVars : [
		'matrix'
	],
	#category : #'Sparta-Skia-Utilities'
}

{ #category : #accessing }
SkiaMatrixPush >> matrix [
	^ matrix
]

{ #category : #accessing }
SkiaMatrixPush >> matrix: anObject [
	matrix := anObject
]
