Class {
	#name : 'SkiaFontStyleSlantExamples',
	#superclass : 'SkiaExternalEnumerationExamples',
	#category : 'Sparta-Skia-Examples'
}

{ #category : 'examples' }
SkiaFontStyleSlantExamples >> validateLayout [
	<gtExample>

	self assert: SkiaFontStyleSlant definedLayout equals: SkiaFontStyleSlant realLayout
]
