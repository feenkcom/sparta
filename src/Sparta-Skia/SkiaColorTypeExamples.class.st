Class {
	#name : #SkiaColorTypeExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : 'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaColorTypeExamples >> validateLayout [
	<gtExample>
	
	self assert: SkiaColorType definedLayout equals: SkiaColorType realLayout
]
