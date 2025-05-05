Class {
	#name : #SkiaPaintStyleExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaPaintStyleExamples >> validateLayout [
	<gtExample>
	<return: #SkiaPaintStyleExamples>
	self assert: SkiaPaintStyle definedLayout equals: SkiaPaintStyle realLayout
]
