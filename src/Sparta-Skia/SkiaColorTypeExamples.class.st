Class {
	#name : #SkiaColorTypeExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaColorTypeExamples >> validateLayout [
	<gtExample>
	<return: #AssertionFailure>
	self assert: SkiaColorType definedLayout equals: SkiaColorType realLayout
]
