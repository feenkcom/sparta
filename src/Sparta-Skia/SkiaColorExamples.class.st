Class {
	#name : #SkiaColorExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaColorExamples >> default [
	<gtExample>
	| aColor |
	
	aColor := SkiaColor new.
	self assert: aColor red equals: 0.
	self assert: aColor green equals: 0.
	self assert: aColor blue equals: 0.
	self assert: aColor alpha equals: 0.
	
	^ aColor
]
