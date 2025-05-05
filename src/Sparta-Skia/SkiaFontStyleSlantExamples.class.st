Class {
	#name : #SkiaFontStyleSlantExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaFontStyleSlantExamples >> validateLayout [
	<gtExample>
	<return: #SkiaFontStyleSlantExamples>
	self
		assert: SkiaFontStyleSlant definedLayout
		equals: SkiaFontStyleSlant realLayout
]
