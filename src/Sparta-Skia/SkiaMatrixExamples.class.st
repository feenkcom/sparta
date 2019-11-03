Class {
	#name : #SkiaMatrixExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaMatrixExamples >> default [
	<gtExample>
	| aMatrix |
	
	aMatrix := SkiaMatrix new.
	^ aMatrix
]
