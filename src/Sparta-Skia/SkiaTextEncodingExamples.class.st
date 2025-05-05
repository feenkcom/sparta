Class {
	#name : #SkiaTextEncodingExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaTextEncodingExamples >> validateLayout [
	<gtExample>
	<return: #SkiaTextEncodingExamples>
	self assert: SkiaTextEncoding definedLayout equals: SkiaTextEncoding realLayout
]
