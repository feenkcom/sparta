Class {
	#name : #SkiaTileModeExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : 'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaTileModeExamples >> validateLayout [
	<gtExample>
	
	self assert: SkiaTileMode definedLayout equals: SkiaTileMode realLayout
]
