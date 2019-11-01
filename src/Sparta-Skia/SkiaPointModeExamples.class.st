Class {
	#name : #SkiaPointModeExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaPointModeExamples >> validateLayout [
	<gtExample>
	
	self assert: SkiaPointMode definedLayout equals: SkiaPointMode realLayout
]
