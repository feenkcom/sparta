Class {
	#name : #SkiaFontStyleWidthExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaFontStyleWidthExamples >> validateLayout [
	<gtExample>
	<return: #SkiaFontStyleWidthExamples>
	self
		assert: SkiaFontStyleWidth definedLayout
		equals: SkiaFontStyleWidth realLayout
]
