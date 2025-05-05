Class {
	#name : #SkiaClipOpExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaClipOpExamples >> validateLayout [
	<gtExample>
	<return: #SkiaClipOpExamples>
	self assert: SkiaClipOp definedLayout equals: SkiaClipOp realLayout
]
