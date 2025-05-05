Class {
	#name : #SkiaJoinStyleExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaJoinStyleExamples >> validateLayout [
	<gtExample>
	<return: #SkiaJoinStyleExamples>
	self assert: SkiaJoinStyle definedLayout equals: SkiaJoinStyle realLayout
]
