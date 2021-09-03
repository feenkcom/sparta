Class {
	#name : 'SkiaJoinStyleExamples',
	#superclass : 'SkiaExternalEnumerationExamples',
	#category : 'Sparta-Skia-Examples'
}

{ #category : 'examples' }
SkiaJoinStyleExamples >> validateLayout [
	<gtExample>

	self assert: SkiaJoinStyle definedLayout equals: SkiaJoinStyle realLayout
]
