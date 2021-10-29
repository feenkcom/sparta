Class {
	#name : #SkiaAlphaTypeExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : 'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaAlphaTypeExamples >> validateLayout [
	<gtExample>
	
	self assert: SkiaAlphaType definedLayout equals: SkiaAlphaType realLayout
]
