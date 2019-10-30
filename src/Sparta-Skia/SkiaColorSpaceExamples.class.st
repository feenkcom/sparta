Class {
	#name : #SkiaColorSpaceExamples,
	#superclass : #Object,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaColorSpaceExamples >> default [
	<gtExample>
	| aColorSpace |
	
	aColorSpace := SkiaColorSpace new.
	self assert: aColorSpace isSrgb.
	^ aColorSpace
]

{ #category : #accessing }
SkiaColorSpaceExamples >> releaseDefault [
	<gtExample>
	| aColorSpace |
	
	aColorSpace := self default.
	aColorSpace release.
	self assert: aColorSpace isSrgb not.

	^ aColorSpace
]
