Class {
	#name : #SkiaCapStyleExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaCapStyleExamples >> validateLayout [
	<gtExample>
	<return: #SkiaCapStyleExamples>
	self assert: SkiaCapStyle definedLayout equals: SkiaCapStyle realLayout
]
