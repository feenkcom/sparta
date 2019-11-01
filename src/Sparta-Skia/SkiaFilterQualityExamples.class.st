Class {
	#name : #SkiaFilterQualityExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaFilterQualityExamples >> validateLayout [
	<gtExample>
	
	self assert: SkiaFilterQuality definedLayout equals: SkiaFilterQuality realLayout
]
