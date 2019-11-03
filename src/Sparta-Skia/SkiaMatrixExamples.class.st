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

{ #category : #accessing }
SkiaMatrixExamples >> fromSpartaTranslationMatrix [
	<gtExample>
	| aSpartaMatrix aSkiaMatrix |
	
	aSpartaMatrix := SpartaMatrix translation: 20@30.
	
	aSkiaMatrix := SkiaMatrix fromSpartaMatrix: aSpartaMatrix.
	
	self assert: aSkiaMatrix asSpartaMatrix equals: aSpartaMatrix.
	
	^ aSkiaMatrix
]
