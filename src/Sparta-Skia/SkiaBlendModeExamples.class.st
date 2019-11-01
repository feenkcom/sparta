Class {
	#name : #SkiaBlendModeExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaBlendModeExamples >> validateLayout [
	<gtExample>

	self assert: SkiaBlendMode definedLayout equals: SkiaBlendMode realLayout
]
