Class {
	#name : #SkiaColorTypeExamples,
	#superclass : #Object,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaColorTypeExamples >> validateLayout [
	<gtExample>
	
	self assert: SkiaColorType definedLayout equals: SkiaColorType realLayout
]
