Class {
	#name : #SkiaPixelGeometryExamples,
	#superclass : #Object,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaPixelGeometryExamples >> validateLayout [
	<gtExample>
	
	self assert: SkiaPixelGeometry definedLayout equals: SkiaPixelGeometry realLayout
]
