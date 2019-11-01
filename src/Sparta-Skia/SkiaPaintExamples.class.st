Class {
	#name : #SkiaPaintExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaPaintExamples >> default [
	<gtExample>
	| aPaint |
	
	aPaint := SkiaPaint new.
	self assert: aPaint antiAlias not.
	self assert: aPaint dither not.
	self assert: aPaint paintStyle equals: SkiaPaintStyle Fill.
	self assert: aPaint strokeWidth equals: 0.0.
	self assert: aPaint color equals: Color black.
	
	^ aPaint
]
