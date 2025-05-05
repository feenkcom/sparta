Class {
	#name : #SkiaPixelGeometryExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaPixelGeometryExamples >> validateLayout [
	<gtExample>
	<return: #SkiaPixelGeometryExamples>
	self
		assert: SkiaPixelGeometry definedLayout
		equals: SkiaPixelGeometry realLayout
]
