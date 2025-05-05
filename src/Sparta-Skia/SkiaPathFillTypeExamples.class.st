Class {
	#name : #SkiaPathFillTypeExamples,
	#superclass : #SkiaExternalEnumerationExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #examples }
SkiaPathFillTypeExamples >> validateLayout [
	<gtExample>
	<return: #SkiaPathFillTypeExamples>
	self assert: SkiaPathFillType definedLayout equals: SkiaPathFillType realLayout
]
