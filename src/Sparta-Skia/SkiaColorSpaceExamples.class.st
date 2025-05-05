Class {
	#name : #SkiaColorSpaceExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaColorSpaceExamples >> default [
	<gtExample>
	<return: #SkiaColorSpace>
	| aColorSpace |
	aColorSpace := SkiaColorSpace new.
	self assert: aColorSpace isSrgb.
	^ aColorSpace
]

{ #category : #accessing }
SkiaColorSpaceExamples >> releaseDefault [
	<gtExample>
	<return: #SkiaColorSpace>
	| aColorSpace |
	aColorSpace := self default.
	aColorSpace release.
	self assert: aColorSpace isSrgb not.

	^ aColorSpace
]
