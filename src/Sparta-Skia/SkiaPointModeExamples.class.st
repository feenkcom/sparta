Class {
	#name : #SkiaPointModeExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaPointModeExamples >> validateLayout [
	<gtExample>
	<return: #SkiaPointModeExamples>
	self assert: SkiaPointMode definedLayout equals: SkiaPointMode realLayout
]
